import 'package:aflam_app/network.dart';
import 'package:flutter/material.dart';
import 'package:aflam_app/services2.dart';
class SearchScreen extends StatefulWidget{
List<Movie?> searchList=[];

  SearchScreen(this.searchList);
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override

 // late String word;
 /* void initState() {
    // TODO: implement initState
    super.initState();
    FetchSearchData(word);
  }*/
  String? imgPath= "${urlLink}}";

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff321961),
      body: ListView.builder(
        itemCount: widget.searchList.length,

          itemBuilder: (BuildContext,int index){
            return ListTile(
              title: Text(widget.searchList[index]!.title!,
              style: TextStyle(color: Colors.white),),
              leading: SizedBox(
                width: 20,
                height: 30,
                child: Image.network("https://image.tmdb.org/t/p/w500/${widget.searchList[index]!.posterpath!}"),
              ),
            );
          }
      ),
    );
  }
}
