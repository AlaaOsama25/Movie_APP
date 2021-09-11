import 'package:flutter/material.dart';
import 'package:movie_app/screens_layout/top_rated_movie.dart';

import 'popular_movies.dart';
import 'now_playing_movies.dart';
class Screens extends StatefulWidget {
  const Screens({Key? key}) : super(key: key);

  @override
  _ScreensState createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
   int _value = 0;

   List<Widget> Screens=[
     MyHomePage(),
     Latest_Movies(),
     TopRated_Movies()

   ];

   List<String> AppbarNames =[
     'Popular Movies',
     'Now Playing Movies',
     'Top Rated Movies'
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(AppbarNames[_value]),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.menu), //don't specify icon if you want 3 dot menu
            color: Colors.white,
            onSelected: (int value){
              setState(() {
                _value=value;
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Text(
                  "Popular",
                  style: TextStyle(color: Colors.pinkAccent),
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Text(
                  "Now Playing",
                  style: TextStyle(color: Colors.pinkAccent),
                ),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Text(
                  "Top Rated",
                  style: TextStyle(color: Colors.pinkAccent),
                ),
              ),
            ],

          ),
        ],
      ),
      body: Screens[_value],

    );
  }
}
