import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/core/utils/app_constants.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';

// a contract between the user and the real implementation.
// implementation cant talk with another implementation.
abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(AppConstants.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      //! important part to take care of
      // a way to handle exception in a more professional way
      // this way better that just returning null and handle it later by if conditions in the ui.
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(AppConstants.popularMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      //! important part to take care of
      // a way to handle exception in a more professional way
      // this way better that just returning null and handle it later by if conditions in the ui.
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(AppConstants.topRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      //! important part to take care of
      // a way to handle exception in a more professional way
      // this way better that just returning null and handle it later by if conditions in the ui.
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
