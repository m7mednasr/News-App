// ignore_for_file: avoid_print

import 'package:news_app/Layout/Cubit/state.dart';
import 'package:news_app/Network/remote/dio_helper.dart';
import 'package:news_app/modules/Business/business.dart';
import 'package:news_app/modules/Science/science.dart';
import 'package:news_app/modules/Sports/sports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(IntialNewsApp());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavBar = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business_center), label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: 'Sciene'),
    // const BottomNavigationBarItem(
    //     icon: Icon(Icons.settings), label: 'Settings'),
  ];

  void changebottomnavindex(int index) {
    currentIndex = index;
    if (index == 1) {
      getsports();
    }

    if (index == 2) {
      getscience();
    }
    emit(NewsBottomNavApp());
  }

  List<Widget> screens = [
    const BusinessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
    //const SettingsScreen()
  ];

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsLoadingApp());
    DioHelper.gitData(uri: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apikey': '7cbc5b58c7714ac89c16bce42407e35e',
    }).then((value) {
      business = value.data['articles'];
      //print(business[0]['title']);
      emit(NewsBusinessSuccess());
    }).catchError((erorr) {
      print(erorr.toString());
      emit(NewsBusinessErorr(erorr));
    });
  }

  List<dynamic> sports = [];

  void getsports() {
    emit(NewsSportsLoadingApp());
    if (sports.isEmpty) {
      DioHelper.gitData(uri: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apikey': '7cbc5b58c7714ac89c16bce42407e35e',
      }).then((value) {
        sports = value.data['articles'];
        //print(sports[0]['title']);
        emit(NewsSportsSuccess());
      }).catchError((erorr) {
        print(erorr.toString());
        emit(NewsSportsErorr(erorr));
      });
    } else {
      emit(NewsSportsSuccess());
    }
  }

  List<dynamic> science = [];

  void getscience() {
    emit(NewsScienceLoadingApp());
    if (science.isEmpty) {
      DioHelper.gitData(uri: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apikey': '7cbc5b58c7714ac89c16bce42407e35e',
      }).then((value) {
        science = value.data['articles'];
        //print(science[0]['title']);
        emit(NewsScienceSuccess());
      }).catchError((erorr) {
        print(erorr.toString());
        emit(NewsScienceErorr(erorr));
      });
    } else {
      emit(NewsScienceSuccess());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsSerachLoadingApp());
    if (value.isEmpty) {
      emit(NewsSerachLoadingApp());
    } else {
      DioHelper.gitData(uri: 'v2/everything', query: {
        'q': value,
        'apikey': '7cbc5b58c7714ac89c16bce42407e35e',
      }).then((value) {
        search = value.data['articles'];
        //print(search[0]['title']);
        emit(NewsSerachSuccess());
      }).catchError((erorr) {
        print(erorr.toString());
        emit(NewsScienceErorr(erorr));
      });
    }
  }
}
