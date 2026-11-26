import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';

class CustomSeatCard extends StatelessWidget {
  final String seatNumber;
  final String status;
  final VoidCallback onTap;

  const new({
    super.key,
    required this.seatNumber,
    required this.status,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    var isPressed = false;
    return InkWell(
      onTap: onTap,
      child: Card(
        color: status == "Available"
            ? const Color.fromARGB(255, 158, 134, 103)
            : const Color.fromARGB(255, 59, 105, 83),
        child: Center(
          child: Text("${seatNumber}", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
//orange free : gray
