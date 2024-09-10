class FindTournamentModel {
  final int id;
  final String tournamentName;
  final DateTime startDate;
  final DateTime endDate;
  final String location;
  final String imageUrl;

  FindTournamentModel({
    required this.id,
    required this.tournamentName,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.imageUrl,
  });

  factory FindTournamentModel.fromJson(Map<String, dynamic> json) {
    return FindTournamentModel(
      id: json['id'],
      tournamentName: json['tournamentName'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      location: json['location'],
      imageUrl: json['imageUrl'],
    );
  }
}
