import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:iti_g24_1/dummy_projects/ecommerce/presentation/home/cubit/home_cubit.dart';

import 'dummy_projects/ecommerce/presentation/login/cubit/login_cubit.dart';
import 'dummy_projects/ecommerce/presentation/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// (1) Material App
    /// (2) home: Screen (UI)
    /// (3) Scaffold ( widget )

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(
              create: (context) => HomeCubit()
                ..getbanners()
                ..getPopularProducts()),
        ],
        child: const GetMaterialApp(
          locale: Locale("ar"),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ));
  }
}
