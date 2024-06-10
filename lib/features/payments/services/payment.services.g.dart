// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.services.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentStore on _PaymentStoreBase, Store {
  late final _$isProductSelectedAtom =
      Atom(name: '_PaymentStoreBase.isProductSelected', context: context);

  @override
  bool get isProductSelected {
    _$isProductSelectedAtom.reportRead();
    return super.isProductSelected;
  }

  @override
  set isProductSelected(bool value) {
    _$isProductSelectedAtom.reportWrite(value, super.isProductSelected, () {
      super.isProductSelected = value;
    });
  }

  late final _$selectedProductAtom =
      Atom(name: '_PaymentStoreBase.selectedProduct', context: context);

  @override
  ProductModel? get selectedProduct {
    _$selectedProductAtom.reportRead();
    return super.selectedProduct;
  }

  @override
  set selectedProduct(ProductModel? value) {
    _$selectedProductAtom.reportWrite(value, super.selectedProduct, () {
      super.selectedProduct = value;
    });
  }

  late final _$_PaymentStoreBaseActionController =
      ActionController(name: '_PaymentStoreBase', context: context);

  @override
  void selectProduct({required ProductModel product}) {
    final _$actionInfo = _$_PaymentStoreBaseActionController.startAction(
        name: '_PaymentStoreBase.selectProduct');
    try {
      return super.selectProduct(product: product);
    } finally {
      _$_PaymentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void unselectProduct() {
    final _$actionInfo = _$_PaymentStoreBaseActionController.startAction(
        name: '_PaymentStoreBase.unselectProduct');
    try {
      return super.unselectProduct();
    } finally {
      _$_PaymentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void payViaEaseBuzz(CustomerModel customer, String secretKey) {
    final _$actionInfo = _$_PaymentStoreBaseActionController.startAction(
        name: '_PaymentStoreBase.payViaEaseBuzz');
    try {
      return super.payViaEaseBuzz(customer, secretKey);
    } finally {
      _$_PaymentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isProductSelected: ${isProductSelected},
selectedProduct: ${selectedProduct}
    ''';
  }
}
