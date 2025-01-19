import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.background,
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
                  'Our Services',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: AppTheme.paddingMedium),
                const Text(
                  'We provide comprehensive mental health support through various programs',
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
                    _buildServiceCard(
                      'Psychiatric Services',
                      'Professional diagnosis and treatment by our resident psychiatrist',
                      Icons.medical_services,
                    ),
                    _buildServiceCard(
                      'Social Programs',
                      'Group activities and community engagement to reduce isolation',
                      Icons.people,
                    ),
                    _buildServiceCard(
                      'Vocational Training',
                      'Skills development and employment support programs',
                      Icons.work,
                    ),
                    _buildServiceCard(
                      'Support Groups',
                      'Peer-led support groups for shared experiences and healing',
                      Icons.group,
                    ),
                    _buildServiceCard(
                      'Crisis Support',
                      '24/7 emergency mental health support and intervention',
                      Icons.emergency,
                    ),
                    _buildServiceCard(
                      'Family Education',
                      'Resources and support for families and caregivers',
                      Icons.family_restroom,
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

  Widget _buildServiceCard(String title, String description, IconData icon) {
    return GradientCard(
      padding: const EdgeInsets.all(AppTheme.paddingLarge),
      gradient: AppColors.primaryGradient,
      child: SizedBox(
        width: 350,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 48,
              color: Colors.white,
            ),
            const SizedBox(height: AppTheme.paddingMedium),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: AppTheme.paddingSmall),
            Text(
              description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
