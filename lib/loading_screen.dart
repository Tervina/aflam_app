import 'package:aflam_app/services.dart';
import 'package:aflam_app/services2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:aflam_app/home_screen.dart';

import 'network.dart';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eachMovie();
  }
  eachMovie()async{
    List<Movie?> movies=await FetchPopularData("popular");
    /*for(Movie? movie in movies){
       // Result? result=Result.fromJson(data);
     movies.add(movie!.title);
      movies.add(movie!.posterpath);
      movies.add(movie!.votecount);

    };
    print(movieList);*/
    print(movies[0]!.title);
    List<Movie?>ratedMovie=await FetchPopularData("top_rated");
    print(ratedMovie[0]!.title);
    List<Movie?>upComing=await FetchPopularData("upcoming");
    List<Movie?>now_playing=await FetchPopularData("now_playing");
    //List<Movie?>search=await FetchSearchData("harry");
    //print(search);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(movies,ratedMovie,upComing,now_playing)));

  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff321961),
      body: SpinKitSpinningLines(
        color: Colors.white,
      ),
    );
  }
}
