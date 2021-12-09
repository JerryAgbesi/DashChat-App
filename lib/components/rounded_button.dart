import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {required this.label,required this.function, required this.color});

  final String label;
  final VoidCallback function;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed:function,
          
          minWidth: 200.0,
          height: 42.0,
          child:Text(label,
          ),
        ),
      ),
    );
  }
}
