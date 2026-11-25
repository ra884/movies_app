import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/widgets/custom_movie_card.dart';

class MoviePage extends StatelessWidget {
  final MovieModel movie;

  const new({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    var isPressed = false;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "${movie.name}",
          style: TextStyle(
            color: Colors.white,
            fontWeight: .bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 44, 16, 93),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(70),
            child: CustomMovieCard(movie: movie),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              "Select Your Seat",
              style: TextStyle(fontWeight: .bold, fontSize: 20),
            ),
          ),
          Container(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.only(left: 70, right: 70),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: movie.Seats.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => isPressed=!isPressed,
                    child: Card(
                      color: isPressed? CupertinoColors.inactiveGray:Colors.orangeAccent,
                      child: Center(
                        child: Text(
                          movie.Seats[index].seatNumber,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: .bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
