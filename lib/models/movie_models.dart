class MovieModel {
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseData;
  String title;
  bool video;
  String voteAverage;
  int voteCount;

  MovieModel({
    required this.id,
    required this.adult,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseData,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseData: json['releaseData'].toString(),
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'].toString(),
      voteCount: json['vote_count'],
    );
  }
}
