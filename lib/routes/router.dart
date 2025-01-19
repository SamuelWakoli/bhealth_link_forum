import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const HomeScreen(initialSection: 'about'),
    ),
    GoRoute(
      path: '/services',
      builder: (context, state) => const HomeScreen(initialSection: 'services'),
    ),
    GoRoute(
      path: '/team',
      builder: (context, state) => const HomeScreen(initialSection: 'team'),
    ),
    GoRoute(
      path: '/events',
      builder: (context, state) => const HomeScreen(initialSection: 'events'),
    ),
    GoRoute(
      path: '/resources',
      builder: (context, state) =>
          const HomeScreen(initialSection: 'resources'),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => const HomeScreen(initialSection: 'contact'),
    ),
  ],
);
