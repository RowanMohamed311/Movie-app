class AppConstants {
  static const baseurl = "https://api.themoviedb.org/3";
  static const apiKey = "fed9e20006cdfd9935c226e3124ffbe0";
  static const String nowPlayingMoviesPath =
      "$baseurl/movie/now_playing?api_key=$apiKey";

  static const String popularMoviesPath =
      "$baseurl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath =
      "$baseurl/movie/top_rated?api_key=$apiKey";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path) => '$baseImageUrl$path';
}
