import 'package:flutter_bloc/flutter_bloc.dart';

class ToggleTaskCubit extends Cubit<bool> {
  ToggleTaskCubit() : super(false);

  void toggleWidget() {
    emit(!state);

    print('direplace');
  }
}
