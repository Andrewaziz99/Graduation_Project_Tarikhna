import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/models/profile_model.dart';
import 'package:tarikhna/modules/home/cubit/home_page_state.dart';
import 'package:tarikhna/modules/profile/cubit/cubit.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  static HomePageCubit get(context) => BlocProvider.of(context);

  ProfileModel? profileModel;

  void loadHome(context) {
    emit(HomePageLoading());
    try {
      profileModel = ProfileCubit.get(context).profileModel;
      emit(HomePageSuccess());
    } catch (e) {
      emit(HomePageError(e.toString()));
    }
  }
}
