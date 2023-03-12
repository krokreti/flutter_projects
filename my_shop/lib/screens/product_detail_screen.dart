import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  final String id;

  const ProductDetailScreen({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    // ...
    return Scaffold(
      appBar: AppBar(title: Text('title')),
    );
  }
}
