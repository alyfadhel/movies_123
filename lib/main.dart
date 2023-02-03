import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies123/core/layout/cubit/cubit.dart';
import 'package:movies123/core/layout/cubit/observer.dart';
import 'package:movies123/core/layout/layout_screen.dart';
import 'package:movies123/core/resources/theme_manager.dart';
import 'package:movies123/core/services/service_locator.dart';
import 'package:movies123/features/movies/presentation/controller/cubit/movies_cubit.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LayoutCubit(),
        ),
        BlocProvider(
          create: (context) => sl<MoviesCubit>()
            ..getNowPlayingMovies()
            ..getPopularMovies()
            ..getTopRatedMovies()
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: getApplicationDarkTheme(),
        home: const LayoutScreen(),
      ),
    );
  }
}
