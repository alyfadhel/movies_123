import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies123/core/layout/cubit/states.dart';
import 'package:movies123/features/movies/presentation/screens/movies.dart';
import 'package:movies123/features/tv/presentation/screens/tv.dart';


class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(InitialLayoutState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.movie_creation_outlined,
        ),
        label: 'Movies'),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.tv_outlined,
        ),
        label: 'Series',
    ),
  ];

  List<Widget>screens = [
    const MoviesScreen(),
    const TvScreen(),
  ];

  List<String>title = [
    'Movies',
    'Series',
  ];

  void changeBottomNav(int index)
  {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }
}
