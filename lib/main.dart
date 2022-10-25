// ignore_for_file: deprecated_member_use

import 'package:news_app/AppCubit/cubit.dart';
import 'package:news_app/AppCubit/state.dart';
import 'package:news_app/Layout/Cubit/cubit.dart';
import 'package:news_app/Layout/news_app.dart';
import 'package:news_app/Network/local/cache_helper.dart';
import 'package:news_app/Network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
//import 'package:news_app/Layout/Cubit/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CasheHelper.init();

  bool? isDark = CasheHelper.getBoolen(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  const MyApp(this.isDark, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()
            ..getBusiness()
            ..getsports()
            ..getsports(),
        ),
        BlocProvider(
            create: (BuildContext context) => AppCubit()
              ..changeMode(
                modetheme: isDark,
              ))
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode:
            AppCubit.get(context).isDrak ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData(
                scaffoldBackgroundColor: HexColor('0C090A'),
                primarySwatch: Colors.deepOrange,
                appBarTheme: AppBarTheme(
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('0C090A'),
                      statusBarIconBrightness: Brightness.light),
                  backgroundColor: HexColor('0C090A'),
                  elevation: 0.0,
                  titleTextStyle: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  iconTheme: const IconThemeData(color: Colors.white),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  backgroundColor: HexColor('0C090A'),
                  unselectedItemColor: Colors.white60,
                  elevation: 50.0,
                ),
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.white))),
            theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  iconTheme: IconThemeData(color: Colors.black),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  backgroundColor: Colors.white,
                  unselectedItemColor: Colors.black,
                  elevation: 50.0,
                ),
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black))),
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}
