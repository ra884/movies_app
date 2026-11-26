import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/providers/booking_provider.dart';
import 'package:movies_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class ShowBookedMovie extends StatelessWidget {
  final MovieModel movie;
  final SeatModel seat;

  ShowBookedMovie({super.key, required this.movie, required this.seat});
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    nameController.text = seat.customerName;
    var provider = context.read<BookingProvider>();
    var movieProvider = context.read<MovieProvider>();
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
              Text("Booked by"),
              Consumer<BookingProvider>(
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Customer Name",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Text("This seat is already booked"),
              ElevatedButton(
                onPressed: () async {
                  await provider.RequestDeleteBooking(
                    bookingId: seat.bookingId,
                  );
                  await movieProvider.RequestMovies();
                  Navigator.pop(context);
                },
                child: Center(
                  child: Row(
                    children: [Icon(Icons.delete), Text("Cancel Booking")],
                  ),
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  provider.RequestUpdateBooking(
                    customerName: nameController.text,
                    bookingId: seat.bookingId,
                  );
                  movieProvider.RequestMovies();
                  Navigator.pop(context);
                },
                child: Center(
                  child: Row(children: [Icon(Icons.edit), Text("Upadet Name")]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
