import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';

class CustomSeatCard extends StatelessWidget {
  final MovieModel movie;
  final SeatModel seat;

  const new({super.key, required this.movie, required this.seat});

  @override
  Widget build(BuildContext context) {
    var isPressed = false;
    return InkWell(child:Card(
      color: isPressed
          ? const Color.fromARGB(255, 120, 117, 117)
          : Colors.orangeAccent,
      child: Center(
        child: Text(
          "${seat.seatNumber}",
          style: TextStyle(color: Colors.white),
        ),
      ),
    ) ,);
    
  }
}
//orange free : gray
