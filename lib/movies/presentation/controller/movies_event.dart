import 'package:equatable/equatable.dart';

// BLOC state managment.
abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
  @override
  List<Object?> get props => [];
}

class GetNowPlayingEvent extends MoviesEvent {}

class GetPopularEvent extends MoviesEvent {}

class GetTopRatedEvent extends MoviesEvent {}
