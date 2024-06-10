// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Spacing {
  Spacing._();

  static const h4px = SizedBox(height: 4);
  static const h8px = SizedBox(height: 9);
  static const h12px = SizedBox(height: 12);
  static const h16px = SizedBox(height: 16);
  static const h24px = SizedBox(height: 24);
  static const h32px = SizedBox(height: 32);
  static const h40px = SizedBox(height: 40);
  static const h48px = SizedBox(height: 48);
  static const h56px = SizedBox(height: 56);
  static const h72px = SizedBox(height: 72);
  static const h80px = SizedBox(height: 80);

  static const w4px = SizedBox(width: 4);
  static const w8px = SizedBox(width: 9);
  static const w12px = SizedBox(width: 12);
  static const w16px = SizedBox(width: 16);
  static const w24px = SizedBox(width: 24);
  static const w32px = SizedBox(width: 32);
  static const w40px = SizedBox(width: 40);
  static const w48px = SizedBox(width: 48);
  static const w56px = SizedBox(width: 56);
  static const w72px = SizedBox(width: 72);
  static const w80px = SizedBox(width: 80);

  static width(double width) => SizedBox(
        width: width,
      );

  static height(double height) => SizedBox(
        height: height,
      );
}
