import 'package:flutter/material.dart';
import 'package:movie_app/widgets/card_swiper.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en cines'),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon( Icons.search_rounded)
            )
        ],
      ),
      body: Column(
        children: const [
          CardSwiper(),
        ],
      ),
    );
  }
}