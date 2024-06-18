

import 'package:tarikhna/modules/login/login_screen.dart';
import 'package:tarikhna/shared/components/components.dart';
import 'package:tarikhna/shared/network/local/cache_helper.dart';

void signOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      navigateAndFinish(context, LoginScreen());
    }
  });
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String TOKEN = '';
String REGISTER = 'auth/register';
String LOGIN = 'auth/login';
String PROFILE = 'user';
String UPDATE = 'user/update';
String AI_summarization = 'AI_Summary';
String SavedItemsModel ="AI_Summary/saveSummarizedItem";
String GetAllSavedItem ="AI_Summary/summarizedItems";
String LESSONS = 'lesson/getlessons';
String FILTER = 'lesson/filter';
String SEARCH = 'lesson/search';
String QUIZ = 'quiz/';
String changeLevel = "quiz/updateToNextLevel";
String EXAM = 'exam/';


String img1 = 'https://img.freepik.com/free-photo/egyptian-culture-illustration_1409-7370.jpg?t=st=1718750614~exp=1718754214~hmac=dda1558529d2e929a53226c7ae7b9d2cc313db35cfb564cf30b937e4b6c9d963&w=1060';
String img2 = 'https://img.freepik.com/free-photo/view-world-monument-celebrate-world-heritage-day_23-2151297241.jpg?t=st=1718750796~exp=1718754396~hmac=d3fa1dc3d870cd7bddf84c4c57831e3ade8c089cda718c754c7e4524bb51268d&w=996';
String img3 = 'https://img.freepik.com/free-photo/view-world-monument-celebrate-world-heritage-day_23-2151297220.jpg?t=st=1718750804~exp=1718754404~hmac=691f65cb55a129f0bad13ddf650169a9766a08ee412d9652184a687b5536a750&w=996';
String img4 = 'https://img.freepik.com/free-photo/ancient-cultures-craft-religion-history-into-art-generated-by-ai_188544-10767.jpg?t=st=1718750907~exp=1718754507~hmac=d457bcc34ab9a0da0bab286b6305979c99bf0d22601aedd3e221a365e41d7b0a&w=1060';
String img5 = 'https://img.freepik.com/free-photo/monochrome-view-world-heritage-location-travel-destination_23-2151360295.jpg?t=st=1718750934~exp=1718754534~hmac=0268bfa313454fb4f41fb91f94368fed188756aa9ba8b78ae857a945956f4f15&w=996';
String img6 = 'https://images.pexels.com/photos/17004827/pexels-photo-17004827/free-photo-of-hieroglyphs-around-ancient-god-carving.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';