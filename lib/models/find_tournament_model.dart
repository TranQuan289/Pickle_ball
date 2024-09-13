class FindTournamentModel {
  final int id;
  final String tournamentName;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime? registrationExpiredDate; // Updated to nullable
  final String location; // Updated to non-nullable with default value
  final DateTime creationDate; // New field
  final DateTime? modificationDate; // New field
  final DateTime? deletionDate; // New field
  final String imageUrl;

  FindTournamentModel({
    required this.id,
    required this.tournamentName,
    required this.startDate,
    required this.endDate,
    this.registrationExpiredDate, // Updated to nullable
    String? location, // Updated to nullable
    required this.creationDate, // New field
    this.modificationDate, // New field
    this.deletionDate, // New field
    required this.imageUrl,
  }) : location = location ?? ""; // Default to empty string if null

  factory FindTournamentModel.fromJson(Map<String, dynamic> json) {
    return FindTournamentModel(
      id: json['id'],
      tournamentName:
          json['tournamentName'] ?? "", // Default to empty string if null
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      registrationExpiredDate: json['registrationExpiredDate'] != null
          ? DateTime.parse(json['registrationExpiredDate'])
          : null, // Handle nullable
      location: json['location'] ?? "", // Default to empty string if null
      creationDate: DateTime.parse(json['creationDate']), // New field
      modificationDate: json['modificationDate'] != null
          ? DateTime.parse(json['modificationDate'])
          : null, // Handle nullable
      deletionDate: json['deletionDate'] != null
          ? DateTime.parse(json['deletionDate'])
          : null, // Handle nullable
      imageUrl: json['imageUrl'] ?? "", // Default to empty string if null
    );
  }
}
