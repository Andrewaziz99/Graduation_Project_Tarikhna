
import '../lesson/Lessons.css';
import AllQuestionsData from './QuestionData';
import QuestionTableRow from './QuestionsTablerow';
import OverlayQues from '../overlay/OverlayQues';
import Dropdown from 'react-bootstrap/Dropdown';
import DropdownButton from 'react-bootstrap/DropdownButton';
import AllLessons from '../lesson/Lessonsdata'
import SidebarMenu from '../sidebar/Sidebar';
import { useState } from 'react';

function Questions() {

    // console.log("Questions data");
    // console.log(QuestionData);
    const [filteredQuestions, setFilteredQuestions] = useState(AllQuestionsData)
    function filterQuestionsByLevel(year) {
        let filteredData
        if (year == 'All') {
            filteredData = AllQuestionsData.filter(ques => {
                return ques.year == 4 || ques.year == 5 || ques.year == 6
            })
            setFilteredQuestions(AllQuestionsData)
        } else {
            filteredData = AllQuestionsData.filter(ques => {
                return ques.year == year
            })
            setFilteredQuestions(filteredData)
        }
    }

    function filterQuestionsByLessonTitle(lessonID) {
        let filteredData
        if (lessonID == 'All') {
            setFilteredQuestions(AllQuestionsData)
        } else {
            filteredData = AllQuestionsData.filter(ques => {
                return ques.lessonID == lessonID
            })
            setFilteredQuestions(filteredData)
        }
    }
    let questions
    if (filteredQuestions == undefined || filteredQuestions.length == 0) {
         questions = []
    }else{
        questions  = filteredQuestions
        .map((ques, index) => {
            return (
                <QuestionTableRow key={ques._id} id={ques._id} QuestionText={ques.question} correctAns={ques.correctAns} choices={ques.choices} level={ques.level} lessonTitle={ques.lessonTitle} lessonID={ques.lessonID} />
            )
        })
    }
    return (
        <>
            <div className="row">
                <div className="col-2">
                    <SidebarMenu />
                </div>
                <div className="col-10">

                    <div className="history_lists">
                        <div className="list1">
                            <div className="rowTable row g-3">
                                <div className='col-sm'>
                                    <span className='span-header'>Questions</span></div>
                                <div className='col-sm-7'>
                                    <div className='row'>
                                        <div className='col'>
                                            <DropdownButton id="dropdown-basic-button" title="Filter by year" onChange={(e) => { console.log('changed'); }}>
                                                <Dropdown.Item href="#/action-1" onClick={(e) => { filterQuestionsByLevel('All') }}>All</Dropdown.Item>
                                                <Dropdown.Item href="#/action-1" onClick={(e) => { filterQuestionsByLevel(4) }}>4</Dropdown.Item>
                                                <Dropdown.Item href="#/action-2" onClick={(e) => { filterQuestionsByLevel(5) }}>5</Dropdown.Item>
                                                <Dropdown.Item href="#/action-3" onClick={(e) => { filterQuestionsByLevel(6) }}>6</Dropdown.Item>
                                            </DropdownButton></div>
                                        <div className='col'>
                                            <DropdownButton id="dropdown-basic-button" title="Filter by lesson">
                                                <Dropdown.Item href="#/action-1" onClick={(e) => { filterQuestionsByLessonTitle('All') }}>All</Dropdown.Item>
                                                {AllLessons.map(lesson => {
                                                    return (
                                                        <Dropdown.Item href="#/action-1" onClick={(e) => { filterQuestionsByLessonTitle(lesson._id) }}>{lesson.Title}</Dropdown.Item>
                                                    )

                                                })}


                                            </DropdownButton></div>
                                        <div className='col'>
                                            <OverlayQues buttonTitle='Add' buttonStyle='edit' />
                                        </div></div>
                                </div>

                            </div>
                            <table>
                                <thead>
                                    <tr>
                                        <th>#ID</th>
                                        <th>Lesson Title</th>
                                        <th>Question</th>
                                        <th>Level</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {questions}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
}
export default Questions;