
import 'package:aflam_app/movie_screen.dart';
import 'package:aflam_app/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:aflam_app/network.dart';
import 'package:aflam_app/services.dart';
import 'package:aflam_app/services2.dart';
Color lwn=Color(0xff321961);
class Home extends StatefulWidget {
  final List <Movie?>movies;
  final List <Movie?>topRated;
  final List <Movie?> upComing;
  final List<Movie?>now_playing;
  Home(this.movies,this.topRated,this.upComing,this.now_playing);

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {




  Widget build(BuildContext context) {
    TextEditingController tec=TextEditingController();
    Widget MovieCard(Movie? movie) {

      String? imgPath=movie!.posterpath;

      return InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieScreen(movie)));
        },
        child: Column(
          children: [
            Card(
              elevation: 3,
              shadowColor: Colors.white,
              child: Image.network(
                "${urlLink}${imgPath}",
                fit: BoxFit.fill,
                width: 130,
                height: 160,
              ),
            ),
          ],
        ),
      );
    }


    return
      Scaffold(
        backgroundColor: lwn,
        //Color(0xff181337),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child:
    ListView(
            children: [
              TextField(
                maxLength: 10,
                controller: tec,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon:Icon(Icons.search),
                    color: Colors.grey,
                    onPressed: () async{
                      List<Movie?>srchList=await FetchSearchData(tec.text);
                      print("done");
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(srchList)));
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  //labelText: 'Search',
                  //labelStyle: TextStyle(color: Colors.grey),
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: 'Search',
                ),
                onChanged: (value) {
                //  tec.text=value;

                  },
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Trending Now ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25),
                    textAlign: TextAlign.start,
                ),
              ),

              Container(
                height: 180,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: widget.movies.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context,int index){
                      return MovieCard(
                        widget.movies[index]
                       // widget.movies[index]!.posterpath  ,
                      //widget.movies[index]!.title,
                      //widget.movies[index]!.voteaverage
                      );
                    }
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Top Rated",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25),),
              ),
              SizedBox(height: 15,),
          Container(
          height: 180,
          width: double.infinity,
          child: ListView.builder(
              itemCount: widget.topRated.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context,int index){
                return MovieCard(
                  widget.topRated[index]
                );
              }
          ),
        ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("UpComing",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25),
                ),
              ),
              Container(
                height: 180,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: widget.upComing.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context,int index){
                      return MovieCard(
                          widget.upComing[index]
                      );
                    }
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Now_playing",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25),
                ),
              ),
              Container(
                height: 180,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: widget.now_playing.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context,int index){
                      return MovieCard(
                          widget.now_playing[index]
                      );
                    }
                ),
              ),


            ],
          ),
        ));


  }


}




/*
Widget Movie_card(Result? result){
  String? imgPath=result!.posterpath;
  return InkWell(
onTap: (){},
    child: Column(
      children: [
    Card(
    child: Image.network(
    "${urlLink}${imgPath}",
      fit: BoxFit.fill,
      width: 130,
      height: 160,
    ),
  ),
]
  )
);
}

*/
