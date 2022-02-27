part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitialState extends AppState {
  @override
  List<Object> get props => [];
}

class AppWelcomeState extends AppState {
  @override
  List<Object> get props => [];
}

class LoadingState extends AppState {
  @override
  List<Object> get props => [];
}

class LoadedState extends AppState {
  final List<DataModel> places;
  
  const LoadedState(this.places);
  @override
  List<Object> get props => [];
}

class DetailState extends AppState {
  final DataModel place;

  const DetailState(this.place);
  @override
  List<Object> get props => [];
}
