import '../model/movie.dart';
import '../db/dbhelper.dart';

class ProductProvider {
  static const TABLENAME = 'movie';
  static const String FIELD_ID = "id";
  static const String FIELD_NAME = "name";
  static const String FIELD_DIRECTOR = "director";
  static const String FIELD_DESCRIPTION = "description";
  static const String FIELD_PUBLISH_DATE = "publishDate";
  static const String FIELD_DURATION = "duration";
  static const String FIELD_CATEGORY = "category";
  static const String FIELD_IMDB = "imdb";

  static const String CREATETABLESQL =
      "CREATE TABLE IF NOT EXISTS $TABLENAME ( $FIELD_ID TEXT PRIMARY KEY , $FIELD_NAME TEXT, $FIELD_DIRECTOR TEXT, $FIELD_DESCRIPTION TEXT, $FIELD_PUBLISH_DATE TEXT, $FIELD_DURATION TEXT, $FIELD_CATEGORY TEXT, $FIELD_IMDB TEXT)";

  static const String DELETESQL = "DELETE FROM ${TABLENAME}";
  static const String SELECTSQLQUERYWITHID =
      "SELECT * from ${TABLENAME} where id = ? ";

  final dbHelper = DBHelper();

  Future<List<Movie>> getAllProducts() async {
    var data = await dbHelper.getAllRecords(TABLENAME);
    List<Movie> movies =
        List.generate(data.length, (index) => Movie.fromJson(data[index]));
    print(movies.length);
    return movies;
  }

  Future<List<Movie>> searchMovies(String nameKey, String directorKey) async {
    var whereClause = " ${FIELD_NAME} LIKE ? and ${FIELD_DIRECTOR} LIKE ? ";
    var data = await dbHelper.searchRecords(
        TABLENAME, whereClause, ['%${nameKey}%', '%${directorKey}%']);
    print("${whereClause},'%${nameKey}%', '%${directorKey}%'");

    List<Movie> movies =
        List.generate(data.length, (index) => Movie.fromJson(data[index]));
    print("lenght: ${movies.length} searched movies: ${movies.toString()}");
    return movies;
  }

  Future<bool> insertMovie(Movie movie) {
    return dbHelper.insertRecord(TABLENAME, movie.toMap());
  }

  // void updateMovie(Movie movie) {
  //   dbHelper.updateRecord(TABLENAME, movie.toMap(), " id=?", [movie.id]);
  // }

  Future<void> deleteMovie(String id) async {
    var args = [id];
    dbHelper.deleteRecord(TABLENAME, " id=? ", args);
  }
}
