import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/screens/details_page.dart';
import 'package:movies_app/screens/movie_page.dart';

class CustomMovieCard extends StatelessWidget {
  final MovieModel movie;

  const new({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MoviePage(movie: movie)),
      ),
      child: Container(
        height: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Card(
          elevation: 5,
          child: Row(
            children: [
              Image.network(movie.poster),
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
                      children: [Icon(Icons.date_range), Text(movie.showDate)],
                    ),
                    Row(
                      spacing: 5,
                      children: [Icon(Icons.timer_sharp), Text(movie.showTime)],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
