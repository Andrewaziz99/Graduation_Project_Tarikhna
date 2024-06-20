import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tarikhna/shared/components/constants.dart';
import 'package:tarikhna/shared/network/local/cache_helper.dart';
import 'package:tarikhna/shared/network/remote/dio_helper.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());
  getLessonPage() => emit(NavigateToLessonState());
  getAISummary() => {
        emit(SummaryAIState()),
        // DioHelper.getData(
        //   url: AI_summarization,
        //   token: CacheHelper.getData(key: 'token'),
        // )
      };
  getDrawer() => emit(OpenDrawer());
}
