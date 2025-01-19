import 'package:flutter/material.dart';
import '../utils/constants.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
                  'About Us',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: AppTheme.paddingLarge),
                const Text(
                  'Established on March 30, 2022',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: AppTheme.paddingLarge),
                const Text(
                  'Bungoma Health Link Forum (BHLF) is a community-based health organization located in Bungoma, western Kenya. We aim to support individuals living with serious and persistent mental illnesses, helping them build resilience and lead fulfilling lives.',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textLight,
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppTheme.paddingLarge * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStatCard(
                      '1.5M+',
                      'Population Served',
                      'Providing mental health services to Bungoma County',
                    ),
                    const SizedBox(width: AppTheme.paddingLarge),
                    _buildStatCard(
                      '1st',
                      'Psychiatrist',
                      'Only psychiatrist in Bungoma County',
                    ),
                    const SizedBox(width: AppTheme.paddingLarge),
                    _buildStatCard(
                      '24/7',
                      'Support',
                      'Continuous care and support for our community',
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

  Widget _buildStatCard(String number, String title, String description) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(AppTheme.paddingLarge),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            number,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: AppTheme.paddingSmall),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: AppTheme.paddingSmall),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textLight,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
