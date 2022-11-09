// import 'dart:math';
// import 'package:done_list/ui/widgets/task_list.dart';

// import '/bloc/cubit/dashboard_header_cubit.dart';
// import 'package:draggable_home/W.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../shared/theme.dart';
// import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
// import 'package:appinio_swiper/appinio_swiper.dart';

// class Dashboard extends StatelessWidget {
//   final taskListKey = GlobalKey();
//   final Map<DateTime, int> _dummyDataSets = {};

//   Dashboard({super.key});

//   void randomDummyDataSets() {
//     for (var i = 60; i > 0; i--) {
//       _dummyDataSets[DateTime(DateTime.now().year, DateTime.now().month,
//           DateTime.now().day - i)] = Random().nextInt(3);
//     }
//   }

//   Widget bannerContainer({required String title, required Widget? Widget}) =>
//       Container(
//         width: double.infinity,
//         height: 100,
//         margin: const EdgeInsets.all(10),
//         alignment: Alignment.center,
//         padding:
//             const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 20),
//         decoration: BoxDecoration(
//             color: kSecondaryColor,
//             border: Border.all(color: kPrimaryColor, width: 1.0),
//             borderRadius: BorderRadius.circular(24)),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           Text(
//             title,
//             style: whiteTextStyle,
//           ),
//           const Spacer(),
//           Center(
//             child: Widget,
//           ),
//         ]),
//       );

//   Widget kHeatMap() => HeatMap(
//         size: 20.0,
//         showColorTip: false,
//         endDate: DateTime.now(),
//         startDate: DateTime.now().subtract(const Duration(days: 60)),
//         defaultColor: kSecondaryColor,
//         datasets: _dummyDataSets,
//         colorMode: ColorMode.opacity,
//         scrollable: false,
//         textColor: kWhiteColor,
//         colorsets: {
//           1: kPrimaryColor,
//         },
//         onClick: (p0) {},
//       );

//   Widget kSwipper(BuildContext context) {
//     return AppinioSwiper(
//       cards: [
//         bannerContainer(title: 'Statistic', Widget: kHeatMap()),
//         bannerContainer(title: 'Statistic', Widget: null),
//       ],
//       allowUnswipe: false,
//       direction: AppinioSwiperDirection.left,
//       onEnd: () {
//         Scrollable.ensureVisible(taskListKey.currentContext!,
//             duration: const Duration(milliseconds: 800), curve: Curves.ease);
//         context.read<DashboardHeaderCubit>().replaceWidget();
//       },
//     );
//   }

//   Widget kLeading() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
//       child: CircleAvatar(
//         backgroundColor: kPrimaryColor,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     randomDummyDataSets();
//     return DraggableHome(
//         backgroundColor: kBackgroundColor,
//         appBarColor: kSecondaryColor,
//         fullyStretchable: true,
//         leading: kLeading(),
//         centerTitle: false,
//         title: const Text('Today Priorities'),
//         actions: [
//           IconButton(
//               padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
//               onPressed: () {},
//               icon: const Icon(Icons.settings))
//         ],
//         headerWidget: BlocBuilder<DashboardHeaderCubit, bool>(
//           builder: (context, state) {
//             return state
//                 ? bannerContainer(title: 'ganti widget', Widget: null)
//                 : kSwipper(context);
//           },
//         ),
//         headerExpandedHeight: 0.60,
//         body: [
//           Container(
//             key: taskListKey,
//             child: TaskList(),
//           )
//         ]);
//   }
// }
