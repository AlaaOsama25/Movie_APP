import 'package:flutter/material.dart';
import 'package:movie_app/detailed_screens/top_rated_screen_details.dart';
import 'package:movie_app/model/movies.dart';
import 'package:movie_app/network/moviesapi.dart';
class TopRated_Movies extends StatefulWidget {
  const TopRated_Movies({Key? key}) : super(key: key);

  @override
  _TopRated_MoviesState createState() => _TopRated_MoviesState();
}

class _TopRated_MoviesState extends State<TopRated_Movies> {
  late Future<Movies> movies;
  int page=1;
  int selected_index=1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movies = TopRatedMovies(1);

  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return FutureBuilder<Movies>(
      future: movies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<MoviesResults?>? info = snapshot.data!.results;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: RawScrollbar(
              radius: Radius.circular(20),
              thickness: 3,
              thumbColor: Colors.pinkAccent,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                      children: [
                        Container(
                          height: size.height / 15,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 20,
                              itemBuilder: (context, index) {
                                return TextButton(
                                  onPressed: () {
                                    setState(() {
                                      page = (index + 1);
                                      movies = TopRatedMovies(index + 1);
                                      selected_index = (index + 1);
                                    });
                                  },
                                  child: Text('${index + 1}',
                                    style: TextStyle(
                                        color: (selected_index == (index + 1))
                                            ? Colors.pinkAccent
                                            : Colors.black,
                                        fontSize: (selected_index ==
                                            (index + 1)) ? 23 : 20,
                                        fontWeight: (selected_index ==
                                            (index + 1))
                                            ? FontWeight.bold
                                            : FontWeight.w500
                                    ),
                                  ),
                                );
                              }
                          ),
                        ),
                        Container(
                          height: 2,
                          width: size.width,
                          color: Colors.pinkAccent,
                        ),
                        SizedBox(height: 10.0),
                        GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: ((size.width / 2) /
                                    (size.height / 2.3))
                            ),
                            itemCount: info!.length,
                            itemBuilder: (BuildContext context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>
                                          TopRatedScreenDetails(
                                              index: index, page: page))
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0)
                                  ),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        // height: (size.height/2),
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              20.0),
                                        ),
                                        child: (info[index]!.posterPath==null)?
                                        Image.asset('images/default movie poster.jpg',
                                          width: double.infinity,
                                          height: (size.height / 3.2),
                                          fit: BoxFit.fill,
                                        )
                                            :Image.network(
                                          'https://image.tmdb.org/t/p/w500${info[index]!
                                              .posterPath.toString()}'
                                          , width: double.infinity,
                                          height: (size.height / 3.2),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Center(
                                            child: Text(
                                              info[index]!.title.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      )

                                    ],),
                                ),
                              );
                            }
                        ),

                      ]
                  ),
                ),
              ),
            ),
          );
        }
        else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        else
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: Colors.pinkAccent,),
                Text('LOADING'),
              ],
            ),
          );
      },
    );
  }
  }