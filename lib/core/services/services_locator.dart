import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/movies/data/repository/movies_repository.dart';
import 'package:movie_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movie_app/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// Bloc
    /// each call will cause a creation of new object.
    sl.registerFactory(() => MoviesBloc(sl()));

    /// use cases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMovieRepository>(
      () => MovieRepository(
        // find the object needed in sl(Movie remote data sourse)
        sl(),
      ),
    );

    /// Data Source
    /// to make a singlton object instead of initializing a new object every time we need to use it.
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
