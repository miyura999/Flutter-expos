import 'package:flutter/material.dart';
import 'staggered_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detalle")),
      body: const Center(child: StaggeredAnimationWidget()),
    );
  }
}
