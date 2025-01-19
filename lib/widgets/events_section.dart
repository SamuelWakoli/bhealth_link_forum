import 'package:flutter/material.dart';
import '../utils/constants.dart';

class EventsSection extends StatelessWidget {
  const EventsSection({super.key});

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
                  'Events & Programs',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: AppTheme.paddingMedium),
                const Text(
                  'Join us in our upcoming events and community programs',
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
                    _buildEventCard(
                      'Mental Health Awareness Workshop',
                      'May 15, 2024',
                      'Learn about mental health basics and self-care strategies',
                      'assets/images/workshop.jpg',
                      true,
                    ),
                    _buildEventCard(
                      'Community Support Group Meeting',
                      'Weekly - Every Thursday',
                      'Join our peer support group sessions',
                      'assets/images/support-group.jpg',
                      false,
                    ),
                    _buildEventCard(
                      'Family Education Program',
                      'June 1, 2024',
                      'Educational session for families and caregivers',
                      'assets/images/family-education.jpg',
                      true,
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

  Widget _buildEventCard(
    String title,
    String date,
    String description,
    String imageUrl,
    bool isUpcoming,
  ) {
    return Container(
      width: 350,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppTheme.paddingLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isUpcoming)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.paddingSmall,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Upcoming',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                const SizedBox(height: AppTheme.paddingSmall),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: AppTheme.paddingSmall),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: AppTheme.paddingSmall),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.textLight,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: AppTheme.paddingMedium),
                TextButton(
                  onPressed: () {},
                  child: const Text('Learn More →'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
