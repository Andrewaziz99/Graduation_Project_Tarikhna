import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/arModule/cubit/ar_cubit.dart';
import 'package:tarikhna/shared/components/components.dart';

import 'model_viewer.dart';
import 'package:flutter/material.dart';
import 'package:tarikhna/modules/const.dart';
import 'local_ar_screen.dart';
import 'text_to_speech.dart';

class AR_Main extends StatelessWidget {
  const AR_Main({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ArCubit, ArState>(
      listener: (context, state) {
        if (state is AROpenWidget) {
         // navigateTo(context, LocalAndWebObjectsWidget());
        }
      },
      child: BlocProvider(
        create: (context) => ArCubit(),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(28.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "AR Page",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 45,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Avenir'),
                        ),
                      ]),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .7,
                  height: MediaQuery.of(context).size.height * .4,
                  child: ar_widget(),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .7,
                  height: MediaQuery.of(context).size.height * .1,
                  child: Text(
                    'When you press on start button this model will explain the lesson for you',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Avenir',
                        color: secondaryTextColor),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Lesson description'),
                InkWell(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    child: Text("Start"),
                  ),
                  onTap: () {
                    context.read<ArCubit>().getARscreen();
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => LocalAndWebObjectsWidget()),
                    // );
                  },
                ),
                //     Butt(onPressed: () {
                // Navigator.push(
                // context,
                // MaterialPageRoute(builder: (context) => const SecondRoute()),)}
                // , child: Text("Start Lesson"))
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}

// Future<Widget> onViewCreated() async {
//   return Column(
//     children: [LocalAndWebObjectsWidget(), flutter_tts()],
//   );
// }
