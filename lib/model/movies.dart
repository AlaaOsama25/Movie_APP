
class MoviesResults {
/*
{
  "adult": false,
  "backdrop_path": "/pUc51UUQb1lMLVVkDCaZVsCo37U.jpg",
  "genre_ids": [
    53
  ],
  "id": 482373,
  "original_language": "en",
  "original_title": "Don't Breathe 2",
  "overview": "The Blind Man has been hiding out for several years in an isolated cabin and has taken in and raised a young girl orphaned from a devastating house fire. Their quiet life together is shattered when a group of criminals kidnap the girl, forcing the Blind Man to leave his safe haven to save her.",
  "popularity": 3850.271,
  "poster_path": "/hRMfgGFRAZIlvwVWy8DYJdLTpvN.jpg",
  "release_date": "2021-08-12",
  "title": "Don't Breathe 2",
  "video": false,
  "vote_average": 7.7,
  "vote_count": 354
}
*/

  bool? adult;
  String? backdropPath;
  List<int?>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MoviesResults({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });
  MoviesResults.fromJson(Map<String, dynamic> json) {
    adult = json["adult"];
    backdropPath = json["backdrop_path"]?.toString();
    if (json["genre_ids"] != null) {
      final v = json["genre_ids"];
      final arr0 = <int>[];
      v.forEach((v) {
        arr0.add(v.toInt());
      });
      genreIds = arr0;
    }
    id = json["id"]?.toInt();
    originalLanguage = json["original_language"]?.toString();
    originalTitle = json["original_title"]?.toString();
    overview = json["overview"]?.toString();
    popularity = json["popularity"]?.toDouble();
    posterPath = json["poster_path"]?.toString();
    releaseDate = json["release_date"]?.toString();
    title = json["title"]?.toString();
    video = json["video"];
    voteAverage = json["vote_average"]?.toDouble();
    voteCount = json["vote_count"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["adult"] = adult;
    data["backdrop_path"] = backdropPath;
    if (genreIds != null) {
      final v = genreIds;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data["genre_ids"] = arr0;
    }
    data["id"] = id;
    data["original_language"] = originalLanguage;
    data["original_title"] = originalTitle;
    data["overview"] = overview;
    data["popularity"] = popularity;
    data["poster_path"] = posterPath;
    data["release_date"] = releaseDate;
    data["title"] = title;
    data["video"] = video;
    data["vote_average"] = voteAverage;
    data["vote_count"] = voteCount;
    return data;
  }
}

class Movies {
/*
{
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/pUc51UUQb1lMLVVkDCaZVsCo37U.jpg",
      "genre_ids": [
        53
      ],
      "id": 482373,
      "original_language": "en",
      "original_title": "Don't Breathe 2",
      "overview": "The Blind Man has been hiding out for several years in an isolated cabin and has taken in and raised a young girl orphaned from a devastating house fire. Their quiet life together is shattered when a group of criminals kidnap the girl, forcing the Blind Man to leave his safe haven to save her.",
      "popularity": 3850.271,
      "poster_path": "/hRMfgGFRAZIlvwVWy8DYJdLTpvN.jpg",
      "release_date": "2021-08-12",
      "title": "Don't Breathe 2",
      "video": false,
      "vote_average": 7.7,
      "vote_count": 354
    }
  ],
  "total_pages": 500,
  "total_results": 10000
}
*/

  int? page;
  List<MoviesResults?>? results;
  int? totalPages;
  int? totalResults;

  Movies({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });
  Movies.fromJson(Map<String, dynamic> json) {
    page = json["page"]?.toInt();
    if (json["results"] != null) {
      final v = json["results"];
      final arr0 = <MoviesResults>[];
      v.forEach((v) {
        arr0.add(MoviesResults.fromJson(v));
      });
      results = arr0;
    }
    totalPages = json["total_pages"]?.toInt();
    totalResults = json["total_results"]?.toInt();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["page"] = page;
    if (results != null) {
      final v = results;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data["results"] = arr0;
    }
    data["total_pages"] = totalPages;
    data["total_results"] = totalResults;
    return data;
  }
}
