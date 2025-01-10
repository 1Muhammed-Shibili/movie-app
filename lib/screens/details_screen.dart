import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  DetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(movie.imageUrl),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.name, style: TextStyle(fontSize: 24)),
                  Text(movie.summary),
                  Text('Language: ${movie.language}'),
                  Text('Genres: ${movie.genres.join(', ')}'),
                  Text('Rating: ${movie.rating?.toString() ?? 'N/A'}'),
                  if (movie.officialSite != null)
                    TextButton(
                      onPressed: () => launchUrlString(movie.officialSite!),
                      child: Text('Visit Official Site'),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
