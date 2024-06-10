// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_easebuzz/core/spacing.dart';
import 'package:flutter_easebuzz/core/themes.dart';
import 'package:flutter_easebuzz/features/payments/customer/cutsomer_model.dart';
import 'package:flutter_easebuzz/features/payments/services/loading.services.dart';
import 'package:flutter_easebuzz/features/product/product.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../payments/services/payment.services.dart';
import '../product/model/product.model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final easebuzzSecretForm = GlobalKey<FormState>();

  final nameController = TextEditingController(text: 'Subrata Porwal');

  final emailController = TextEditingController(text: 'subratabuddy@gmail.com');

  final phoneController = TextEditingController(text: '9163482078');
  final payment = PaymentStore();
  final loading = LoadingServices();
  final MethodChannel _channel = const MethodChannel("easebuzz");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Easebuzz Demo"),
        ),
        body: SafeArea(
          child: Observer(
            builder: (_) => SingleChildScrollView(
              child: Padding(
                padding: AppTheme.scaffoldPadding,
                child: Form(
                  key: easebuzzSecretForm,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ProductWidget(
                          isProductSelected: payment.isProductSelected,
                          onTap: () {
                            if (payment.isProductSelected) {
                              payment.unselectProduct();
                            } else {
                              payment.selectProduct(
                                product: ProductModel(
                                  id: 1,
                                  name: 'T-Shirt',
                                  price: 200,
                                  description: 'T-Shirt Description',
                                ),
                              );
                            }
                          }),
                      Spacing.h12px,
                      textFieldWithHeading(
                        heading: 'Name',
                        hintText: 'Enter Customer Name',
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        icon: Icons.person,
                        onChanged: (v) {},
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'Please Enter Name';
                          }

                          return null;
                        },
                      ),
                      textFieldWithHeading(
                        heading: 'Email',
                        hintText: 'Enter Customer Email',
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        icon: Icons.email,
                        onChanged: (v) {},
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'Please Enter Email';
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(v)) {
                            return 'Please Enter Valid Email';
                          }
                          return null;
                        },
                      ),
                      textFieldWithHeading(
                        heading: 'Phone',
                        hintText: 'Enter Customer Phone',
                        keyboardType: TextInputType.phone,
                        icon: Icons.call,
                        controller: phoneController,
                        onChanged: (v) {},
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'Please Enter Phone';
                          }
                          if (!RegExp(
                                  r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                              .hasMatch(v)) {
                            return 'Please Enter Valid Phone';
                          }
                          return null;
                        },
                      ),
                      Spacing.h12px,
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: loading.isLoading
                              ? null
                              : () async {
                                  if (easebuzzSecretForm.currentState!
                                      .validate()) {
                                    CustomerModel customer = CustomerModel(
                                      name: nameController.text,
                                      email: emailController.text,
                                      phone: phoneController.text,
                                    );

                                    var data = await getKeyFromEasebuzz(
                                        payment.selectedProduct!, customer);
                                    String accessKey = data;
                                    String payMode = "test";
                                    Object parameters = {
                                      "access_key": accessKey,
                                      "pay_mode": payMode
                                    };
                                    final paymentResponse =
                                        await _channel.invokeMethod(
                                            "payWithEasebuzz", parameters);

                                    print(paymentResponse);
                                  }
                                },
                          child: loading.isLoading
                              ? AppTheme.loadingIndicator(
                                  loadingColor: Colors.white)
                              : const Text("Pay"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
