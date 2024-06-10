import 'package:hive_flutter/hive_flutter.dart';
import '../features/product/model/product.model.dart';

class DB {
  static String openproductBox = "product_box";

  static final productBox = Hive.box(DB.openproductBox);

  void createProduct(ProductModel data) {
    int length = productBox.length;

    // Add to DB
    productBox.put(length, data);
  }

  void deleteProduct(int id) async {
    await productBox.delete(id);
  }
}
