
import 'package:flutter/material.dart';
import 'package:tarikhna/shared/styles/colors.dart';

import '../../modules/lessons/lessons_screen.dart';
import '../../modules/lessons/search_screen.dart';

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (route) => false,
);

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.amberAccent,
  ),
);

Widget myVerticalDivider() => Padding(
  padding: const EdgeInsets.symmetric(
    vertical: 20.0,
  ),
  child: Container(
    width: 1.0,
    color: Colors.amberAccent,
  ),
);

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 0.0,
  double? fSize,
  Color tColor = Colors.white,
  required Function()? function,
  required String text,
}) =>
    Container(
      width: width,
      height: 40.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: tColor, fontSize: fSize),
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required String? Function(String?)? validate,
  Function(String)? onSubmit,
  Function(String)? onChange,
  Function()? suffixPressed,
  Function()? onTap,
  bool isPassword = false,
  IconData? prefix,
  IconData? suffix,
  bool isClickable = true,
  BorderRadius radius = BorderRadius.zero,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: DefaultColor,
          ),
        ),
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(suffix),
        )
            : null,
        border: OutlineInputBorder(borderRadius: radius),
      ),
    );

Widget newFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required String? Function(String?)? validate,
  Function(String)? onSubmit,
  Function(String)? onChange,
  Function()? suffixPressed,
  Function()? onTap,
  bool isPassword = false,
  IconData? prefix,
  IconData? suffix,
  bool isClickable = true,
  BorderRadius radius = BorderRadius.zero,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(suffix),
        )
            : null,
      ),
    );

// Widget newsBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
//     condition: list.length > 0,
//     builder: (context) => ListView.separated(
//       physics: const BouncingScrollPhysics(),
//       itemBuilder: (context, index) {
//         return buildArticleItem(list[index], context);
//       },
//       separatorBuilder: (context, index) => myDivider(),
//       itemCount: list.length,
//     ),
//     fallback: (context) => isSearch? Container() : const Center(child: CircularProgressIndicator())
// );

// Widget buildArticleItem(article, context) => InkWell(
//   onTap: () {
//     navigateTo(context, WebViewScreen(article['url']));
//   },
//   child:   Padding(
//
//     padding: const EdgeInsets.all(20.0),
//
//     child: Row(
//
//       children: [
//
//         Container(
//
//           width: 120.0,
//
//           height: 120.0,
//
//           decoration: BoxDecoration(
//
//             borderRadius: BorderRadius.circular(10.0),
//
//             image: DecorationImage(
//
//               image: NetworkImage('${article['urlToImage']}'),
//
//               fit: BoxFit.cover,
//
//             ),
//
//           ),
//
//         ),
//
//         const SizedBox(
//
//           width: 20.0,
//
//         ),
//
//         Expanded(
//
//           child: Container(
//
//             height: 120.0,
//
//             child: Column(
//
//               mainAxisSize: MainAxisSize.min,
//
//               mainAxisAlignment: MainAxisAlignment.start,
//
//               crossAxisAlignment: CrossAxisAlignment.start,
//
//               children:
//
//               [
//
//                 Expanded(
//
//                   child: Text(
//
//                     '${article['title']}',
//
//                     style: Theme.of(context).textTheme.displaySmall!,
//
//                     maxLines: 3,
//
//                     overflow: TextOverflow.ellipsis,
//
//                   ),
//
//                 ),
//
//                 Text(
//
//                   '${article['publishedAt']}',
//
//                   style: const TextStyle(
//
//                     color: Colors.grey,
//
//                   ),
//
//                 ),
//
//               ],
//
//             ),
//
//           ),
//
//         ),
//
//       ],
//
//     ),
//
//   ),
// );

buildSettingItem({
  required IconData icon,
  required String text,
  required Function function,
}) =>
    InkWell(
      onTap: () {
        function();
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30.0,
            ),
            const SizedBox(
              width: 20.0,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
            ),
          ],
        ),
      ),
    );

// Widget lessonItemBuilder(model) => Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Center(
//               child: GestureDetector(
//             onTap: () {
// // print(model.sId);
//               showLessonBottomSheet(model!.sId!);
//             },
//             child: Container(
//               height: 120.0,
//               color: Colors.white.withOpacity(0.5),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
// // You might need this line
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           '${model.title}',
//                           style: const TextStyle(
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                           textDirection: TextDirection.rtl,
//                         ),
//                         const SizedBox(
//                           height: 10.0,
//                         ),
//                         Text(
//                           'Unit ${model.unit}',
//                           style: TextStyle(
//                             fontSize: 15.0,
//                             color: Colors.grey[800],
//                           ),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ],
//                     ),
//                     const Spacer(),
//                     defaultButton(
//                       background: Colors.blue.withOpacity(0),
//                       tColor: Colors.blue,
//                       fSize: 16.0,
//                       radius: 20.0,
//                       width: 100,
//                       function: () {},
//                       text: 'Start',
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )),
//         ),
//       ],
//     );
