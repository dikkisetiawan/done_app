import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class KdrawerController extends Cubit<GlobalKey<ScaffoldState>> {
  KdrawerController() : super(GlobalKey<ScaffoldState>());

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }
}
