// import 'package:flutter/material.dart';
// import 'package:ptc2/core/utils/color_manager.dart';
// import 'package:ptc2/core/utils/string_manager.dart';
// import 'package:ptc2/core/utils/style_manager.dart';
// import 'package:ptc2/core/utils/values_manager.dart';

// class InfoCard extends StatefulWidget {
//   const InfoCard({super.key});

//   @override
//   State<InfoCard> createState() => _InfoCardState();
// }

// class _InfoCardState extends State<InfoCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(AppPadding.p10),
//             child: Container(
//               height: AppSizeWidget.cardSize,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(AppSize.s16),
//                 color: ColorManager.secoundColor,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(AppPadding.p10),
//                 child: Center(
//                   child: RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: "511",
//                           style: StyleManager.h2_Bold(
//                             fontsize: AppSize.s26,
//                             color: ColorManager.blackColor,
//                           ),
//                         ),
//                         TextSpan(
//                           text: StringManager.card1_1Text,
//                           style: StyleManager.body01_Regular(
//                             fontsize: AppSize.s26,
//                             color: ColorManager.blackColor,
//                           ),
//                         ),
//                         TextSpan(
//                           text: "\n${StringManager.card1_2Text}",
//                           style: StyleManager.body02_Medium(
//                             color: ColorManager.blackColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(AppPadding.p10),
//             child: Container(
//               height: AppSizeWidget.cardSize,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(AppSize.s16),
//                 color: ColorManager.secoundLightColor,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(AppPadding.p10),
//                 child: Center(
//                   child: RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: "511",
//                           style: StyleManager.h2_Bold(
//                             fontsize: AppSize.s26,
//                             color: ColorManager.blackColor,
//                           ),
//                         ),
//                         TextSpan(
//                           text: StringManager.card2_1Text,
//                           style: StyleManager.body01_Regular(
//                             fontsize: AppSize.s26,
//                             color: ColorManager.blackColor,
//                           ),
//                         ),
//                         TextSpan(
//                           text: "\n${StringManager.card2_2Text}",
//                           style: StyleManager.body02_Medium(
//                             color: ColorManager.blackColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
