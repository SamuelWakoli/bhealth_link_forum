import 'package:flutter/material.dart';
import '../utils/constants.dart';

class TeamSection extends StatelessWidget {
  const TeamSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppTheme.maxWidth),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.paddingLarge,
              vertical: AppTheme.paddingLarge * 2,
            ),
            child: Column(
              children: [
                const Text(
                  'Our Team',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: AppTheme.paddingMedium),
                const Text(
                  'Meet the dedicated professionals behind BHLF',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.textLight,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppTheme.paddingLarge * 2),
                Wrap(
                  spacing: AppTheme.paddingLarge,
                  runSpacing: AppTheme.paddingLarge,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildTeamMemberCard(
                      'Dr. Karen Sumba',
                      'Executive Director',
                      'assets/images/karen-sumba.jpg',
                      'Leading mental health initiatives in Bungoma County',
                    ),
                    _buildTeamMemberCard(
                      'Dr. James Wafula',
                      'Lead Psychiatrist',
                      'assets/images/james-wafula.jpg',
                      'Providing expert psychiatric care and diagnosis',
                    ),
                    _buildTeamMemberCard(
                      'Sarah Nekesa',
                      'Program Coordinator',
                      'assets/images/sarah-nekesa.jpg',
                      'Managing community outreach and support programs',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTeamMemberCard(
    String name,
    String role,
    String imageUrl,
    String description,
  ) {
    return GradientCard(
      padding: const EdgeInsets.all(AppTheme.paddingLarge),
      child: SizedBox(
        width: 300,
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(imageUrl),
            ),
            const SizedBox(height: AppTheme.paddingLarge),
            Text(
              name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              role,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppTheme.paddingMedium),
            Text(
              description,
              style: TextStyle(
                color: AppColors.textLight,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
