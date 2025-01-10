import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/movie_controller.dart';

class SearchScreen extends StatelessWidget {
  final MovieController controller = Get.find();
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: _buildSearchField(),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        if (controller.isSearching.value) {
          return Center(child: CircularProgressIndicator(color: Colors.red));
        }
        return ListView.builder(
          itemCount: controller.searchResults.length,
          itemBuilder: (context, index) {
            final movie = controller.searchResults[index];
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  movie.imageUrl,
                  width: 50,
                  height: 75,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                movie.name,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                movie.summary,
                style: TextStyle(color: Colors.grey),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                // Handle movie selection
              },
            );
          },
        );
      }),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: searchController,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Search for movies or TV shows',
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.search, color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      onChanged: (value) {
        controller.searchMovies(value);
      },
    );
  }
}
