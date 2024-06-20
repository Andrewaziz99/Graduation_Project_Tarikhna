import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/arModule/cubit/ar_cubit.dart';
import 'package:tarikhna/modules/arModule/local_ar_screen.dart';
import 'package:tarikhna/modules/arModule/model_viewer.dart';
import 'package:tarikhna/shared/components/components.dart';

class Ar_Main_screen extends StatelessWidget {
  const Ar_Main_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ArCubit, ArState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AROpenWidget) {
          //navigateTo(context, LocalAndWebObjectsWidget());
        }
      },
      child: BlocProvider(
          create: (context) => ArCubit(),
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Text(
                      "AR Page",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 45,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Avenir'),
                    ),
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
                          fontSize: 14,
                          fontFamily: 'Avenir',
                          color: Colors.amber),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Lesson description',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 14,
                        fontFamily: 'Avenir',
                        color: Colors.amber),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                      onPressed: () => {context.read<ArCubit>().getARscreen()},
                      child: Text('Start'))
                ],
              ),
            ),
          )),
    );
  }
}
