import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../payments/services/payment.services.dart';

class NextScreen extends StatelessWidget {
  NextScreen({super.key});
  final payment = PaymentStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Observer(builder: (_) {
        return Text(payment.selectedProduct?.name ?? "abc");
      }),
    );
  }
}
