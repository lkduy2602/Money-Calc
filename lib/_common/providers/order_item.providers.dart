import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:money_calc/_common/enums/providers.enum.dart';

class OrderItem {
  int productId = 0;
  String name = '';
  int price;
  int quantity;

  OrderItem({
    required this.price,
    required this.quantity,
  });

  static OrderItem defaultOrderItem() {
    return OrderItem(price: 0, quantity: 0);
  }
}

class OrderItemProvider extends ChangeNotifier {
  final List<OrderItem> _orderItems = [
    OrderItem.defaultOrderItem(),
  ];
  UnmodifiableListView<OrderItem> get orderItems => UnmodifiableListView(_orderItems);

  int _totalPrice = 0;
  int get totalPrice => _totalPrice;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  OrderItemSelectedFieldEnum _selectedField = OrderItemSelectedFieldEnum.price;
  OrderItemSelectedFieldEnum get selectedField => _selectedField;

  void reset() {
    _orderItems.clear();

    final OrderItem orderItem = OrderItem.defaultOrderItem();

    _orderItems.add(orderItem);
    _totalPrice = 0;
    _currentIndex = 0;
    _selectedField = OrderItemSelectedFieldEnum.price;

    notifyListeners();
  }

  void removeCurrentOrderItem() {
    if (_currentIndex == 0) {
      return reset();
    }

    final OrderItem orderItem = _orderItems[_currentIndex];
    _orderItems.removeAt(_currentIndex);
    _totalPrice -= (orderItem.price * orderItem.quantity);
    _currentIndex--;
    _selectedField = OrderItemSelectedFieldEnum.price;

    notifyListeners();
  }

  void increaseQuantity(int index) {
    if (_orderItems[index].quantity >= 999) {
      _orderItems[index].quantity = 999;
    } else {
      final OrderItem orderItem = _orderItems[index];
      _orderItems[index].quantity++;
      _totalPrice += orderItem.price;
    }

    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if (_orderItems[index].quantity <= 1) {
      _orderItems[index].quantity = 1;
    } else {
      final OrderItem orderItem = _orderItems[index];
      _orderItems[index].quantity--;
      _totalPrice -= orderItem.price;
    }

    notifyListeners();
  }

  void calcButtonPressed(String buttonValue) {
    final OrderItem orderItem = _orderItems[_currentIndex];
    final int price = orderItem.price;
    final int quantity = orderItem.quantity;

    if (_selectedField == OrderItemSelectedFieldEnum.price) {
      final String newPrice = price.toString() + buttonValue;
      final int intPrice = int.parse(newPrice);
      if (intPrice > 999999999) return;

      _orderItems[_currentIndex].price = intPrice;
      _updateTotalPrice(oldPrice: price, oldQuantity: quantity, newPrice: intPrice, newQuantity: quantity);
    } else if (_selectedField == OrderItemSelectedFieldEnum.quantity) {
      final String newQuantity = quantity.toString() + buttonValue;
      int intQuantity = int.parse(newQuantity);
      if (intQuantity > 9999) return;

      if (intQuantity == 0) {
        intQuantity = int.parse(buttonValue);
      }

      _orderItems[_currentIndex].quantity = intQuantity;
      _updateTotalPrice(oldPrice: price, oldQuantity: quantity, newPrice: price, newQuantity: intQuantity);
    }

    notifyListeners();
  }

  void calcButtonBackSpacePressed() {
    final OrderItem orderItem = _orderItems[_currentIndex];
    final int price = orderItem.price;
    final int quantity = orderItem.quantity;

    if (_selectedField == OrderItemSelectedFieldEnum.price) {
      if (price == 0) return;

      final int newPrice = orderItem.price ~/ 10;
      _orderItems[_currentIndex].price = newPrice;
      _updateTotalPrice(oldPrice: price, oldQuantity: quantity, newPrice: newPrice, newQuantity: quantity);
    } else if (_selectedField == OrderItemSelectedFieldEnum.quantity) {
      if (quantity == 1) return;

      final int newQuantity = quantity ~/ 10;
      _orderItems[_currentIndex].quantity = newQuantity;
      _updateTotalPrice(oldPrice: price, oldQuantity: quantity, newPrice: price, newQuantity: newQuantity);
    }

    notifyListeners();
  }

  void switchSelectedFields() {
    if (_selectedField == OrderItemSelectedFieldEnum.price) {
      _selectedField = OrderItemSelectedFieldEnum.quantity;
    } else if (_selectedField == OrderItemSelectedFieldEnum.quantity) {
      _selectedField = OrderItemSelectedFieldEnum.price;
    }

    notifyListeners();
  }

  void calcButtonPlusPressed() {
    final OrderItem orderItem = OrderItem.defaultOrderItem();
    final OrderItem currentOrderItem = _orderItems[_currentIndex];

    if (currentOrderItem.quantity == 0) {
      _orderItems[_currentIndex].quantity = 1;
      _totalPrice += currentOrderItem.price;
    }

    _orderItems.add(orderItem);
    _currentIndex++;
    _selectedField = OrderItemSelectedFieldEnum.price;

    notifyListeners();
  }

  void changeSign() {
    final OrderItem orderItem = _orderItems[_currentIndex];
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
    _totalPrice = _totalPrice - (oldPrice * oldQuantity) + (newPrice * newQuantity);
  }
}
