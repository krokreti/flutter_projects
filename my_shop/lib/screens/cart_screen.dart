import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart;
import '../providers/orders.dart';
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .titleLarge
                              .color),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  OrderButton(cart: cart)
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
              child: ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => CartItem(
              id: cart.items.values.toList()[index].id,
              price: cart.items.values.toList()[index].price,
              quantity: cart.items.values.toList()[index].quantity,
              title: cart.items.values.toList()[index].title,
              productId: cart.items.keys.toList()[index],
            ),
          ))
        ],
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? CircularProgressIndicator()
        : TextButton(
            onPressed: (widget.cart.totalAmount <= 0 || _isLoading)
                ? null
                : () async {
                    setState(() {
                      _isLoading = true;
                    });
                    await Provider.of<Orders>(context, listen: false).addOrder(
                        widget.cart.items.values.toList(),
                        widget.cart.totalAmount);
                    setState(() {
                      _isLoading = false;
                    });
                    widget.cart.clearCart();
                  },
            child: Text(
              'ORDER NOW',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          );
  }
}
