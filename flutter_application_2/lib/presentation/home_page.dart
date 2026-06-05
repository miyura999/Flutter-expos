import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fadeAnimation;

  final products = [
    {
      "name": "Laptop",
      "image": "https://picsum.photos/200",
      "price": 2500.0,
      "description": "Laptop potente para trabajo",
    },
    {
      "name": "Celular",
      "image": "https://picsum.photos/201",
      "price": 1200.0,
      "description": "Smartphone moderno",
    },
  ];

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(controller);

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Route _createRoute(Map product) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => DetailPage(product: product),
      transitionsBuilder: (_, animation, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Catálogo Animado")),
      body: Column(
        children: [
          // 🔥 Logo animado
          AnimatedBuilder(
            animation: fadeAnimation,
            builder: (_, __) {
              return Opacity(
                opacity: fadeAnimation.value,
                child: const Icon(Icons.shopping_cart, size: 80),
              );
            },
          ),

          Expanded(
            child: ListView(
              children: products.map((product) {
                return ProductCard(
                  product: product,
                  onDetails: () {
                    Navigator.push(context, _createRoute(product));
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
