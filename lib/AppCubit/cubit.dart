import 'package:news_app/AppCubit/state.dart';
import 'package:news_app/Network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(InitalAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isDrak = false;

  void changeMode({bool? modetheme}) {
    if (modetheme != null) {
      isDrak = modetheme;
      emit(ChangeModeState());
    } else {
      isDrak = !isDrak;
      CasheHelper.putBoolen(key: 'isDark', value: isDrak).then((value) {
        emit(ChangeModeState());
      });
    }
  }
}
