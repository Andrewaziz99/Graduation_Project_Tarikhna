

// void signOut(context) {
//   CacheHelper.removeData(key: 'token').then((value) {
//     if (value) {
//       navigateAndFinish(context, ShopLoginScreen());
//     }
//   });
// }

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String TOKEN = '';
String AI_summarization = 'AI_Summary';

var SavedItemsModel ="AI_Summary/saveSummarizedItem";

var GetAllSavedItem ="AI_Summary/summarizedItems";