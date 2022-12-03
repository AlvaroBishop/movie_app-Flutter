import 'package:flutter/material.dart';
import 'package:movie_app/provider/movies_provider.dart';
import 'package:movie_app/widgets/card_swiper.dart';
import 'package:movie_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en cines'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Tarjetas principales
            CardSwiper(
              movies: moviesProvider.onDisplayMovies,
            ),

            // Slider de peliculas
            MovieSlider(),
          ],
        ),
      ),
    );
  }
}
