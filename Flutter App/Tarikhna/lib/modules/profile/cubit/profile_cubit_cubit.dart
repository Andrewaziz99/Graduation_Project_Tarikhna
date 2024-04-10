import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_cubit_state.dart';

class ProfileCubit extends Cubit<ProfileCubitState> {
  ProfileCubit() : super(ProfileCubitInitial());
}
