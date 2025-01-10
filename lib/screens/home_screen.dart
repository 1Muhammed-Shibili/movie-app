import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/movie_controller.dart';
import 'package:movie_app/widgets/movie_card.dart';
import 'package:movie_app/screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  final MovieController controller = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'My Movies',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () => Get.to(() => SearchScreen()),
          ),
          IconButton(
            icon: Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator(color: Colors.red));
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 450,
                child: Stack(
                  children: [
                    Image.network(
                      controller.movies.isNotEmpty
                          ? controller.movies[0].imageUrl
                          : '',
                      width: double.infinity,
                      height: 450,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.8),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Text(
                            controller.movies.isNotEmpty
                                ? controller.movies[0].name
                                : '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _playButton(),
                              SizedBox(width: 10),
                              _moreInfoButton(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _movieSection('Trending Now', controller.movies.take(5).toList()),
              _movieSection('Popular on Netflix',
                  controller.movies.skip(5).take(5).toList()),
              _movieSection('Continue Watching',
                  controller.movies.skip(3).take(5).toList()),
            ],
          ),
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'Search Movies'),
        ],
      ),
    );
  }

  Widget _movieSection(String title, List movies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Container(
                width: 130,
                margin: EdgeInsets.symmetric(horizontal: 4),
                child: MovieCard(movie: movies[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _playButton() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      icon: Icon(Icons.play_arrow),
      label: Text('Play'),
      onPressed: () {},
    );
  }

  Widget _moreInfoButton() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.withOpacity(0.5),
        foregroundColor: Colors.white,
      ),
      icon: Icon(Icons.info_outline),
      label: Text('More Info'),
      onPressed: () {},
    );
  }
}
