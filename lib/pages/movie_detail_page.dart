import 'package:flutter/material.dart';
import '../model/movie_model.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieModel movie;
  const MovieDetailScreen({super.key, required this.movie});

  void _launchURL() async {
    Uri url = Uri.parse(movie.movieUrl);
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(movie.imgUrl, height: 300)),
            const SizedBox(height: 10),
            Text(movie.title,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("${movie.year} • ${movie.genre} • "),
            const Icon(Icons.star, color: Colors.amber, size: 20),
            Text(" ${movie.rating}"),
            const SizedBox(height: 10),
            Text("Director: ${movie.director}",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text("Cast: ${movie.casts.join(', ')}"),
            const SizedBox(height: 10),
            Text(movie.synopsis),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: _launchURL,
                child: const Text("More Info on Wikipedia")),
          ],
        ),
      ),
    );
  }
}
