import 'package:flutter/material.dart';

class StaggeredAnimationWidget extends StatefulWidget {
  const StaggeredAnimationWidget({super.key});

  @override
  State<StaggeredAnimationWidget> createState() =>
      _StaggeredAnimationWidgetState();
}

class _StaggeredAnimationWidgetState extends State<StaggeredAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> imageOpacity;
  late Animation<double> textOpacity;
  late Animation<double> buttonOpacity;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    imageOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.3)),
    );

    textOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.3, 0.6)),
    );

    buttonOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: const Interval(0.6, 1.0)),
    );

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildAnimated(Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.5),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildAnimated(imageOpacity, Image.network("https://picsum.photos/200")),

        buildAnimated(
          textOpacity,
          const Text("Título Animado", style: TextStyle(fontSize: 20)),
        ),

        buildAnimated(
          buttonOpacity,
          ElevatedButton(onPressed: () {}, child: const Text("Acción")),
        ),
      ],
    );
  }
}
