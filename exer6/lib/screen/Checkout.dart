// ignore_for_file: file_names

import "package:exer6/model/Item.dart";
import "package:exer6/provider/shoppingcart_provider.dart";
import "package:exer6/screen/MyCart.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    MyCart cart = const MyCart();
    bool isVisible = false;
    List<Item> products = context.watch<ShoppingCart>().cart;
    if (products.isNotEmpty) isVisible = true;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Checkout", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple.shade900,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Item Details",
              style: TextStyle(fontSize: 30),
            ),
          ),
          cart.getItems(context),
          cart.computeCost(),
          Divider(
            height: 4,
            color: Colors.purple.shade900,
            thickness: 2,
          ),
          Visibility(
            visible: isVisible,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Payment Successful!"),
                      duration: Duration(seconds: 1, milliseconds: 100),
                    ));
                    context.read<ShoppingCart>().removeAll();
                    Navigator.pushNamed(context, "/products");
                  },
                  child: const Text("Pay Now!")),
            ),
          ),
        ],
      ),
    );
  }

  Widget noItems() {
    return (const Text("No items to checkout"));
  }
}
