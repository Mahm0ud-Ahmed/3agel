import 'package:aagel/src/core/config/injector.dart';
import 'package:aagel/src/core/config/routes/app_route.dart';
import 'package:aagel/src/core/config/themes/theme_manager.dart';
import 'package:aagel/src/presentation/controllers/data_bloc/api_data_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'main.reflectable.dart';
import 'src/core/config/l10n/generated/l10n.dart';
import 'src/core/config/themes/language_manager.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  initializeReflectable();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApiDataBloc>(
      create: (context) => ApiDataBloc(),
      child: AnimatedBuilder(
          animation: Listenable.merge([ThemeManager(), LanguageManager()]),
          builder: (context, child) => MaterialApp(
            title: '3agel',
            debugShowCheckedModeBanner: false,
            theme: ThemeManager().myTheme, //Light Theme
            darkTheme: ThemeManager().myTheme,
            themeMode: ThemeManager().mode,
            onGenerateRoute: AppRoute.generateRoute,
            locale: LanguageManager().locale,
            localizationsDelegates: const [
              S.delegate,
              AppLocalizationDelegate(),
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            scrollBehavior: MyCustomScrollBehavior(),
          ),
        ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => { 
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.stylus,
    PointerDeviceKind.unknown,
    // etc.
  };
}
