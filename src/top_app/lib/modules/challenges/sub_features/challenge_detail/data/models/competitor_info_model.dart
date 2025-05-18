import 'package:top_app/modules/challenges/sub_features/challenge_detail/domain/entities/competitor_info.dart';

class CompetitorInfoModel {
  final String userName;
  final String profilePictureUrl;

  CompetitorInfoModel({required this.userName, required this.profilePictureUrl});

  factory CompetitorInfoModel.fromJson(Map<String, dynamic> json) {
    return CompetitorInfoModel(
      userName: json['userName'],
      profilePictureUrl: json['userProfilePictureUrl'],
    );
  }

  CompetitorInfo toEntity() {
    return CompetitorInfo(userName: userName, profilePictureUrl: profilePictureUrl);
  }
}
