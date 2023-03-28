import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  final String authToken;

  Orders(this.authToken, this._orders);

  List<OrderItem> get orders {
    return [..._orders];
  }

  Future<void> fetchAndSetOrders() async {
    final url = Uri.parse(
        'https://flutter-test-5df42-default-rtdb.firebaseio.com/orders.json?auth=$authToken');
    try {
      final response = await http.get(url);
      print(json.decode(response.body));
      final List<OrderItem> loadedOrders = [];
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((orderId, orderData) {
        loadedOrders.add(OrderItem(
            id: orderId,
            amount: orderData['amount'],
            products: (orderData['products'] as List<dynamic>)
                .map((item) => CartItem(
                    id: item['id'],
                    title: item['title'],
                    quantity: item['quantity'],
                    price: item['price']))
                .toList(),
            dateTime: DateTime.parse(orderData['dateTime'])));
      });
      _orders = loadedOrders.reversed.toList();
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = Uri.parse(
        'https://flutter-test-5df42-default-rtdb.firebaseio.com/orders.json?auth=$authToken');
    final timeStamp = DateTime.now();
    try {
      final response = await http.post(url,
          body: json.encode({
            'amount': total,
            'dateTime': timeStamp.toIso8601String(),
            'products': cartProducts
                .map((cartProduct) => {
                      'id': cartProduct.id,
                      'title': cartProduct.title,
                      'quantity': cartProduct.quantity,
                      'price': cartProduct.price,
                    })
                .toList(),
          }));
      _orders.insert(
        0,
        OrderItem(
          id: json.decode(response.body)['id'],
          amount: total,
          products: cartProducts,
          dateTime: timeStamp,
        ),
      );
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  //   final url = Uri.parse(
  //     'https://flutter-test-5df42-default-rtdb.firebaseio.com/products.json');
  // return http
  //     .post(url,
  //         body: json.encode({
  //           'title': product.title,
  //           'description': product.description,
  //           'imageUrl': product.imageUrl,
  //           'price': product.price,
  //           'isFavorite': product.isFavorite
  //         }))
  //     .then((response) {
  //   print(json.decode(response.body));
  //   final newProduct = Product(
  //       id: json.decode(response.body)['name'],
  //       title: product.title,
  //       description: product.description,
  //       price: product.price,
  //       imageUrl: product.imageUrl);
  //   _items.add(newProduct);
  //   // _items.insert(0, newProduct); insere no inicio do array
  //   notifyListeners();
  // }).catchError((error) {
  //   print(error);
  //   throw error;
  // });
}
