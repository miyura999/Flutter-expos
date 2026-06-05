import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map product;

  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product["name"])),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: product["name"],
              child: Image.network(product["image"], height: 200),
            ),

            Text(product["name"], style: const TextStyle(fontSize: 24)),
            Text(product["description"]),
            Text("\$${product["price"]}"),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Regresar"),
            ),
          ],
        ),
      ),
    );
  }
}
