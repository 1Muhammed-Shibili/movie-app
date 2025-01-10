import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/screens/details_screen.dart';
import '../models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => DetailsScreen(movie: movie)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.network(
            movie.imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[900],
                child: Icon(Icons.broken_image, color: Colors.white),
              );
            },
          ),
        ),
      ),
    );
  }
}
