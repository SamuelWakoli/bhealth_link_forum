import 'package:flutter/material.dart';
import '../utils/constants.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(MOBILE);
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

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
                Wrap(
                  spacing: AppTheme.paddingLarge,
                  runSpacing: AppTheme.paddingLarge,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildStatCard(
                      '1.5M+',
                      'Population Served',
                      'Providing mental health services to Bungoma County',
                    ),
                    _buildStatCard(
                      '1st',
                      'Psychiatrist',
                      'Only psychiatrist in Bungoma County',
                    ),
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
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GradientCard(
        padding: const EdgeInsets.all(AppTheme.paddingLarge),
        child: SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(
                  color: AppColors.textLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
