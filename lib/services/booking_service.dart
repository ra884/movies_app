import 'package:dio/dio.dart';

class BookingService {
  static Dio dio = Dio();
  static Future<void> CraeteBooking({
    required int seatId,
    required int movieId,
    required String customerName,
  }) async {
    try {
      Response response = await dio.post(
        "https://apimovie.runasp.net/api/Bookings",
        data: {
          "seatId": seatId,
          "movieId": movieId,
          "CustomerName": customerName,
        },
      );
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (anotherError) {
      throw Exception(anotherError.toString());
    }
  }

  static Future<void> UpdateBooking({
    required int id,
    required String customerName,
  }) async {
    try {
      Response response = await dio.put(
        "https://apimovie.runasp.net/api/Bookings/${id}",
        data: {"CustomerName": customerName},
      );
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (anotherError) {
      throw Exception(anotherError.toString());
    }
  }

  static Future<void> DeleteBooking({required int id}) async {
    try {
      Response response = await dio.delete(
        "https://apimovie.runasp.net/api/Bookings/${id}",
      );
    } on DioException catch (dioError) {
      throw Exception(dioError.message);
    } catch (anotherError) {
      throw Exception(anotherError.toString());
    }
  }
}
