import 'package:flutter_application_ff/constans/ProjectStrings.dart';

import 'movie.dart';

class MovieSys {
  static Movie? searchedMovie;
  static List<Movie> movieList = [];
  static List<Movie> selectedMovies = [];

  static createMovieList() {
    movieList = [
      Movie(
        name: "APOKALIPTO",
        description: MovieDescription.apokalipto,
        director: "MEL GİBSON",
        duration: "2h 18m",
        publishDate: "2006",
        category: "Action/Adventure",
        imdb: MovieImbd.apokaliptoImdb,
      ),
      Movie(
        name: "DJANGO",
        description: MovieDescription.django,
        director: "QUENTİN TARANTİNO",
        duration: "2h 45m",
        publishDate: "2012",
        category: "Western/Action",
        imdb: MovieImbd.djangotoImdb,
      ),
      Movie(
        name: "THE HATEFUL EIGHT",
        description: MovieDescription.hatefuleight,
        director: "QUENTİN TARANTİNO",
        duration: "3h 7m",
        publishDate: "2015",
        category: "Western/Thriller",
        imdb: MovieImbd.hatefuleightImdb,
      ),
      Movie(
        name: "INCENDIES",
        description: MovieDescription.incendies,
        director: "Denis Villeneuve",
        duration: "2h 10m",
        publishDate: "2010",
        category: "War/Mystery",
        imdb: MovieImbd.incenidesImdb,
      ),
      Movie(
        name: "JOHN WICK",
        description: MovieDescription.johnwick,
        director: "Chad Stahelski",
        duration: "2h 49m",
        publishDate: "2023",
        category: "Action/Thriller",
        imdb: MovieImbd.johnwickImdb,
      ),
      Movie(
        name: "THE WOLF OF WALL STREET",
        description: MovieDescription.wolfofstreet,
        director: "Martin Scorsese",
        duration: "3h",
        publishDate: "2013",
        category: "Crime/Comedy",
        imdb: MovieImbd.wolfofstreetImdb,
      ),
      Movie(
        name: "APOKALIPTO",
        description: MovieDescription.apokalipto,
        director: "MEL GİBSON",
        duration: "2h 18m",
        publishDate: "2006",
        category: "Action/Adventure",
        imdb: MovieImbd.apokaliptoImdb,
      ),
      Movie(
        name: "DJANGO",
        description: MovieDescription.django,
        director: "QUENTİN TARANTİNO",
        duration: "2h 45m",
        publishDate: "2012",
        category: "Western/Action",
        imdb: MovieImbd.djangotoImdb,
      ),
      Movie(
        name: "THE HATEFUL EIGHT",
        description: MovieDescription.hatefuleight,
        director: "QUENTİN TARANTİNO",
        duration: "3h 7m",
        publishDate: "2015",
        category: "Western/Thriller",
        imdb: MovieImbd.hatefuleightImdb,
      ),
      Movie(
        name: "INCENDIES",
        description: MovieDescription.incendies,
        director: "Denis Villeneuve",
        duration: "2h 10m",
        publishDate: "2010",
        category: "War/Mystery",
        imdb: MovieImbd.incenidesImdb,
      ),
      Movie(
        name: "JOHN WICK",
        description: MovieDescription.johnwick,
        director: "Chad Stahelski",
        duration: "2h 49m",
        publishDate: "2023",
        category: "Action/Thriller",
        imdb: MovieImbd.johnwickImdb,
      ),
      Movie(
        name: "THE WOLF OF WALL STREET",
        description: MovieDescription.wolfofstreet,
        director: "Martin Scorsese",
        duration: "3h",
        publishDate: "2013",
        category: "Crime/Comedy",
        imdb: MovieImbd.wolfofstreetImdb,
      ),
    ];
  }

  static Movie movieAt(int index) {
    return movieList[index];
  }

  static Movie movieRemoveAt(int index) {
    return movieList.removeAt(index);
  }

  static bool movieMovie(Movie movie) {
    return movieList.remove(movie);
  }

  static int moiveListLength(List<Movie> movieList) {
    return movieList.length;
  }

  static List<Movie> findMovie(String key) {
    final result = key.isEmpty
        ? movieList
        : movieList
            .where((emp) =>
                emp.getName.toLowerCase().startsWith(key.toLowerCase()))
            .toList();
    return result;
  }
}
