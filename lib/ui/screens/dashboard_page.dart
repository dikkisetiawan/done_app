import '../widgets/ktext_form_field.dart';
import '/bloc/cubit/dashboard/dashboard_rigth_side_cubit.dart';
import 'package:draggable_home/draggable_home.dart';

import 'task_details.dart';
import '../widgets/tasks/task_list.dart';

import '../../bloc/cubit/dashboard/kdrawer_controller.dart';
import '../responsive.dart';

import '/shared/theme.dart';
import '/ui/widgets/side_menu.dart';
import '../../bloc/cubit/auth_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return DashboardMobilePage();
    }
    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: const SideMenu(),
      body: Row(
        children: [
          const Expanded(
            flex: 1,
            child: SideMenu(),
          ),
          Expanded(
            flex: 2,
            child: TaskList(),
          ),
          BlocBuilder<DashboardRightSideCubit, DashboardRightSideState>(
            builder: (context, state) {
              print(state.runtimeType);
              if (state is RightSideInitial) {
                return const SizedBox.shrink();
              } else if (state is FetchTaskByIdForRightSideSuccess) {
                return const Expanded(
                  flex: 3,
                  child: TaskDetails(),
                );
              } else if (state is RightSideClosed) {
                return const SizedBox.shrink();
              }

              return const SizedBox.shrink();
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kBackgroundColor,
        onPressed: () {
          context.read<AuthCubit>().signOut();
          Navigator.pushNamed(context, '/');
          print('sudah di push');
        },
        child: const Text('Sign Out'),
      ),
    );
  }
}

class DashboardMobilePage extends StatelessWidget {
  DashboardMobilePage({super.key});
  TextEditingController searchEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DraggableHome(
        fullyStretchable: true,
        backgroundColor: kBackgroundColor,
        appBarColor: kSecondaryColor,
        physics: const BouncingScrollPhysics(),
        drawer: const SideMenu(),
        title: const Text('Hi Dikki'),
        actions: [Icon(Icons.menu)],
        headerWidget: const SizedBox(),
        headerBottomBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.search_rounded,
                color: kWhiteColor,
              ),
              Expanded(
                child: KtextFormField(
                  hintText: 'Search...',
                  controller: searchEditingController,
                ),
              ),
            ],
          ),
        ),
        body: [
          Container(
              height: 800,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TaskList())
        ],
        floatingActionButton: FloatingActionButton(
          backgroundColor: kBackgroundColor,
          onPressed: () {
            context.read<AuthCubit>().signOut();
            Navigator.pushNamed(context, '/');
            print('sudah di push');
          },
          child: const Text('Sign Out'),
        ),
      ),
    );
  }
}
