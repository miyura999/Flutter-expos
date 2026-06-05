import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Galería Animada")),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              title: Text("Imagen $index"),
              trailing: ElevatedButton(
                child: const Text("Ver"),
                onPressed: () {
                  Navigator.push(context, _createRoute());
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: const StaggeredMenu(),
    );
  }

  // 🔥 Page Route Animation
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const DetailPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(1.0, 0.0);
        var end = Offset.zero;

        var curve = Curves.ease;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    );
  }
}
