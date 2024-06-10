import 'package:flutter/material.dart';

class FunctionIcon extends StatefulWidget {
  const FunctionIcon({
    required this.title,
    required this.navigation,
    required this.icon,
    super.key,
  });

  final String title;
  final Function navigation;
  final IconData icon;

  @override
  State<FunctionIcon> createState() => _FunctionIconState();
}

class _FunctionIconState extends State<FunctionIcon> {
  double _scale = 1.0;

  void _onHover(PointerEvent details) {
    setState(() {
      _scale = 1.05; // Skala powiększenia
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _scale = 1.0; // Skala normalna
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: AnimatedContainer(
        width: 160,
        transform: Matrix4.identity()..scale(_scale, _scale),
        duration: const Duration(seconds: 1),
        //color: Colors.amber,
        child: Column(
          children: [
            MouseRegion(
              onHover: _onHover,
              onExit: _onExit,
              child: GestureDetector(
                onTap: () => widget.navigation(),
                // Action when calendar icon is tapped
                //print('Calendar tapped');

                child: Icon(
                  widget.icon,
                  size: 140,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(widget.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
