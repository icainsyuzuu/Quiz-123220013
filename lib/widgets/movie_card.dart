import 'package:flutter/material.dart';
import '../model/movie_model.dart';
import '../pages/movie_detail_page.dart';

class MovieCard extends StatefulWidget {
  final MovieModel movie;
  const MovieCard({super.key, required this.movie});

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading:
            Image.network(widget.movie.imgUrl, width: 50, fit: BoxFit.cover),
        title: Text(widget.movie.title),
        subtitle: Row(
          children: [
            Text("${widget.movie.year} • ${widget.movie.genre} • "),
            const Icon(Icons.star, color: Colors.amber, size: 18),
            Text(" ${widget.movie.rating}"),
          ],
        ),
        trailing: IconButton(
          icon:
              Icon(Icons.bookmark, color: isAdded ? Colors.blue : Colors.black),
          onPressed: () {
            setState(() {
              isAdded = !isAdded;
            });
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailScreen(movie: widget.movie)),
          );
        },
      ),
    );
  }
}
