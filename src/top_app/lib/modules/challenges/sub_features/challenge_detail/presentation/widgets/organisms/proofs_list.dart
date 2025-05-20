import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/shared/entities/templates/activity.dart';
import 'package:top_app/shared/widgets/tiles/proof_tile.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';

class ProofsList extends StatelessWidget {
  const ProofsList({
    super.key,
    required this.challenge,
  });

  final Challenge challenge;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Proof of completion',
          style: AppTextStyles.bold18,
        ),
        const SizedBox(height: 10),
        ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: challenge.activities.length,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 8),
          itemBuilder: (BuildContext context, int index) {
            final Activity activity = challenge.activities[index];
            return ProofTile(
              name: activity.proof[0].name,
              icon: activity.proof[0].icon,
            );
          },
        ),
      ],
    );
  }
}
