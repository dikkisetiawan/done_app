import '../widgets/tasks/task_details.dart';
import '../widgets/tasks/task_list.dart';

import '../../bloc/cubit/dashboard/kdrawer_controller.dart';
import '../responsive.dart';
import '/bloc/cubit/task_cubit.dart';
import '/shared/theme.dart';
import '/ui/widgets/side_menu.dart';
import '../../bloc/cubit/auth_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 1,
                child: SideMenu(),
              ),
            Expanded(
              flex: 2,
              child: TaskList(),
            ),
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 2,
                child: TaskDetails(),
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Sign Out'),
        backgroundColor: kBackgroundColor,
        onPressed: () {
          context.read<AuthCubit>().signOut();
          Navigator.pushNamed(context, '/');
          print('sudah di push');
        },
      ),
    );
  }
}
