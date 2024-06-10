import 'package:hive_flutter/hive_flutter.dart';

part 'cutsomer_model.g.dart';

@HiveType(typeId: 0)
class CustomerModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String phone;

  CustomerModel({
    required this.name,
    required this.email,
    required this.phone,
  });
}
