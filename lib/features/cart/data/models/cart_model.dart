import 'package:equatable/equatable.dart';

import 'data.dart';

class CartModel extends Equatable {
  final String? status;
  final int? numOfCartItems;
  final Data? data;

  const CartModel({this.status, this.numOfCartItems, this.data});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        status: json['status'] as String?,
        numOfCartItems: json['numOfCartItems'] as int?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'numOfCartItems': numOfCartItems,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [status, numOfCartItems, data];
}
