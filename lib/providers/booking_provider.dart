import 'package:flutter/material.dart';
import 'package:movies_app/services/booking_service.dart';

class BookingProvider extends ChangeNotifier {
  Future<void> RequestCreateBookin({
    required int seatId,
    required int movieId,
    required String customerName,
  }) async {
    await BookingService.CraeteBooking(
      seatId: seatId,
      movieId: movieId,
      customerName: customerName,
    );
    notifyListeners();
  }
  Future<void> RequestUpdateBooking({
    required String customerName,
    required int bookingId
  }) async {
    await BookingService.UpdateBooking(
      customerName: customerName,
      id: bookingId
    );
    notifyListeners();
  }
  Future<void> RequestDeleteBooking({
    required int bookingId
  }) async {
    await BookingService.DeleteBooking(
      id: bookingId
    );
    notifyListeners();
  }
}
