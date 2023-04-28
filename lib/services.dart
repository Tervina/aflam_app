import 'package:flutter/material.dart';
import 'package:aflam_app/network.dart';
class Result {
  bool? adult;
  int? id;
  String? originallanguage;
  String? originaltitle;
  String? overview;
  double? popularity;
  String? posterpath;
  String? releasedate;
  String ?title;
  bool? video;
  late num voteaverage;
  int? votecount;

  Result({this.adult, this.id,this.originallanguage, this.originaltitle, this.overview, this.popularity, this.posterpath, this.releasedate, this.title, this.video, required this.voteaverage, this.votecount});

  Result.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    id = json['id'];
    originallanguage = json['original_language'];
    originaltitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterpath = json['poster_path'];
    releasedate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteaverage = json['vote_average'];
    votecount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['adult'] = adult;
    data['id'] = id;
    data['original_language'] = originallanguage;
    data['original_title'] = originaltitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterpath;
    data['release_date'] = releasedate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteaverage;
    data['vote_count'] = votecount;
    return data;
  }
}

class RootMovie {
  int? page;
  late List<Result?> results;
  int? totalpages;
  int? totalresults;

  RootMovie({this.page, required this.results, this.totalpages, this.totalresults});

  RootMovie.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    results = <Result>[];
    if (json['results'] != null) {

      json['results'].forEach((v) {
        results.add(Result.fromJson(v));
      });
    }
    totalpages = json['total_pages'];
    totalresults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['page'] = page;
    data['results'] =results != null ? results!.map((v) => v?.toJson()).toList() : null;
    data['total_pages'] = totalpages;
    data['total_results'] = totalresults;
    return data;
  }
}

