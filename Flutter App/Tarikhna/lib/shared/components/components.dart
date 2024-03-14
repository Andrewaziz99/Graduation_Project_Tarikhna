import 'package:flutter/material.dart';
import 'package:tarikhna/shared/styles/colors.dart';

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
          style: TextStyle(color: Colors.white,
          fontSize: fSize),
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
  int? numOfLines,
  bool isPassword = false,
  IconData? prefix,
  IconData? suffix,
  bool isClickable = true,
  TextDirection? textDir,
  Color bordercoler= DefaultColor,

}) =>
    TextFormField(
      textDirection: textDir,
      maxLines: numOfLines,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        focusedBorder:  OutlineInputBorder(
          borderSide: BorderSide(
            color: bordercoler,
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
        border:  OutlineInputBorder(),
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


buildSettingItem(
{
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