import 'package:flutter/material.dart';
import '../utils/constants.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.primary,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppTheme.maxWidth),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.paddingLarge,
              vertical: AppTheme.paddingLarge * 2,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Supporting Mental Health\nin Bungoma County',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: AppTheme.paddingLarge),
                      const Text(
                        'Helping individuals build resilience and lead fulfilling lives through community support and professional care.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: AppTheme.paddingLarge * 2),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: AppColors.primary,
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppTheme.paddingLarge,
                                vertical: AppTheme.paddingMedium,
                              ),
                            ),
                            child: const Text('Get Support'),
                          ),
                          const SizedBox(width: AppTheme.paddingMedium),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: const BorderSide(color: Colors.white),
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppTheme.paddingLarge,
                                vertical: AppTheme.paddingMedium,
                              ),
                            ),
                            child: const Text('Learn More'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppTheme.paddingLarge * 2),
                Image.asset(
                  'assets/images/hero-image.png',
                  width: 500,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
