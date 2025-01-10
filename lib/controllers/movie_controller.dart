import 'package:get/get.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/services/api_service.dart';

class MovieController extends GetxController {
  var movies = <Movie>[].obs;
  var searchResults = <Movie>[].obs;
  var isLoading = false.obs;
  var isSearching = false.obs;

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  void fetchMovies() async {
    isLoading(true);
    movies.value = await ApiService.fetchMovies();
    isLoading(false);
  }

  void searchMovies(String query) async {
    if (query.isEmpty) {
      searchResults.clear();
      return;
    }
    isSearching(true);
    try {
      searchResults.value = await ApiService.searchMovies(query);
    } catch (e) {
      searchResults.clear();
    } finally {
      isSearching(false);
    }
  }
}
