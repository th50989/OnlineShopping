import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyDetail extends StatefulWidget {
  const MyDetail(
      {super.key, required this.url, required this.dongia, required this.ten});
  final String url;
  final int dongia;
  final String ten;
  @override
  State<MyDetail> createState() => _MyDetailState();
}

class _MyDetailState extends State<MyDetail> {
  void addData() async {
    // Reference to Firestore collection
    CollectionReference collection =
        FirebaseFirestore.instance.collection('Orders');

    // Data to be added
    Map<String, dynamic> data = {
      'Ten': widget.ten,
      'Gia': widget.dongia,
      'URL': widget.url
    };

    // Add data to Firestore
    try {
      await collection.add(data);

      // Show "Order Success" popup
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Order Success"),
          content: Text("Your order has been placed successfully."),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    } catch (e) {
      // Show error message
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.ten)),
      body: Column(children: [
        Image.network(widget.url),
        Text(widget.ten),
        Text(widget.dongia.toString()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  addData();
                },
                child: const Icon(Icons.shopping_cart)),
          ],
        )
      ]),
    );
  }
}
