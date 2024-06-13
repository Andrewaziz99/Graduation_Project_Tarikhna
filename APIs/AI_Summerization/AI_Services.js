const AI_DAO = require("./AI_DAO");

const summarizeText = async (historicalText, done) => {

  const { GoogleGenerativeAI } = require("@google/generative-ai");

  // Access your API key as an environment variable (see "Set up your API key" below)
  const genAI = new GoogleGenerativeAI(process.env.API_KEY);

  const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });

  historicalText = JSON.stringify(historicalText);

  prompt =
    '\
    . لخّص النص التالي باللغة العربية فقط.\
    . من النص الملخص، استخرج أسماء الشخصيات المذكورة.\
    . من النص الملخص، استخرج الأحداث المتعلقة بالشخصيات المذكورة.\
    . من النص الملخص، استخرج التواريخ المذكورة مرتبة بصيغة بسيطة.\
    . من النص الملخص، استخرج الأحداث المتعلقة بالتواريخ المذكورة.\
    . اعرض الخطوات أعلاه في تنسيق JSON كما يلي:\
    . Remove (``` json ... ```) from the response and return data as a text\
    {\
        "historicalORNot" : true or false, // إذا لم يكن النص تاريخيًا، اجعل قيمة البيانات: false\
        "data" : {\
            "characters" : [\
            {"nameOfCharacter" : "الاسم1",\
            "Events" : ["حدث1", "حدث2", ...]\
            },\
            {"nameOfCharacter" : "الاسم2",\
            "Events" : ["حدث1", "حدث2", ...]\
            },\
            ...\
            ],\
            "dates" : [\
            {"date" : "تاريخ1",\
            "event" : ["حدث1", "حدث2", ...]\
            },\
            {"date" : "تاريخ2",\
            "event" : ["حدث1", "حدث2", ...]\
            },\
            ...\
            ],\
            "Title" : "إنشاء عنوان للنص الملخص"\
        }\
        }' + historicalText;

  try {
    const result = await model.generateContent(prompt);
    const response = await result.response;
    const text = response.text();
    console.log("text: ", text);
    return done(undefined, JSON.parse(text));
  } catch (error) {
    console.log(error);
    return done(error, undefined);
  }
};

const saveSummarizedItem = (data, done) => {
  AI_DAO.saveSummarizedItem(data, done);
};

const getAllSavedItems = (userID, done) => {
  AI_DAO.getAllSavedItems(userID, done);
};

module.exports = { summarizeText, getAllSavedItems, saveSummarizedItem };
