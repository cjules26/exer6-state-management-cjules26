// ignore_for_file: file_names

import "package:exer6/screen/MyCart.dart";
import "package:flutter/material.dart";

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    MyCart cart = const MyCart();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple.shade900,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Item Details",
              style: TextStyle(fontSize: 28),
            ),
          ),
          cart.getItems(context),
          cart.computeCost(),
          const Divider(height: 4, color: Colors.black),
          Flexible(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Payment Successful!"),
                          duration: Duration(seconds: 1, milliseconds: 100),
                        ));
                      },
                      child: const Text("Pay Now!")),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
