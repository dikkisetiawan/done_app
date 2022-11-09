import 'dart:async';

import 'package:done_list/bloc/cubit/auth_tab_index.dart';
import 'package:done_list/bloc/cubit/task_cubit.dart';

import '../../shared/theme.dart';
import '../../ui/responsive.dart';
import '../../ui/widgets/ktext_form_field.dart';
import '../../ui/widgets/kloading_button.dart';
import '/bloc/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  static TextEditingController nameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();

  void attemptSignIn(BuildContext context) {
    print('Mencoba Login ${emailController}');
    context
        .read<AuthCubit>()
        .signIn(email: emailController.text, password: passwordController.text);
  }

  void disposeController() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
  }

  void attemptSignUp(BuildContext context) {
    print('Mencoba register');
    context.read<AuthCubit>().signUp(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text);
  }

  Widget kTabBar(BuildContext context) {
    return TabBar(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.isMobile(context) ? 150 : 30, vertical: 20),
        labelColor: kWhiteColor,
        unselectedLabelColor: kGreyColor,
        labelStyle: whiteTextStyle.copyWith(fontWeight: FontWeight.w600),
        tabs: const [
          Tab(text: 'Sign In'),
          Tab(text: 'Sign Up'),
        ]);
  }

  Widget kTabBarView(BuildContext context) {
    return Expanded(
      child: TabBarView(physics: const BouncingScrollPhysics(), children: [
        ListView(children: [
          KtextFormField(
            hintText: 'Email..',
            controller: emailController,
          ),
          KtextFormField(
            hintText: 'Password..',
            controller: passwordController,
            obscureText: true,
          ),
          kTextButton(),
          signUpTextButton(context)
        ]),
        ListView(children: [
          KtextFormField(hintText: 'Name..', controller: nameController),
          KtextFormField(hintText: 'Email..', controller: emailController),
          KtextFormField(
            hintText: 'Password..',
            controller: passwordController,
            obscureText: true,
          ),
        ]),
      ]),
    );
  }

  Widget kTextButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Align(
        alignment: Alignment.topRight,
        child: TextButton(
            onPressed: null,
            child: Text(
              'Forgot Password?',
              style: whiteTextStyle.copyWith(fontWeight: FontWeight.w800),
            )),
      ),
    );
  }

  Widget signUpTextButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: TextButton(
          onPressed: () {
            DefaultTabController.of(context)!.animateTo(1);
          },
          child: Text(
            'Don\'t have an Account? Sign Up',
            style: greyTextStyle.copyWith(
                fontWeight: FontWeight.w800,
                decoration: TextDecoration.underline),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('full rebuild');
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: Responsive.isMobile(context) ? double.infinity : 340,
            maxWidth: Responsive.isMobile(context) ? double.infinity : 350,
          ),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: Responsive.isMobile(context)
                ? null
                : BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: const BorderRadius.all(
                        Radius.circular(defaultCircular)),
                  ),
            child: DefaultTabController(
              length: 2,
              initialIndex: 0,
              //we need builder to read controller index
              child: Builder(builder: (context) {
                final TabController controller =
                    DefaultTabController.of(context)!;
                controller.addListener(() {
                  context.read<AuthTabIndex>().emit(controller.index);
                });
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      kTabBar(context),
                      kTabBarView(context),
                    ]);
              }),
            ),
          ),
        ),
      ),
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0.0
          ? kFloatingActionButton()
          : null,
    );
  }
}

class kFloatingActionButton extends StatelessWidget {
  kFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 35, top: 30, bottom: 30),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            print('listener rebuild');
            if (state is AuthSuccess) {
              print('tombol $state');

              //navigate to next page
              Navigator.pushNamed(context, '/dashboard');
              print('sudahdipush');
              //dispose controller
              Timer(Duration(seconds: 5), () {
                AuthPage().disposeController();
              });
            } else if (state is AuthFailed) {
              print(state.error);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
                backgroundColor: kDangerColor,
              ));
            }
          },
          builder: (context, state) {
            print('builder rebuild');
            String title = 'Login';
            switch (state.runtimeType) {
              case AuthFailed:
                title = 'Try Again';
                break;
              case AuthLoading:
                title = 'Loading';
                break;
            }

            int tabControllerIndex = context.watch<AuthTabIndex>().getIndex();

            if (tabControllerIndex == 0) {
              title = 'Login';
            } else {
              title = 'Register';
            }

            return KloadingButton(
              title: title,
              onPressed: () {
                if (tabControllerIndex == 0) {
                  AuthPage().attemptSignIn(context);
                } else {
                  AuthPage().attemptSignUp(context);
                }
              },
            );
          },
        ));
  }
}
