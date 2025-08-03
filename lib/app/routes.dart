import 'package:go_router/go_router.dart';

import '../presentation/navigation/bottom_navigation.dart';
import '../presentation/pages/calendar/calendar_page.dart';
import '../presentation/pages/dashboard/dashboard_page.dart';
import '../presentation/pages/pet_room/pet_room_page.dart';
import '../presentation/pages/settings/settings_page.dart';
import '../presentation/pages/social/social_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return BottomNavigationWrapper(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            name: 'dashboard',
            builder: (context, state) => const DashboardPage(),
          ),
          GoRoute(
            path: '/calendar',
            name: 'calendar',
            builder: (context, state) => const CalendarPage(),
          ),
          GoRoute(
            path: '/social',
            name: 'social',
            builder: (context, state) => const SocialPage(),
          ),
          GoRoute(
            path: '/pet-room',
            name: 'pet-room',
            builder: (context, state) => const PetRoomPage(),
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            builder: (context, state) => const SettingsPage(),
          ),
        ],
      ),
    ],
  );
} 