import 'package:flutter/material.dart';
import 'package:movie_app/model/movies.dart';
import 'package:movie_app/network/moviesapi.dart';
class NowPlayingScreen extends StatefulWidget {
  const NowPlayingScreen({Key? key,required this.index,required this.page}) : super(key: key);

  final index;
  final  page;
  @override
  _NowPlayingScreenState createState() =>
      _NowPlayingScreenState(index:index,page:page);
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {
  _NowPlayingScreenState({ this.index,required this.page});
  final index;
  final int page;
  late Future<Movies> movies;
  bool faviconpressed = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movies = NowPlayingMovies(page);

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: FutureBuilder<Movies>(
          future: movies,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<MoviesResults?>? info = snapshot.data!.results;
              return SafeArea(
                child: ListView(
                    shrinkWrap: true,
                    children:[ Column(
                      children: [
                        Stack(
                          overflow: Overflow.visible,
                          children: [
                            Container(height: (size.height/3)+22),
                            Positioned(
                              child: Container(
                                width: double.infinity,
                                height: (size.height / 3),
                                decoration: BoxDecoration(
                                    image:
                                    (info![index]!.backdropPath==null) ?
                                    DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('images/default movie dropposter.jpg') ):
                                     DecorationImage(
                                       fit: BoxFit.cover,
                                       image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500${info[index]!.backdropPath.toString()}',
                                      ),
                                    )
                                ),
                              ),
                            ),
                            Positioned(
                                left: (size.width/12),
                                top: (size.height/4),
                                child: Container(
                                  height: size.height/11,
                                  width: (size.width/2)*1.5,
                                  child: Text(info[index]!.title.toString(),
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                    maxLines: 2,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                            ),
                            Positioned(
                                right: (size.width/20),
                                top: (size.height/3.4),
                                child:
                                GestureDetector(
                                  onTap: (){
                                    faviconpressed = ! faviconpressed;
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green.shade300,
                                    ),
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            faviconpressed = ! faviconpressed;
                                          });

                                        },
                                        iconSize: 30,
                                        icon: (faviconpressed==true)? Icon(Icons.favorite,color: Colors.red,) :
                                        Icon(Icons.favorite_border,color: Colors.white,)

                                    ),
                                  ),
                                )
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: (info[index]!.posterPath==null)?
                                      Image.asset('images/default movie poster.jpg',
                                        width: (size.width/3),
                                        height: (size.height/4 ),
                                        fit: BoxFit.fill,
                                      )
                                          :Image.network(
                                        'https://image.tmdb.org/t/p/w500${info[index]!
                                            .posterPath.toString()}'
                                        , width: (size.width/3),
                                        height: (size.height/4 ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 10.0,),
                                          Text(info[index]!.title.toString(),
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey.shade600
                                            ),
                                            textAlign: TextAlign.justify,
                                            maxLines: 3,
                                            softWrap: false,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 10,),
                                          Text(info[index]!.overview.toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey.shade600
                                            ),
                                            textAlign: TextAlign.justify,
                                            maxLines: 2,
                                            softWrap: false,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          SizedBox(height: 10,),
                                          Text('${info[index]!.releaseDate.toString()} (Released)',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey.shade600
                                            ),
                                          ),
                                          SizedBox(height: 40.0,),
                                          Center(
                                            child: Container(
                                              height: 40,
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10.0)
                                              ),
                                              child: ElevatedButton(
                                                onPressed: (){},
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.green.shade300,
                                                ),
                                                child: Text('Reviews',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                color: Colors.grey.shade300,
                                height: 2,
                                width: size.width,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Stack(
                                          alignment: AlignmentDirectional.center,
                                          children: [

                                            CircleAvatar(
                                              radius: 26,
                                              backgroundColor: Colors.red.shade700,
                                            ),
                                            CircleAvatar(
                                              radius: 23,
                                              backgroundColor: Colors.white,
                                            ),
                                            CircleAvatar(
                                              radius: 21,
                                              backgroundColor: Colors.red.shade700,
                                              child: Text(info[index]!.voteAverage.toString(),
                                                style: TextStyle(color: Colors.white,
                                                    fontSize: 15
                                                ),),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 10.0,),
                                        Text('${info[index]!.voteCount.toString()} Votes',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey.shade600
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                            radius: 26,
                                            backgroundColor: Colors.red.shade700,
                                            child: Icon(Icons.theater_comedy,color: Colors.white,size: 30,)
                                        ),
                                        SizedBox(height: 10.0,),
                                        Text('Actions',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey.shade600
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Stack(
                                          alignment: AlignmentDirectional.center,
                                          children: [

                                            CircleAvatar(
                                              radius: 26,
                                              backgroundColor: Colors.red.shade700,
                                            ),
                                            CircleAvatar(
                                              radius: 23,
                                              backgroundColor: Colors.white,
                                            ),
                                            CircleAvatar(
                                              radius: 21,
                                              backgroundColor: Colors.red.shade700,
                                              child: Text(info[index]!.popularity!.round().toString(),
                                                style: TextStyle(color: Colors.white,
                                                    fontSize: 15
                                                ),),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 10.0,),
                                        Text('Popularity',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey.shade600
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        Stack(
                                          alignment: AlignmentDirectional.center,
                                          children: [

                                            CircleAvatar(
                                              radius: 26,
                                              backgroundColor: Colors.red.shade700,
                                            ),
                                            CircleAvatar(
                                              radius: 23,
                                              backgroundColor: Colors.white,
                                            ),
                                            CircleAvatar(
                                              radius: 21,
                                              backgroundColor: Colors.red.shade700,
                                              child: Text(info[index]!.originalLanguage.toString(),
                                                style: TextStyle(color: Colors.white,
                                                    fontSize: 15

                                                ),),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 10.0,),
                                        Text('Language',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey.shade600
                                          ),
                                        ),


                                      ],
                                    ),
                                  )
                                ],),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                color: Colors.grey.shade300,
                                height: 2,
                                width: size.width,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                child: Center(
                                  child: Text(info[index]!.overview.toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade600
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ],

                    ),
                    ]
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
        )
    );
  }
}
