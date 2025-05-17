import 'package:flutter/material.dart';
import 'package:group_financial_management/features/welcome_page/logic/name_stream.dart';
import 'package:group_financial_management/route/app_route_information_parser.dart';
import 'package:group_financial_management/route/app_router_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NameStream _nameStream = NameStream();

  late final AppRouterDelegate _routerDelegate;
  late final AppRouteInformationParser _routeInformationParser;

  @override
  void initState() {
    super.initState();
    _routerDelegate = AppRouterDelegate(_nameStream);
    _routeInformationParser = AppRouteInformationParser();
  }

  @override
  void dispose() {
    _nameStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Group financial management',
      routerDelegate: _routerDelegate,
      debugShowCheckedModeBanner: false,
      routeInformationParser: _routeInformationParser,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
