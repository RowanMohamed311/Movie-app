import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';

import 'package:movie_app/movies/domain/usecases/get_now_playing_movies.dart';
import 'package:movie_app/movies/presentation/controller/movies_event.dart';
import 'package:movie_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  //! a variable to get the already made object from the get it(service locator file).
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  // A constructor.
  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(const MoviesState()) {
    // to call the first event.
    // emit : notify that there is a new state. (data has arrived.)
    on<GetNowPlayingEvent>(
      (event, emit) async {
        final result = await getNowPlayingMoviesUseCase.execute();
        emit(const MoviesState(nowPlayingState: RequestState.loaded));
        result.fold((l) {
          emit(
            MoviesState(
                nowPlayingState: RequestState.error,
                nowPlayingMessage: l.message),
          );
        }, (r) {
          emit(MoviesState(
              nowPlayingMovies: r, nowPlayingState: RequestState.loaded));
        });
      },
    );
  }
}
