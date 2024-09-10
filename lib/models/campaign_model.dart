import 'dart:convert';

class Tournament {
  final int? tournamentId;
  final String? tournamentName;
  final String? formatType;
  final String? tournamentType;
  final int? numberOfTeams;
  final int? numberOfSets;
  final int? rank;
  final int? tournamentCampaignId;
  final String? imageUrl;

  Tournament({
    this.tournamentId,
    this.tournamentName,
    this.formatType,
    this.tournamentType,
    this.numberOfTeams,
    this.numberOfSets,
    this.rank,
    this.tournamentCampaignId,
    this.imageUrl,
  });

  factory Tournament.fromJson(Map<String, dynamic> json) {
    return Tournament(
      tournamentId: json['tournamentId'] as int?,
      tournamentName: json['tournamentName'] as String?,
      formatType: json['formatType'] as String?,
      tournamentType: json['tournamentType'] as String?,
      numberOfTeams: json['numberOfTeams'] as int?,
      numberOfSets: json['numberOfSets'] as int?,
      rank: json['rank'] as int?,
      tournamentCampaignId: json['tournamentCampaignId'] as int?,
      imageUrl: json['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tournamentId': tournamentId,
      'tournamentName': tournamentName,
      'formatType': formatType,
      'tournamentType': tournamentType,
      'numberOfTeams': numberOfTeams,
      'numberOfSets': numberOfSets,
      'rank': rank,
      'tournamentCampaignId': tournamentCampaignId,
      'imageUrl': imageUrl,
    };
  }
}

List<Tournament> parseTournaments(String jsonString) {
  final parsed = json.decode(jsonString) as List<dynamic>;
  return parsed
      .map<Tournament>(
          (json) => Tournament.fromJson(json as Map<String, dynamic>))
      .toList();
}
