import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardHeaderCubit extends Cubit<bool> {
  DashboardHeaderCubit() : super(false);

  void replaceWidget() {
    emit(true);
    print('direplace');
  }
}
