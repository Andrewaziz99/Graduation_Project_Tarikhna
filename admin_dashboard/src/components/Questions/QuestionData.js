// const QuestionData = [
//     { lessonTitle: 'Lesson 1', grade: 4, id: 1, QuestionText: 'Question 1 lesson 1 of grade 4', RightAnswer: 'A', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 1', grade: 4, id: 2, QuestionText: 'Question 2 lesson 1 of grade 4', RightAnswer: 'B', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 1', grade: 4, id: 3, QuestionText: 'Question 3 lesson 1 of grade 4', RightAnswer: 'A', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 1', grade: 4, id: 4, QuestionText: 'Question 4 lesson 1 of grade 4', RightAnswer: 'C', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 1', grade: 4, id: 5, QuestionText: 'Question 5 lesson 1 of grade 4', RightAnswer: 'D', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 2', grade: 4, id: 6, QuestionText: 'Question 1 lesson 2 of grade 4', RightAnswer: 'C', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 2', grade: 4, id: 7, QuestionText: 'Question 2 lesson 2 of grade 4', RightAnswer: 'D', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 2', grade: 4, id: 8, QuestionText: 'Question 3 lesson 2 of grade 4', RightAnswer: 'C', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 2', grade: 4, id: 9, QuestionText: 'Question 4 lesson 2 of grade 4', RightAnswer: 'A', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 3', grade: 4, id: 10, QuestionText: 'Question 1 lesson 3 of grade 4', RightAnswer: 'D', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 3', grade: 4, id: 11, QuestionText: 'Question 2 lesson 3 of grade 4', RightAnswer: 'C', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 3', grade: 4, id: 12, QuestionText: 'Question 3 lesson 3 of grade 4', RightAnswer: 'A', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 3', grade: 4, id: 13, QuestionText: 'Question 4 lesson 3 of grade 4', RightAnswer: 'D', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 4', grade: 4, id: 14, QuestionText: 'Question 1 lesson 4 of grade 4', RightAnswer: 'B', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 4', grade: 4, id: 15, QuestionText: 'Question 2 lesson 4 of grade 4', RightAnswer: 'C', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 4', grade: 4, id: 16, QuestionText: 'Question 3 lesson 4 of grade 4', RightAnswer: 'A', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 4', grade: 4, id: 17, QuestionText: 'Question 4 lesson 4 of grade 4', RightAnswer: 'B', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 1', grade: 5, id: 18, QuestionText: 'Question 1 lesson 1 of grade 5', RightAnswer: 'D', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 1', grade: 5, id: 19, QuestionText: 'Question 2 lesson 1 of grade 5', RightAnswer: 'C', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 1', grade: 5, id: 20, QuestionText: 'Question 3 lesson 1 of grade 5', RightAnswer: 'A', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 1', grade: 5, id: 21, QuestionText: 'Question 4 lesson 1 of grade 5', RightAnswer: 'B', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 1', grade: 5, id: 22, QuestionText: 'Question 5 lesson 1 of grade 5', RightAnswer: 'D', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 1', grade: 5, id: 23, QuestionText: 'Question 6 lesson 1 of grade 5', RightAnswer: 'C', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 1', grade: 5, id: 24, QuestionText: 'Question 7 lesson 1 of grade 5', RightAnswer: 'A', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 2', grade: 5, id: 25, QuestionText: 'Question 1 lesson 2 of grade 5', RightAnswer: 'C', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 2', grade: 5, id: 26, QuestionText: 'Question 2 lesson 2 of grade 5', RightAnswer: 'D', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 2', grade: 5, id: 27, QuestionText: 'Question 3 lesson 2 of grade 5', RightAnswer: 'B', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 2', grade: 5, id: 28, QuestionText: 'Question 4 lesson 2 of grade 5', RightAnswer: 'C', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 2', grade: 5, id: 29, QuestionText: 'Question 5 lesson 2 of grade 5', RightAnswer: 'A', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 3', grade: 5, id: 30, QuestionText: 'Question 1 lesson 3 of grade 5', RightAnswer: 'D', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 3', grade: 5, id: 31, QuestionText: 'Question 2 lesson 3 of grade 5', RightAnswer: 'A', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 3', grade: 5, id: 32, QuestionText: 'Question 3 lesson 3 of grade 5', RightAnswer: 'B', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 3', grade: 5, id: 33, QuestionText: 'Question 4 lesson 3 of grade 5', RightAnswer: 'C', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 3', grade: 5, id: 34, QuestionText: 'Question 5 lesson 3 of grade 5', RightAnswer: 'D', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 1', grade: 6, id: 35, QuestionText: 'Question 1 lesson 1 of grade 6', RightAnswer: 'A', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 1', grade: 6, id: 36, QuestionText: 'Question 2 lesson 1 of grade 6', RightAnswer: 'B', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 1', grade: 6, id: 37, QuestionText: 'Question 3 lesson 1 of grade 6', RightAnswer: 'C', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 1', grade: 6, id: 38, QuestionText: 'Question 4 lesson 1 of grade 6', RightAnswer: 'A', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 1', grade: 6, id: 39, QuestionText: 'Question 5 lesson 1 of grade 6', RightAnswer: 'D', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 2', grade: 6, id: 40, QuestionText: 'Question 1 lesson 2 of grade 6', RightAnswer: 'C', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 2', grade: 6, id: 41, QuestionText: 'Question 2 lesson 2 of grade 6', RightAnswer: 'A', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 2', grade: 6, id: 42, QuestionText: 'Question 3 lesson 2 of grade 6', RightAnswer: 'C', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 2', grade: 6, id: 43, QuestionText: 'Question 4 lesson 2 of grade 6', RightAnswer: 'D', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 2', grade: 6, id: 44, QuestionText: 'Question 5 lesson 2 of grade 6', RightAnswer: 'A', Answers: ['hi', 'hello', 'he', 'she'] },
//     { lessonTitle: 'Lesson 2', grade: 6, id: 45, QuestionText: 'Question 6 lesson 2 of grade 6', RightAnswer: 'B', Answers: ['hi', 'hello', 'he', 'she'] },
// ];

let QuestionData

const getAllQuestions = async () => {
    try {
        const response = await fetch('http://localhost:9000/questions/getAllQuestions', {
            method: "GET",

        })
        const data = await response.json()
        console.log("questions data in ques data");
        console.log(data);
        if (data.status) {
            console.log(data);
            QuestionData = data.data
        } else {
            console.log("unexpected error occured");
            alert("Unexpected error occured")
            QuestionData = []
        }

    } catch (error) {
        console.log(error);
        alert("Failed to fetch data")
        QuestionData = []
    }

}
await getAllQuestions()
export default QuestionData;