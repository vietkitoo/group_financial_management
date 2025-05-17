import 'package:flutter/material.dart';
import 'package:group_financial_management/features/home/ui/home_page.dart';
import 'package:group_financial_management/features/welcome_page/logic/name_stream.dart';
import 'package:group_financial_management/features/welcome_page/ui/welcome_screen.dart';
import 'app_route_path.dart';

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  final NameStream nameStream;

  String? _userName;

  AppRouterDelegate(this.nameStream) : navigatorKey = GlobalKey<NavigatorState>() {
    nameStream.nameStream.listen((name) {
      if (_userName != name && name.isNotEmpty) {
        _userName = name;
        notifyListeners();
      }
    });
  }

  @override
  AppRoutePath get currentConfiguration {
    if (_userName == null || _userName!.isEmpty) {
      return AppRoutePath.welcome();
    } else {
      return AppRoutePath.home();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('WelcomePage'),
          child: WelcomePage(nameStream: nameStream),
        ),
        if (_userName != null && _userName!.isNotEmpty)
          MaterialPage(
            key: const ValueKey('HomePage'),
            child: HomePage(userName: _userName!),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        if (_userName != null) {
          _userName = null;
          nameStream.changeName('');
          notifyListeners();
        }

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    if (configuration.isWelcome) {
      _userName = null;
      nameStream.changeName('');
    } else if (configuration.isHome) {
      // Cho phép truy cập Home chỉ khi đã có tên
      if (_userName == null || _userName!.isEmpty) {
        _userName = null;
        nameStream.changeName('');
      }
    }
  }
}
