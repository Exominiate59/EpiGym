    import 'package:flutter/material.dart';

    Widget createCustomButton({
      required BuildContext context,
      required double x,
      required double y,
      required double width,
      required double height,
      required String text,
      required Color color,
      required VoidCallback onTap,
    }) {
      return Positioned(
        left: x,
        top: y,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    }
