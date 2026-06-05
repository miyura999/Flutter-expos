import 'package:flutter/material.dart';

class StaggeredMenu extends StatefulWidget {
  const StaggeredMenu({super.key});

  @override
  State<StaggeredMenu> createState() => _StaggeredMenuState();
}

class _StaggeredMenuState extends State<StaggeredMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isOpen = false;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children:
          List.generate(4, (index) {
            final animation = Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: controller,
                curve: Interval(index * 0.2, 1.0),
              ),
            );

            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween(
                  begin: const Offset(0, 0.5),
                  end: Offset.zero,
                ).animate(animation),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: FloatingActionButton(
                    mini: true,
                    onPressed: () {},
                    child: Text("${index + 1}"),
                  ),
                ),
              ),
            );
          })..add(
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  isOpen = !isOpen;
                  isOpen ? controller.forward() : controller.reverse();
                });
              },
              child: const Icon(Icons.menu),
            ),
          ),
    );
  }
}
