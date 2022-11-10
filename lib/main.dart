import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:done_list/bloc/cubit/auth_tab_index.dart';
import 'package:done_list/bloc/cubit/dashboard/kdrawer_controller.dart';
import 'package:done_list/bloc/cubit/task_cubit.dart';
import 'package:done_list/models/task_model.dart';

import './bloc/cubit/auth_cubit.dart';
import 'bloc/cubit/dashboard/dashboard_header_cubit.dart';
import './bloc/cubit/toggle_task_cubit.dart';

import '/ui/screens/auth_page.dart';
import 'bloc/cubit/dashboard/dashboard_rigth_side_cubit.dart';
import 'ui/screens/dashboard_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBBMZwTMLVRYCyphaa1WDlknggp97x-ONw",
          appId: "1:1094521801399:web:e1b9643c8571d467639b32",
          messagingSenderId: "1094521801399",
          projectId: "priority-done"));

  // await FirebaseFirestore.instance.enablePersistence();

  // FirebaseFirestore.instance.settings =
  //     const Settings(persistenceEnabled: true);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DashboardHeaderCubit(),
        ),
        BlocProvider(
          create: (context) => ToggleTaskCubit(),
        ),
        BlocProvider(
          create: (context) => AuthTabIndex(),
        ),
        BlocProvider(
          create: (context) => TaskCubit(),
        ),
        BlocProvider(
          create: (context) => KdrawerController(),
        ),
        BlocProvider(
          create: (context) => DashboardRightSideCubit(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          routes: {
            '/': (context) => AuthPage(),
            '/dashboard': (context) => DashboardPage(),
            //'/task-details': (context) => SignUpPage(),
          }),
    );
  }
}
