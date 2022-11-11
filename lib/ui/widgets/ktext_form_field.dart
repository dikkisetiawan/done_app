import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class KtextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final void Function(String)? onFieldSubmitted;

  const KtextFormField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.obscureText = false,
      this.onFieldSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: 10, horizontal: defaultMargin),
      child: TextFormField(
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        obscureText: obscureText,
        style: whiteTextStyle,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultCircular),
              borderSide: BorderSide(color: kWhiteColor)),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: kInfoColor),
            borderRadius: BorderRadius.circular(defaultCircular),
          ),
          hintText: hintText,
          hintStyle: greyTextStyle,
        ),
      ),
    );
  }
}
