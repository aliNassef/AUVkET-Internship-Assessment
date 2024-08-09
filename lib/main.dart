import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/DI/dependency_injection.dart';
import 'ecommerce_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await setupGetIt();
  runApp(const EcommerceApp());
}
