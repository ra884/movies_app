class MovieModel {
  final int id;
  final String name;
  final String poster;
  final String showDate;
  final String showTime;
  final List<SeatModel> Seats;

  new({
    required this.id,
    required this.name,
    required this.poster,
    required this.showDate,
    required this.showTime,
    required this.Seats,
  });
}

class Movies {
  final bool status;
  final String message;
  final List<MovieModel> movies;

  new({required this.status, required this.message, required this.movies});
  factory Movies.fromJson(Map<String, dynamic> json) {
    final tempList = json["data"]
        .map<MovieModel>(
          (movie) => MovieModel(
            id: movie["id"]??"",
            name: movie["name"],
            poster: movie["poster"],
            showDate: movie["showDate"],
            showTime: movie["showTime"],
            Seats: movie["seats"].map<SeatModel>(
              (seat) => SeatModel(
                id: seat["seatId"]??-1,
                bookingId: seat["bookingId"]??-1,
                seatNumber: seat["seatNumber"]??"",
                status: seat["status"]??"",
                customerName: seat["customerName"]??"",
              ),
            ).toList(),
          ),
        )
        .toList();
    return Movies(
      status: json["status"],
      message: json["message"],
      movies: tempList,
    );
  }
}

class SeatModel {
  final int id;
  final int bookingId;
  final String seatNumber;
  final String status;
  final String customerName;

  new({
    required this.id,
    required this.bookingId,
    required this.seatNumber,
    required this.status,
    required this.customerName,
  });
}
