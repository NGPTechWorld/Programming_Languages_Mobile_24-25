// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class DiscountSlider extends StatefulWidget {
//   const DiscountSlider({super.key});

//   @override
//   State<DiscountSlider> createState() => _DiscountSliderState();
// }

// class _DiscountSliderState extends State<DiscountSlider> {
//   Item? item;
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemCount: itemsApp.length,
//       itemBuilder: (context, index) {
//         if (itemsApp[index].isDiscount) {
//           return InkWell(
//             onTap: () {
//               item = itemsApp[index];
//               Get.to(ProductDetailsScreenStyle3(item: item!));
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(AppPadding.p10),
//               child: Container(
//                 height: AppSizeWidget.cardSize,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(AppSize.s16),
//                   color: (itemsApp[index].discount >= 50)
//                       ? ColorManager.secoundDarkColor
//                       : ColorManager.secoundColor,
//                 ),
//                 child: Row(
//                   children: [
//                     Image.asset(itemsApp[index].images![0]),
//                     Padding(
//                       padding: const EdgeInsets.all(AppPadding.p10),
//                       child: RichText(
//                           text: TextSpan(
//                         children: [
//                           TextSpan(
//                               text: StringManager.text1RichText,
//                               style: StyleManager.h1_Regular(
//                                   color: ColorManager.primary1Color)),
//                           TextSpan(
//                               text:
//                                   "\n${itemsApp[index].get_discount()}${StringManager.text2RichText}",
//                               style: StyleManager.h1_Bold(
//                                   color: ColorManager.primary1Color)),
//                         ],
//                       )),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         } else {
//           return Container();
//         }
//       },
//     );
//   }
// }
