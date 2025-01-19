import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../utils/constants.dart';
import '../utils/animations.dart';
import '../widgets/responsive_wrapper.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/services_section.dart';
import '../widgets/gallery_section.dart';
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
  bool _showBackToTop = false;
  final _sectionKeys = {
    'about': GlobalKey(),
    'services': GlobalKey(),
    'gallery': GlobalKey(),
    'team': GlobalKey(),
    'events': GlobalKey(),
    'resources': GlobalKey(),
    'contact': GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    if (widget.initialSection != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToSection(widget.initialSection!);
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final showBackToTop = _scrollController.offset > 200;
    if (showBackToTop != _showBackToTop) {
      setState(() {
        _showBackToTop = showBackToTop;
      });
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
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
        automaticallyImplyLeading: false,
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
                _buildNavItem('Gallery',
                    onTap: () => _scrollToSection('gallery')),
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
            ],
          ),
        ),
      ),
      endDrawer: isMobile
          ? Drawer(
              child: SafeArea(
                child: Column(
                  children: [
                    const AnimatedDrawerHeader(),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          _buildDrawerItem('About',
                              onTap: () => _scrollToSection('about')),
                          _buildDrawerItem('Services',
                              onTap: () => _scrollToSection('services')),
                          _buildDrawerItem('Gallery',
                              onTap: () => _scrollToSection('gallery')),
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
      floatingActionButton: _showBackToTop
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: AppColors.primary,
              child: const Icon(Icons.arrow_upward, color: Colors.white),
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
                HeroSection(
                  onLearnMorePressed: () => _scrollToSection('resources'),
                  onGetSupportPressed: () => _scrollToSection('contact'),
                ).animate(effects: AppAnimations.fadeIn),
                AboutSection(key: _sectionKeys['about'])
                    .animate(effects: AppAnimations.fadeSlideUp),
                ServicesSection(key: _sectionKeys['services'])
                    .animate(effects: AppAnimations.fadeSlideUp),
                GallerySection(key: _sectionKeys['gallery'])
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

class AnimatedDrawerHeader extends StatefulWidget {
  const AnimatedDrawerHeader({super.key});

  @override
  State<AnimatedDrawerHeader> createState() => _AnimatedDrawerHeaderState();
}

class _AnimatedDrawerHeaderState extends State<AnimatedDrawerHeader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
        color: AppColors.primary,
      ),
      child: Stack(
        children: [
          const Center(
            child: Text(
              'BHLF',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  _controller.reverse().then((_) {
                    Navigator.pop(context);
                  });
                },
                child: RotationTransition(
                  turns: _animation,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
