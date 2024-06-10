import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easebuzz/features/payments/services/loading.services.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_easebuzz/core/constants.dart';
import 'package:flutter_easebuzz/features/payments/customer/cutsomer_model.dart';
import 'package:flutter_easebuzz/features/product/model/product.model.dart';
import 'package:toastification/toastification.dart';

part 'payment.services.g.dart';

class PaymentStore = _PaymentStoreBase with _$PaymentStore;

abstract class _PaymentStoreBase with Store {
  @observable
  bool isProductSelected = false;

  @observable
  ProductModel? selectedProduct;

  @action
  void selectProduct({required ProductModel product}) {
    selectedProduct = product;
    isProductSelected = true;
  }

  @action
  void unselectProduct() {
    selectedProduct = null;
    isProductSelected = false;
  }

  @action
  void payViaEaseBuzz(CustomerModel customer, String secretKey) {
    if (!isProductSelected) {
      toastification.show(
        title: const Text("Select Product to Continue"),
        description: const Text("Click on Product Before Proceeding"),
        type: ToastificationType.error,
        showProgressBar: false,
        dragToClose: true,
      );
    }

    try {} catch (e) {
      log(e.toString());
    }
  }
}

Future getKeyFromEasebuzz(
    ProductModel productModel, CustomerModel customer) async {
  final loading = LoadingServices();

  loading.setLoading(true);
  String transactionId = 'test_${DateTime.now().millisecondsSinceEpoch}';
  var bytes = utf8.encode(
      "${Konstants.easebuzzKey}|$transactionId|${productModel.price}|${productModel.description}|${customer.name.split(" ")[0]}|${customer.email}|||||||||||${Konstants.easebuzzSecret}"); // data being hashed

  var hash = sha512.convert(bytes);

  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/x-www-form-urlencoded',
    'Cookie': 'Path=/'
  };
  var data = {
    'key': Konstants.easebuzzKey,
    'txnid': transactionId,
    'amount': productModel.price,
    'productinfo': productModel.description,
    'firstname': customer.name.split(' ')[0],
    'phone': customer.phone,
    'email': customer.email,
    'surl': Konstants.successWebhook,
    'furl': Konstants.failureWebhook,
    'hash': hash.toString(),
  };
  var dio = Dio();
  var response = await dio.request(
    '${Konstants.easebuzzURL}/payment/initiateLink',
    options: Options(
      method: 'POST',
      headers: headers,
    ),
    data: data,
  );
  loading.setLoading(false);

  if (response.statusCode == 200) {
    print(json.encode(response.data['data']));

    return response.data['data'];
  } else {
    log(response.statusMessage.toString());
  }
}
