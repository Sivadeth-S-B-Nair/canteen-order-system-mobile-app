// lib/core/router/app_router.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/domain/auth_state.dart';
import '../../features/auth/presentation/login_page.dart';
// import '../../features/auth/presentation/forgot_password_page.dart';
import '../../features/orders/presentation/dashboard_page.dart';
// import '../../features/orders/presentation/orders_page.dart';
import '../../features/auth/providers/auth_provider.dart';

// routerProvider: the router is itself a Riverpod provider so it can
// watch authProvider and react to state changes automatically.
final routerProvider = Provider<GoRouter>((ref) {
  // RouterNotifier bridges Riverpod's authProvider with go_router's
  // refreshListenable. When auth state changes, the router re-evaluates
  // the redirect logic.
  final notifier = RouterNotifier(ref);

  return GoRouter(
    initialLocation: '/login',
    // refreshListenable: go_router watches this Listenable.
    // When it notifies, the router re-runs the redirect function.
    refreshListenable: notifier,
    redirect: notifier._redirect, // our auth guard
    routes: [
      
      // ── Auth routes ─────────────────────────────────────────────────────
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      // GoRoute(
      //   path: '/forgot-password',
      //   builder: (context, state) => const ForgotPasswordPage(),
      // ),

      // ── App shell (main nav) ─────────────────────────────────────────────
      // ShellRoute: wraps child routes with a common scaffold (nav bar).
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: '/dashboard',
            builder: (context, state) => const DashboardPage(),
          ),
          // GoRoute(
          //   path: '/orders',
          //   builder: (context, state) => const OrdersPage(),
          // ),
        ],
      ),
    ],
  );
});

// RouterNotifier watches authProvider and notifies go_router when it changes.
// This is the "glue" between Riverpod and go_router.
class RouterNotifier extends ChangeNotifier {
  final Ref _ref;
  late final ProviderSubscription<AuthState> _sub;

  RouterNotifier(this._ref) {
    // Listen to authProvider; call notifyListeners() whenever state changes.
    // notifyListeners() causes go_router to re-run the redirect function.
    _sub = _ref.listen<AuthState>(authProvider, (_, __) => notifyListeners());
  }

  @override
  void dispose() {
    _sub.close();
    super.dispose();
  }

  // _redirect: runs on every navigation. Return a route to redirect to,
  // or null to allow the navigation.
  // This is equivalent to your middleware.js logic.
  String? _redirect(BuildContext context, GoRouterState state) {
    final authState = _ref.read(authProvider);
    final isAuthRoute =
        state.matchedLocation == '/login' ||
        state.matchedLocation == '/forgot-password';

    return switch (authState) {
      AuthInitial() => null,
      AuthLoading() => null,
      AuthAuthenticated() => isAuthRoute ? '/dashboard' : null,
      AuthUnauthenticated() => isAuthRoute ? null : '/login',
      AuthError() => isAuthRoute ? null : '/login',
    };
  }
}

// AppShell: the persistent bottom navigation bar
class AppShell extends StatelessWidget {
  final Widget child;
  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Determine current tab from route
    final location = GoRouterState.of(context).matchedLocation;
    final currentIndex = location.startsWith('/orders') ? 1 : 0;

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (i) {
          if (i == 0) context.go('/dashboard');
          if (i == 1) context.go('/orders');
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.local_shipping_outlined),
            selectedIcon: Icon(Icons.local_shipping),
            label: 'My Deliveries',
          ),
        ],
      ),
    );
  }
}
