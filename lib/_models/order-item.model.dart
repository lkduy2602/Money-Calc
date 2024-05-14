import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:money_calc/_enums/order-item.enum.dart';

class OrderItemModel {
  int productId = 0;
  String name = '';
  int price;
  int quantity;

  OrderItemModel({
    required this.price,
    required this.quantity,
  });

  static OrderItemModel defaultOrderItem() {
    return OrderItemModel(price: 0, quantity: 0);
  }
}

class OrderItemRepository extends ChangeNotifier {
  final List<OrderItemModel> _orderItems = [
    OrderItemModel.defaultOrderItem(),
  ];
  UnmodifiableListView<OrderItemModel> get orderItems =>
      UnmodifiableListView(_orderItems);

  int _totalPrice = 0;
  int get totalPrice => _totalPrice;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  OrderItemSelectedField _selectedField = OrderItemSelectedField.price;
  OrderItemSelectedField get selectedField => _selectedField;

  void reset() {
    _orderItems.clear();

    final OrderItemModel orderItem = OrderItemModel.defaultOrderItem();

    _orderItems.add(orderItem);
    _totalPrice = 0;
    _currentIndex = 0;
    _selectedField = OrderItemSelectedField.price;

    notifyListeners();
  }

  void removeCurrentOrderItem() {
    if (_currentIndex == 0) {
      return reset();
    }

    final OrderItemModel orderItem = _orderItems[_currentIndex];
    _orderItems.removeAt(_currentIndex);
    _totalPrice -= (orderItem.price * orderItem.quantity);
    _currentIndex--;
    _selectedField = OrderItemSelectedField.price;

    notifyListeners();
  }

  void increaseQuantity(int index) {
    if (_orderItems[index].quantity >= 999) {
      _orderItems[index].quantity = 999;
    } else {
      final OrderItemModel orderItem = _orderItems[index];
      _orderItems[index].quantity++;
      _totalPrice += orderItem.price;
    }

    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (_orderItems[index].quantity <= 1) {
      _orderItems[index].quantity = 1;
    } else {
      final OrderItemModel orderItem = _orderItems[index];
      _orderItems[index].quantity--;
      _totalPrice -= orderItem.price;
    }

    notifyListeners();
  }

  void calcButtonPressed(String buttonValue) {
    final OrderItemModel orderItem = _orderItems[_currentIndex];
    final int price = orderItem.price;
    final int quantity = orderItem.quantity;

    if (_selectedField == OrderItemSelectedField.price) {
      final String newPrice = price.toString() + buttonValue;
      final int intPrice = int.parse(newPrice);
      if (intPrice > 999999999) return;

      _orderItems[_currentIndex].price = intPrice;
      _updateTotalPrice(
          oldPrice: price,
          oldQuantity: quantity,
          newPrice: intPrice,
          newQuantity: quantity);
    } else if (_selectedField == OrderItemSelectedField.quantity) {
      final String newQuantity = quantity.toString() + buttonValue;
      int intQuantity = int.parse(newQuantity);
      if (intQuantity > 9999) return;

      if (intQuantity == 0) {
        intQuantity = int.parse(buttonValue);
      }

      _orderItems[_currentIndex].quantity = intQuantity;
      _updateTotalPrice(
          oldPrice: price,
          oldQuantity: quantity,
          newPrice: price,
          newQuantity: intQuantity);
    }

    notifyListeners();
  }

  void calcButtonBackSpacePressed() {
    final OrderItemModel orderItem = _orderItems[_currentIndex];
    final int price = orderItem.price;
    final int quantity = orderItem.quantity;

    if (_selectedField == OrderItemSelectedField.price) {
      if (price == 0) return;

      final int newPrice = orderItem.price ~/ 10;
      _orderItems[_currentIndex].price = newPrice;
      _updateTotalPrice(
          oldPrice: price,
          oldQuantity: quantity,
          newPrice: newPrice,
          newQuantity: quantity);
    } else if (_selectedField == OrderItemSelectedField.quantity) {
      if (quantity == 1) return;

      final int newQuantity = quantity ~/ 10;
      _orderItems[_currentIndex].quantity = newQuantity;
      _updateTotalPrice(
          oldPrice: price,
          oldQuantity: quantity,
          newPrice: price,
          newQuantity: newQuantity);
    }

    notifyListeners();
  }

  void switchSelectedFields() {
    if (_selectedField == OrderItemSelectedField.price) {
      _selectedField = OrderItemSelectedField.quantity;
    } else if (_selectedField == OrderItemSelectedField.quantity) {
      _selectedField = OrderItemSelectedField.price;
    }

    notifyListeners();
  }

  void calcButtonPlusPressed() {
    final OrderItemModel orderItem = OrderItemModel.defaultOrderItem();
    final OrderItemModel currentOrderItem = _orderItems[_currentIndex];

    if (currentOrderItem.quantity == 0) {
      _orderItems[_currentIndex].quantity = 1;
      _totalPrice += currentOrderItem.price;
    }

    _orderItems.add(orderItem);
    _currentIndex++;
    _selectedField = OrderItemSelectedField.price;

    notifyListeners();
  }

  void changeSign() {
    final OrderItemModel orderItem = _orderItems[_currentIndex];
    final int newPrice = -orderItem.price;

    _orderItems[_currentIndex].price = newPrice;

    _updateTotalPrice(
        oldPrice: orderItem.price,
        oldQuantity: orderItem.quantity,
        newPrice: newPrice,
        newQuantity: orderItem.quantity);

    notifyListeners();
  }

  void _updateTotalPrice({
    required int oldPrice,
    required int oldQuantity,
    required int newPrice,
    required int newQuantity,
  }) {
    _totalPrice =
        _totalPrice - (oldPrice * oldQuantity) + (newPrice * newQuantity);
  }
}
