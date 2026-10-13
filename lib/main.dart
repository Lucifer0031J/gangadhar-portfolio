import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/portfolio_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Force portrait + landscape for phones, all for tablets/desktop
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFF050A14),
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const PortfolioApp());
}
