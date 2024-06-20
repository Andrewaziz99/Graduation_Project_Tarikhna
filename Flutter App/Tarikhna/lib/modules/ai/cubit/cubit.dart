import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarikhna/models/AI_Save_Item_model.dart';
import 'package:tarikhna/models/AI_model.dart';
import 'package:tarikhna/models/Get_All_SavedItemmodel.dart';
import 'package:tarikhna/modules/ai/cubit/states.dart';
import 'package:tarikhna/shared/components/constants.dart';
import 'package:tarikhna/shared/network/local/cache_helper.dart';
import 'package:tarikhna/shared/network/remote/dio_helper.dart';

class AICubit extends Cubit<AIStates> {
  AICubit() : super(AppInitialState());

  static AICubit get(context) => BlocProvider.of(context);

  AIModel? AiModel;

  // SavedItem? saveModel;
  // Get_All_SavedItem_Model? getSavedItemModel;



  void TextSummarization({
    required String inputData,
  }) {
    emit(TextSummarizedLoadingState());
    DioHelper.postData(
      url: AI_summarization,
      data: {
        'data': inputData,
      },
    ).then((value) {
      // print(value.data);
      AiModel = AIModel.fromJson(value.data);
      print(AiModel.toString());
      // AiModel?.data?.characters.forEach((character) {
      //   print('Name: ${character.nameOfCharacter}, Events: ${character.events}');
      // });
      // print(AiModel?.data?.characters[0].nameOfCharacter);
      emit(TextSummarizedSuccessState(AiModel));
    }).catchError((error) {
      print(error.toString());
      emit(TextSummarizedErrorState(error.toString()));
    });
  }
}