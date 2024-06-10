import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import '../../core/color_palette.dart';
import '../../core/spacing.dart';
import '../../core/themes.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProductWidget extends StatelessWidget {
  final Function onTap;

  final bool isProductSelected;
  ProductWidget(
      {super.key, required this.onTap, required this.isProductSelected});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: AppTheme.containerRadius,
                  color: ColorPalette.white500,
                  border: Border.all(
                    color: AppTheme.primaryColor,
                    width: 2,
                    style: isProductSelected
                        ? BorderStyle.solid
                        : BorderStyle.none,
                  )),
              child: ListTile(
                selected: isProductSelected,
                onTap: () {
                  onTap();
                },
                selectedColor: AppTheme.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: AppTheme.containerRadius,
                ),
                style: ListTileStyle.drawer,
                leading: const PhosphorIcon(
                  PhosphorIconsDuotone.tShirt,
                  size: 40,
                  color: AppTheme.primaryColor,
                ),
                title: const Text(
                  'T-Shirt Product',
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                subtitle: const Text(
                  'T-Shirt Description',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                trailing: const Text(
                  "₹ 200",
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Spacing.h12px,
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: AppTheme.containerRadius,
                color: isProductSelected
                    ? ColorPalette.success500
                    : ColorPalette.error500,
              ),
              child: Text(
                isProductSelected
                    ? "One Product Selected"
                    : "No Product Selected",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
