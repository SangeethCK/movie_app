import 'package:flutter/material.dart';
import 'package:movie_app/core/multi_provider_list.dart';
import 'package:movie_app/core/routes/navigator.dart';
import 'package:movie_app/core/routes/route_generator.dart';
import 'package:movie_app/core/routes/routes.dart';
import 'package:movie_app/prsentation/screens/home/screen_home.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: MultiProviderList.providerList,
      child: ResponsiveSizer(
        builder: (p0, p1, p2) {
          return MaterialApp(
            title: 'Flutter Demo',
              onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
        initialRoute: initialRoutes,
        navigatorKey: routeKey,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const ScreenHome(),
          );
        },
      ),
    );
  }
}
