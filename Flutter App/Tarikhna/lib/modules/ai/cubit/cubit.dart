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

//   void getAllSavedItem() {
//     emit(GetAllSavedItemLoadingState());
//     DioHelper.getData(
//         url: GetAllSavedItem,
//         token: CacheHelper.getData(key: 'token')
//     ).then((value) {
//       // Parse the response JSON into Get_All_SavedItem_Model
//       getSavedItemModel = Get_All_SavedItem_Model.fromJson(value.data);
//       print(getSavedItemModel?.data?[0].title);
//       // Emit a success state with the received data
//       emit(GetAllSavedItemSuccessState());
//     }).catchError((error) {
//       // Emit an error state with the error message
//       emit(GetAllSavedItemErrorState(error.toString()));
//     });
//   }
//
//   void SavedItems({
//     required DataM data,
//   }) {
//     emit(SavedModelLoadingState());
//
//     // Convert DataM object to JSON
//     Map<String, dynamic> jsonData = {
//       'characters': data.characters?.map((character) => character.toJson()).toList(),
//       'dates': data.dates?.map((date) => date.toJson()).toList(),
//       'Title': data.title,
//     };
//
//     // Make an HTTP POST request to save the data
//     DioHelper.postData(
//       url: SavedItemsModel, // Assuming SavedItemsModel is your API endpoint URL
//       data: jsonData,
//       token: CacheHelper.getData(key: 'token'), // Get token from cache
//     ).then((value) {
//       // Parse the response into a SavedItem object
//       SavedItem saveModel = SavedItem.fromJson(value.data);
//       print(saveModel.data?.title);
//       emit(SavedModelSuccessState());
//     }).catchError((err) {
//       // Handle errors
//       print(err.toString());
//       emit(SavedModelErrorState(err.toString()));
//     });
//   }
 }
