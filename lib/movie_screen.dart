import 'package:aflam_app/services.dart';
import 'package:aflam_app/services2.dart';
import 'package:flutter/material.dart';
import 'package:aflam_app/home_screen.dart';
import 'package:aflam_app/network.dart';
import 'package:aflam_app/loading_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rate/rate.dart';

class MovieScreen extends StatelessWidget {
  final Movie movie;
  MovieScreen(this.movie);

  @override
  //String? imgPath=movie!.posterpath;
  Widget build(BuildContext context) {
    String? imgPath = movie!.posterpath;

    return Scaffold(
        backgroundColor: Color(0xff321961),
        body:
        CustomScrollView(
          slivers: [
            SliverAppBar(

              expandedHeight: 150,
              flexibleSpace: FlexibleSpaceBar(
                background: ShaderMask(
                  blendMode: BlendMode.srcOver,

                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[Colors.transparent, Color(0xff321961)],
                    ).createShader(bounds);
                  },
                  child: Image.network(
                    "${urlLink}${movie!.backdroppath}",
                    fit: BoxFit.fitWidth,
                   // width: double.infinity,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Card(
                          elevation: 20,
                          shadowColor: Colors.white,
                          child: Container(
                            height: 300 * 2 / 3,
                            width: 200 * 2 / 3,
                            child: Image.network(
                              "${urlLink}${imgPath}",
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 190,
                            child: Text("${movie!.title}",
                              style:TextStyle(
                                color: Colors.white,
                                fontSize: 15
                              ) ,),
                          ),
                          SizedBox(height: 15,),
                          RatingBarIndicator(
                            rating: movie!.voteaverage.toDouble()/2,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 25,
                            direction: Axis.horizontal,
                          ),

                        ]
                      )
                    ],
                  ),
                  Container(
                    child: Text("${movie.overview}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30
                    ),),
                  )
                ],
              ),
            )

          ],
        ),

    );




  }
}
