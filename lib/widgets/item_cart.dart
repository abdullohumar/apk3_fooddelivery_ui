// Define a class to hold the item information
import 'package:flutter/material.dart';

class CartItem {
  String title;
  int quantity;
  double price;

  CartItem({required this.title, required this.quantity, required this.price});
}

// Create a stateful widget to manage the cart item
class CartItemWidget extends StatefulWidget {
  final CartItem item;

  const CartItemWidget({super.key, required this.item});

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Display the item title and price
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.item.title),
            Text('\$${widget.item.price}'),
          ],
        ),
        // Create a row to hold the add and subtract buttons
        Row(
          children: [
            // Subtract button
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                if (widget.item.quantity > 1) {
                  setState(() {
                    widget.item.quantity--;
                  });
                }
              },
            ),
            // Display the current quantity
            Text('${widget.item.quantity}'),
            // Add button
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  widget.item.quantity++;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}