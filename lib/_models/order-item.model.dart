import 'dart:collection';

import 'package:flutter/material.dart';

class OrderItemModel {
  final int id;
  final String name;
  int price;
  int quantity;

  OrderItemModel({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });
}

class OrderItemRepository extends ChangeNotifier {
  final List<OrderItemModel> _orderItems = [
    OrderItemModel(id: 0, name: '', price: 0, quantity: 0),
  ];
  UnmodifiableListView<OrderItemModel> get orderItems =>
      UnmodifiableListView(_orderItems);

  int _totalPrice = 0;
  int get totalPrice => _totalPrice;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void reset() {
    _orderItems[0] = OrderItemModel(
      id: 0,
      name: '',
      price: 0,
      quantity: 0,
    );
    _totalPrice = 0;
    _currentIndex = 0;
  }

  void add(OrderItemModel orderItem) {
    if (_orderItems.length == 1) {
      orderItems[0] = orderItem;
      _totalPrice = orderItem.price;
    } else {
      _orderItems.add(orderItem);
      _totalPrice += orderItem.price * orderItem.quantity;
    }

    notifyListeners();
  }

  void updatePrice(int index, int price) {
    final oldPrice = _orderItems[index].price;
    final quantity = _orderItems[index].quantity;

    _orderItems[index].price = price;
    _totalPrice = _totalPrice - (oldPrice * quantity) + (price * quantity);

    notifyListeners();
  }

  void remove(int index) {
    if (_orderItems.length == 1) {
      _orderItems[0] = OrderItemModel(
        id: 0,
        name: '',
        price: 0,
        quantity: 0,
      );
      _totalPrice = 0;
    } else {
      final orderItem = _orderItems[index];
      _orderItems.removeAt(index);
      _totalPrice -= orderItem.price * orderItem.quantity;
    }

    notifyListeners();
  }

  void addQuantity(int index) {
    if (_orderItems[index].quantity >= 999) {
      _orderItems[index].quantity = 999;
    } else {
      final orderItem = _orderItems[index];
      _orderItems[index].quantity++;
      _totalPrice += orderItem.price;
    }

    notifyListeners();
  }

  void subQuantity(int index) {
    print(index);
    if (_orderItems[index].quantity <= 1) {
      _orderItems[index].quantity = 1;
    } else {
      final orderItem = _orderItems[index];
      _orderItems[index].quantity--;
      _totalPrice -= orderItem.price;
    }

    notifyListeners();
  }
}
