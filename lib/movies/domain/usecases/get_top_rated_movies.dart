import 'package:dartz/dartz.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';

class GetTopRatedMoviesUseCase {
  // injection not an object initialization
  final BaseMovieRepository baseMovieRepository;

  GetTopRatedMoviesUseCase(this.baseMovieRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMovieRepository.getTopRatedMovies();
  }
}
