import 'dart:async';
import '../../shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class KloadingButton extends StatelessWidget {
  final String? title;
  final VoidCallback onPressed;

  KloadingButton({super.key, this.title, required this.onPressed});

  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();

  // void loadSuccess() async {
  //   Timer(Duration(seconds: 2), () {
  //     _btnController.success();
  //   });
  // }

  // void loadReset() async {
  //   Timer(Duration(seconds: 2), () {
  //     _btnController.reset();
  //   });
  // }

  // void loadError() async {
  //   Timer(Duration(seconds: 2), () {
  //     _btnController.error();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      resetAfterDuration: true,
      resetDuration: Duration(seconds: 3),
      controller: _btnController,
      onPressed: onPressed,
      child: Text(title!,
          style: whiteTextStyle.copyWith(fontWeight: FontWeight.bold)),
    );
  }
}
