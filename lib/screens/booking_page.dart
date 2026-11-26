import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/providers/booking_provider.dart';
import 'package:movies_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class BookingPage extends StatelessWidget {
  final MovieModel movie;
  final SeatModel seat;

  BookingPage({super.key, required this.movie, required this.seat});
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var bookingProvider = context.read<BookingProvider>();
    var movieProvider = context.read<MovieProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Book Seat",
          style: TextStyle(
            color: Colors.white,
            fontWeight: .bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 44, 16, 93),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Image.network(movie.poster, width: 50, height: 50),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: .start,
                      spacing: 5,
                      children: [
                        Text(
                          movie.name,
                          style: TextStyle(fontWeight: .bold, fontSize: 20),
                        ),
                        Row(
                          spacing: 5,
                          children: [
                            Icon(Icons.date_range),
                            Text(movie.showDate),
                          ],
                        ),
                        Row(
                          spacing: 5,
                          children: [
                            Icon(Icons.timer_sharp),
                            Text(movie.showTime),
                          ],
                        ),
                        Text("Seat : ${seat.seatNumber}"),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                "Enter Your Name",
                style: TextStyle(fontWeight: .bold, fontSize: 20),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Full Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Center(child: Text("Cancel")),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      bookingProvider.RequestCreateBookin(
                        seatId: seat.id,
                        movieId: movie.id,
                        customerName: nameController.text,
                      );
                      movieProvider.RequestMovies();
                      Navigator.pop(context);
                    },
                    child: Center(child: Text("Confirm")),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
