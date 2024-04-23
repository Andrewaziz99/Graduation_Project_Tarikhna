

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