import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_sample/core/themes/app_colors.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/bag.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/payment_method.dart';
import 'package:flutter_ecommerce_sample/features/ecommerce/domain/entities/product.dart';

import 'emums/product_colors.dart';
import 'emums/product_sizes.dart';

class Order {
  static int currentNumber = 1947033;
  static int currentTrackingNumber = 2475453454;

  static int newNumber() => ++currentNumber;
  static int newTrackingNumber() => ++currentTrackingNumber;

  late final int _number;
  late final int _trackingNumber;
  late final DateTime date;
  final double totalAmount;
  final List<OrderItem> items;
  final CardType cardType;
  final String cardNumber;
  final String discount;
  final String deliveryMethod;
  final String deliveryAddress;
  late OrderStatus status;
  Order({
    required this.totalAmount,
    required this.items,
    required this.cardType,
    required this.cardNumber,
    required this.discount,
    required this.deliveryMethod,
    required this.deliveryAddress,
  }) {
    _number = newNumber();
    _trackingNumber = newTrackingNumber();
    date = DateTime.now();
    status = OrderStatuses.processing;
  }

  String get number => _number.toString();
  String get trackingNumber => "IW$_trackingNumber";

  factory Order.fromBag(Bag bag) {
    List<OrderItem> items = List.generate(
        bag.itemCount,
        (index) => OrderItem(
            product: bag.getItem(index).product,
            size: bag.getItem(index).size,
            color: bag.getItem(index).color,
            count: bag.getItem(index).count,
            sum: bag.getItem(index).sum)).toList();
    return Order(
      totalAmount: bag.totalSum,
      items: items,
      cardType: bag.paymentMethod!.cardType,
      cardNumber: bag.paymentMethod!.cardNumberPresentation,
      discount: bag.promocode?.presentation ?? "",
      deliveryMethod: bag.deliveryMethod!.presentation,
      deliveryAddress: bag.deliveryAddress!.presentation,
    );
  }

  double get quantyty {
    double quantyty = 0;
    for (OrderItem orderItem in items) {
      quantyty += orderItem.count;
    }
    return quantyty;
  }
}

class OrderItem {
  final Product product;
  final ProductSize size;
  final ProductColor color;
  final double count;
  final double sum;
  OrderItem({
    required this.product,
    required this.size,
    required this.color,
    required this.count,
    required this.sum,
  });
}

class OrderStatuses {
  static final OrderStatus processing = OrderStatus(
    name: "Processing",
    color: AppColors.red,
  );
  static final OrderStatus delivered = OrderStatus(
    name: "Delivered",
    color: AppColors.green,
  );
  static final OrderStatus cancelled = OrderStatus(
    name: "Cancelled",
    color: AppColors.grayText,
  );

  static List<OrderStatus> get values => [processing, delivered, cancelled];
}

class OrderStatus {
  final String name;
  final Color color;
  OrderStatus({
    required this.name,
    required this.color,
  });
}
