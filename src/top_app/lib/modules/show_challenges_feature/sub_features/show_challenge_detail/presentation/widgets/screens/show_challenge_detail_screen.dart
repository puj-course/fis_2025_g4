import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenge_detail/presentation/widgets/organisms/activities_list.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenge_detail/presentation/widgets/organisms/challenge_header.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenge_detail/presentation/widgets/organisms/proofs_list.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';

@RoutePage()
class ShowChallengeDetailScreen extends StatefulWidget {
  const ShowChallengeDetailScreen({
    super.key,
    required this.challenge,
  });

  final Challenge challenge;

  @override
  State<ShowChallengeDetailScreen> createState() => _ShowChallengeDetailScreenState();
}

class _ShowChallengeDetailScreenState extends State<ShowChallengeDetailScreen> {
  bool _isLoading = false;
  bool _isJoined = false;

  Future<void> _handleJoinPressed() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // TODO: Implement join
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      setState(() {
        _isJoined = true;
      });
    } catch (e) {
      // TODO: Handle error
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _handleActivityTap(String activityName) {
    // TODO: Navigate to activity detail
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.blackPrimary,
        foregroundColor: AppColors.whitePrimary,
        title: Text(
          widget.challenge.name,
          style: AppTextStyles.bold18.copyWith(color: AppColors.whitePrimary),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChallengeHeader(
                challenge: widget.challenge,
                onJoinPressed: _handleJoinPressed,
                isLoading: _isLoading,
                isJoined: _isJoined,
              ),
              const SizedBox(height: 15),
              const Divider(color: AppColors.grayDark),
              const SizedBox(height: 15),
              ActivitiesList(
                challenge: widget.challenge,
                onActivityTap: _handleActivityTap,
              ),
              const SizedBox(height: 15),
              const Divider(color: AppColors.grayDark),
              const SizedBox(height: 15),
              ProofsList(
                challenge: widget.challenge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
