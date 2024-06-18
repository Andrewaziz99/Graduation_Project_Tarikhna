import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/modules/AR/cubit/states.dart';
import 'package:tarikhna/modules/lessons/cubit/cubit.dart';

class ARCubit extends Cubit<ARState> {
  ARCubit() : super(ARInitialState());

  static ARCubit get(context) => BlocProvider.of(context);

}