import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String text;
  final void Function()? onTap;

  const MyButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _handleTapDown(),
      onTapUp: (_) => _handleTapUp(),
      onTapCancel: _handleTapCancel,
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        decoration: BoxDecoration(
          color: _isPressed
              ? Color.fromARGB(255, 64, 131, 96) // Цвет при нажатии
              : Color.fromARGB(255, 84, 171, 126), // Исходный цвет
          borderRadius: BorderRadius.circular(40),
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  void _handleTapDown() {
    setState(() {
      _isPressed = true;
    });
  }

  void _handleTapUp() {
    setState(() {
      _isPressed = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }
}
