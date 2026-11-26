import 'package:dio/dio.dart';
import 'package:movies_app/models/movie_model.dart';

class MovieService {
  static Dio dio = Dio();
  static Future<Movies> RequestMovies() async {
    try {
      Response response = await dio.get(
        "https://apimovie.runasp.net/api/Movies",
      );
      return Movies.fromJson(response.data);
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (anotherError) {
      throw Exception(anotherError.toString());
    }
  }
 static Future<Movies> SearchByName({required String title}) async{
  
 }
}
