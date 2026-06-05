import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final Map product;
  final VoidCallback onDetails;

  const ProductCard({
    super.key,
    required this.product,
    required this.onDetails,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool expanded = false;
  bool showInfo = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          expanded = !expanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        color: expanded ? Colors.blue[100] : Colors.white,

        child: Column(
          children: [
            Hero(
              tag: widget.product["name"],
              child: Image.network(widget.product["image"], height: 80),
            ),

            Text(widget.product["name"]),
            Text("\$${widget.product["price"]}"),

            ElevatedButton(
              onPressed: widget.onDetails,
              child: const Text("Ver Detalles"),
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  showInfo = !showInfo;
                });
              },
              child: const Text("Mostrar Información"),
            ),

            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: showInfo ? 1 : 0,
              child: Text(widget.product["description"]),
            ),
          ],
        ),
      ),
    );
  }
}
