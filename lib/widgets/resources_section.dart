import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ResourcesSection extends StatelessWidget {
  const ResourcesSection({super.key});

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
                  'Mental Health Resources',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: AppTheme.paddingMedium),
                const Text(
                  'Access helpful information and educational materials',
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
                    _buildResourceCard(
                      'Mental Health Guide',
                      'Comprehensive guide to understanding mental health',
                      Icons.book,
                      'Download PDF',
                    ),
                    _buildResourceCard(
                      'Self-Care Toolkit',
                      'Practical tools and techniques for mental wellness',
                      Icons.healing,
                      'View Toolkit',
                    ),
                    _buildResourceCard(
                      'Crisis Helpline',
                      'Emergency contacts and crisis support information',
                      Icons.phone,
                      'View Contacts',
                    ),
                    _buildResourceCard(
                      'Educational Videos',
                      'Watch our informative mental health videos',
                      Icons.play_circle,
                      'Watch Now',
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

  Widget _buildResourceCard(
    String title,
    String description,
    IconData icon,
    String buttonText,
  ) {
    return Container(
      width: 250,
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
          Icon(
            icon,
            size: 48,
            color: AppColors.primary,
          ),
          const SizedBox(height: AppTheme.paddingMedium),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppTheme.paddingSmall),
          Text(
            description,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textLight,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppTheme.paddingMedium),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
            ),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
