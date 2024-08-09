import 'dart:developer';
import 'package:flutter/material.dart';
import '../../../home/data/model/product_model/datum.dart';
import 'widgets/product_details_view_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productDetails});
  final Datum productDetails;
  static const String routeName = '/product_details_view';
  @override
  Widget build(BuildContext context) {
    log('productDetails: $productDetails');
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Product Details'),
      ),
      body: ProductDetailsViewBody(productDetails: productDetails),
    );
  }
}
