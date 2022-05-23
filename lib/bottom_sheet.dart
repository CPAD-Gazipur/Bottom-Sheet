import 'package:flutter/material.dart';

class BottomSheetAnimation extends StatefulWidget {
  const BottomSheetAnimation({Key? key}) : super(key: key);

  @override
  _BottomSheetAnimationState createState() => _BottomSheetAnimationState();
}

class _BottomSheetAnimationState extends State<BottomSheetAnimation>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = BottomSheet.createAnimationController(this);
    controller.duration = const Duration(milliseconds: 500);
    controller.reverseDuration = const Duration(milliseconds: 500);
    controller.drive(CurveTween(curve: Curves.easeIn));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomSheet Animation Speed'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("BottomSheet"),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              enableDrag: true,
              isScrollControlled: true,
              transitionAnimationController: controller,
              builder: (BuildContext context) {
                return Container(
                  height: 220,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.account_circle),
                        title: const Text("Profile"),
                        selectedTileColor: Colors.green[400],
                      ),
                      ListTile(
                        leading: const Icon(Icons.settings),
                        title: const Text("Settings"),
                        selectedTileColor: Colors.green[400],
                      ),
                      ListTile(
                        leading: const Icon(Icons.accessibility_outlined),
                        title: const Text("About"),
                        selectedTileColor: Colors.green[400],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
