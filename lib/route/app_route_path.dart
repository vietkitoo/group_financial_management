class AppRoutePath {
  final bool isWelcome;
  final bool isHome;

  AppRoutePath.welcome()
      : isWelcome = true,
        isHome = false;

  AppRoutePath.home()
      : isWelcome = false,
        isHome = true;

  bool get isUnknown => !isWelcome && !isHome;
}
