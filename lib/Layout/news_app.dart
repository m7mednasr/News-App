import 'package:news_app/AppCubit/cubit.dart';
import 'package:news_app/Component/appcomponent.dart';
import 'package:news_app/Layout/Cubit/cubit.dart';
import 'package:news_app/Layout/Cubit/state.dart';
import 'package:news_app/modules/Search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "News App",
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeMode();
                  },
                  icon: const Icon(Icons.brightness_4_outlined)),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomNavBar,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changebottomnavindex(index);
            },
          ),
        );
      },
    );
  }
}
