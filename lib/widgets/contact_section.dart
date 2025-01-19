import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
                  'Contact Us',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ),
                const SizedBox(height: AppTheme.paddingMedium),
                const Text(
                  'Get in touch with us for support or inquiries',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.textLight,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppTheme.paddingLarge * 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildContactInfo(
                            'Location',
                            'Bungoma, Western Kenya',
                            Icons.location_on,
                          ),
                          const SizedBox(height: AppTheme.paddingLarge),
                          _buildContactInfo(
                            'Email',
                            'info@bhlfkenya.org',
                            Icons.email,
                          ),
                          const SizedBox(height: AppTheme.paddingLarge),
                          _buildContactInfo(
                            'Phone',
                            '+254 700 000000',
                            Icons.phone,
                          ),
                          const SizedBox(height: AppTheme.paddingLarge),
                          _buildSocialLinks(),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppTheme.paddingLarge * 2),
                    Expanded(
                      child: Container(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Send us a message',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.text,
                              ),
                            ),
                            const SizedBox(height: AppTheme.paddingLarge),
                            _buildTextField('Name'),
                            const SizedBox(height: AppTheme.paddingMedium),
                            _buildTextField('Email'),
                            const SizedBox(height: AppTheme.paddingMedium),
                            _buildTextField('Subject'),
                            const SizedBox(height: AppTheme.paddingMedium),
                            _buildTextField('Message', maxLines: 4),
                            const SizedBox(height: AppTheme.paddingLarge),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppTheme.paddingLarge,
                                  vertical: AppTheme.paddingMedium,
                                ),
                              ),
                              child: const Text('Send Message'),
                            ),
                          ],
                        ),
                      ),
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

  Widget _buildContactInfo(String title, String content, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.primary,
          size: 24,
        ),
        const SizedBox(width: AppTheme.paddingMedium),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textLight,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialLinks() {
    return Row(
      children: [
        _buildSocialIcon(Icons.facebook, 'Facebook'),
        const SizedBox(width: AppTheme.paddingMedium),
        _buildSocialIcon(Icons.ondemand_video, 'YouTube'),
        const SizedBox(width: AppTheme.paddingMedium),
        _buildSocialIcon(Icons.camera_alt_outlined, 'Instagram'),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String label) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        icon,
        color: AppColors.primary,
        size: 28,
      ),
      tooltip: label,
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppTheme.paddingMedium,
          vertical: AppTheme.paddingSmall,
        ),
      ),
    );
  }
}
