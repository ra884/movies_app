import 'package:flutter/material.dart';
import 'package:movies_app/providers/movie_provider.dart';
import 'package:movies_app/widgets/custom_movie_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movies",
          style: TextStyle(
            color: Colors.white,
            fontWeight: .bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 44, 16, 93),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, value, child) {
          var data = value.moviesObject?.movies;
          if (data == null) {
            value.RequestMovies();
            return Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(50),
              child: Container(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: CustomMovieCard(movie: data[index]),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
