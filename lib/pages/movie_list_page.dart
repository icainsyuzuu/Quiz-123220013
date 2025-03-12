import 'package:flutter/material.dart';
import '../data/movie_data.dart';
import '../widgets/movie_card.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie List')),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return MovieCard(movie: movieList[index]);
        },
      ),
    );
  }
}
