import 'dart:async';

import 'package:flutter/material.dart';
import 'package:peli_app/providers/movies_provider.dart';
import 'package:peli_app/search/search_delegate.dart';
import 'package:peli_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(Icons.search), //
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearchDelegate()))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          //tarjetas principales
          CardSwiper(
            movies: moviesProvider.displayMovies,
          ),
          //slider peliculas
          MovieSlider(
            movies: moviesProvider.popularMovies,
            title: 'Principales',
            nextPage: () => moviesProvider.getPopularMovies(),
          ),
          MovieSlider(
            movies: moviesProvider.popularMovies,
            title: 'Accion',
            nextPage: () => moviesProvider.getPopularMovies(),
          ),
        ],
      )),
    );
  }
}
