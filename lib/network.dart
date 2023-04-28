import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:aflam_app/services.dart';
import 'package:aflam_app/services2.dart';


String apiKey = "fa0ecc80b4e6726ea0768d1c383b3638";
String urlLink="https://image.tmdb.org/t/p/w500";
String url="https://api.themoviedb.org/3";
Future<dynamic>FetchPopularData(String type) async {
  List movieName=[];
  String url_link="$url/movie/$type?api_key=$apiKey&language=en-US&page=1";
  Response response = await get(Uri.parse(url_link));
  var data =jsonDecode(response.body);

  //print(response.body);
  //Result result=Result.fromJson(data);
  Root root=Root.fromJson(data);
  //print(result);
  //List<Result> itemsList = List<Result>.from(
     // data['Result'].map<Result>((dynamic i) => Result.fromJson(i)));
  //print(root.results);
  List<Movie?> x=root.results!;
  print(url_link);
  return x;
  /*print(x[0]!.title);
  for(Result? y in x){
    movieName.add(y!.title);
  }
  */
}
Future<dynamic>FetchSearchData(String query)async{
  String url_link="$url/search/movie?api_key=$apiKey&language=en-US&query=$query&page=1&include_adult=false";
  Response response = await get(Uri.parse(url_link));
  var data1 =jsonDecode(response.body);
  Root rootMovie=Root.fromJson(data1);
  List<Movie?>y=rootMovie.results;
 // print(y);
  print(urlLink);
  print(y);
  print(y[0]!.title);
  return y;

}
