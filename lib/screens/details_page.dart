import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text(
          "Booking Details",
          style: TextStyle(
            color: Colors.white,
            fontWeight: .bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 44, 16, 93),
      ),
    );
  }
}
