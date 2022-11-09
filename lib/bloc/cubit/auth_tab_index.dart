import 'package:flutter_bloc/flutter_bloc.dart';

class AuthTabIndex extends Cubit<int> {
  AuthTabIndex() : super(0);

  //for auth page
  int getIndex() {
    return state;
  }
}
