class Movie {
  final String name;
  final String summary;
  final String imageUrl;
  final String language;
  final List<String> genres;
  final double? rating;
  final String? officialSite;

  Movie({
    required this.name,
    required this.summary,
    required this.imageUrl,
    required this.language,
    required this.genres,
    this.rating,
    this.officialSite,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      name: json['name'],
      summary: json['summary'] ?? '',
      imageUrl: json['image']?['original'] ?? '',
      language: json['language'],
      genres: List<String>.from(json['genres'] ?? []),
      rating: json['rating']?['average']?.toDouble(),
      officialSite: json['officialSite'],
    );
  }
}
