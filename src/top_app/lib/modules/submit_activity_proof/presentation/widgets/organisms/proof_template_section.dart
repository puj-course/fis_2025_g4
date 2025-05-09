import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/shared/entities/templates/proof.dart';
import 'package:top_app/shared/widgets/tiles/proof_tile.dart';

class ProofTemplateSection extends StatelessWidget {
  final Proof proofTemplate;

  const ProofTemplateSection({
    super.key,
    required this.proofTemplate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Required Proof', style: AppTextStyles.bold18),
        ProofTile(name: proofTemplate.name, icon: proofTemplate.icon),
        Text('Your submission', style: AppTextStyles.bold18),
        const SizedBox(height: 10),
      ],
    );
  }
}
