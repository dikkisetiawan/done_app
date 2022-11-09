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
      key: context.read<KdrawerController>().scaffoldKey,
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
              flex: 4,
              child: SingleChildScrollView(
                child: BlocBuilder<TaskCubit, TaskState>(
                  builder: (context, state) {
                    if (state is TaskLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is TaskSuccess) {
                      if (state.tasks.length == 0) {
                        return Center(
                          child: Text('Kamu belum memiliki Task'),
                        );
                      } else {
                        return ListView.builder(
                            itemCount: state.tasks.length,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            itemBuilder: (context, index) {
                              return Text(state.tasks[index].title.toString());
                            });
                      }
                    }

                    return Center(
                      child: Text('Transaction Page'),
                    );
                  },
                ),
              ),
            ),
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
