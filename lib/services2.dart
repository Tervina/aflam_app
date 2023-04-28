import 'package:flutter/material.dart';
import 'package:aflam_app/home_screen.dart';
import 'package:aflam_app/loading_screen.dart';
import 'package:aflam_app/network.dart';

class Movie {
  bool? adult;
  String? backdroppath;
  int? id;
  String? originallanguage;
  String? originaltitle;
  String? overview;
  double? popularity;
  String? posterpath;
  String? releasedate;
  String? title;
  bool? video;
  late num voteaverage;
  int? votecount;

  Movie({this.adult, this.backdroppath,  this.id, this.originallanguage, this.originaltitle, this.overview, this.popularity, this.posterpath, this.releasedate, this.title, this.video, required this.voteaverage, this.votecount});

  Movie.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdroppath = json['backdrop_path'];

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
    data['backdrop_path'] = backdroppath;
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

class Root {
  int? page;
  late List<Movie?> results;
  int? totalpages;
  int? totalresults;

  Root({this.page, required this.results, this.totalpages, this.totalresults});

  Root.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <Movie>[];
      json['results'].forEach((v) {
        results!.add(Movie.fromJson(v));
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

