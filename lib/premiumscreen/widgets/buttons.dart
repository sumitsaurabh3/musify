import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key, required this.text});
  final String text;

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
      child: Padding(
        padding: const EdgeInsets.only(left: 70.0,right: 70),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          child: Text(
            widget.text,
            style:
                TextStyle(color: Colors.black, fontSize: 16, letterSpacing: 2),
          ),
        ),
      ),
    );
  }
}
