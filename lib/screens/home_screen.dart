import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../utils/constants.dart';
import '../utils/animations.dart';
import '../widgets/responsive_wrapper.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/services_section.dart';
import '../widgets/team_section.dart';
import '../widgets/events_section.dart';
import '../widgets/resources_section.dart';
import '../widgets/contact_section.dart';

class HomeScreen extends StatefulWidget {
  final String? initialSection;

  const HomeScreen({super.key, this.initialSection});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  final _sectionKeys = {
    'about': GlobalKey(),
    'services': GlobalKey(),
    'team': GlobalKey(),
    'events': GlobalKey(),
    'resources': GlobalKey(),
    'contact': GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    if (widget.initialSection != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToSection(widget.initialSection!);
      });
    }
  }

  void _scrollToSection(String section) {
    final key = _sectionKeys[section];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).largerThan(MOBILE);
    final isMobile = ResponsiveBreakpoints.of(context).equals(MOBILE);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.symmetric(
            horizontal:
                isMobile ? AppTheme.paddingSmall : AppTheme.paddingLarge,
          ),
          child: Row(
            children: [
              const Text(
                'BHLF',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (isDesktop) ...[
                const Spacer(),
                _buildNavItem('About', onTap: () => _scrollToSection('about')),
                _buildNavItem('Services',
                    onTap: () => _scrollToSection('services')),
                _buildNavItem('Team', onTap: () => _scrollToSection('team')),
                _buildNavItem('Events',
                    onTap: () => _scrollToSection('events')),
                _buildNavItem('Resources',
                    onTap: () => _scrollToSection('resources')),
                _buildNavItem('Contact',
                    onTap: () => _scrollToSection('contact')),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.paddingLarge,
                      vertical: AppTheme.paddingSmall,
                    ),
                  ),
                  child: const Text('Donate'),
                ),
              ],
              if (!isDesktop) ...[
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ],
            ],
          ),
        ),
      ),
      endDrawer: !isDesktop
          ? Drawer(
              child: SafeArea(
                child: Column(
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                      ),
                      child: Center(
                        child: Text(
                          'BHLF',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          _buildDrawerItem('About',
                              onTap: () => _scrollToSection('about')),
                          _buildDrawerItem('Services',
                              onTap: () => _scrollToSection('services')),
                          _buildDrawerItem('Team',
                              onTap: () => _scrollToSection('team')),
                          _buildDrawerItem('Events',
                              onTap: () => _scrollToSection('events')),
                          _buildDrawerItem('Resources',
                              onTap: () => _scrollToSection('resources')),
                          _buildDrawerItem('Contact',
                              onTap: () => _scrollToSection('contact')),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppTheme.paddingMedium),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 48),
                        ),
                        child: const Text('Donate'),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: ResponsiveLayout(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? AppTheme.paddingSmall : 0,
            ),
            child: Column(
              children: [
                const HeroSection().animate(effects: AppAnimations.fadeIn),
                AboutSection(key: _sectionKeys['about'])
                    .animate(effects: AppAnimations.fadeSlideUp),
                ServicesSection(key: _sectionKeys['services'])
                    .animate(effects: AppAnimations.fadeSlideUp),
                TeamSection(key: _sectionKeys['team'])
                    .animate(effects: AppAnimations.fadeSlideUp),
                EventsSection(key: _sectionKeys['events'])
                    .animate(effects: AppAnimations.fadeSlideUp),
                ResourcesSection(key: _sectionKeys['resources'])
                    .animate(effects: AppAnimations.fadeSlideUp),
                ContactSection(key: _sectionKeys['contact'])
                    .animate(effects: AppAnimations.fadeSlideUp),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String title, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.paddingMedium),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title, {VoidCallback? onTap}) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        onTap?.call();
      },
    );
  }
}
