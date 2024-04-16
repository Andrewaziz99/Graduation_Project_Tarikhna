import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ar_state.dart';

class ArCubit extends Cubit<ArState> {
  ArCubit() : super(ArInitial());
  getARscreen() => emit(AROpenWidget());
}
