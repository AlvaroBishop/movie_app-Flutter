import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar()
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.green,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(0),
        centerTitle: true,
        title: Container(
          color: Colors.black12,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child: Text('movie.title', style: TextStyle( fontSize: 16 ),),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: AssetImage('assets/no-image.jpg'),
          fit: BoxFit.cover,
          ),
      ),
    );
  }
}