import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';

import '../models/shoe.dart';

class CartItem extends StatefulWidget {
  shoe shoes;
  CartItem({super.key, required this.shoes});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void FromDeleteToCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoes);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: ListTile(
          leading: Image.asset(widget.shoes.imagePath),
          title: Text(widget.shoes.name),
          subtitle: Text(widget.shoes.price),
          trailing: IconButton(
            onPressed: FromDeleteToCart,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
              size: 24,
            ),
          ),
        ));
  }
}
