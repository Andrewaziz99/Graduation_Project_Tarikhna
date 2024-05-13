
import '../lesson/Lessons.css';
import QuestionData from './QuestionData';
import QuestionTableRow from './QuestionsTablerow';
import OverlayQues from '../overlay/OverlayQues';
import Dropdown from 'react-bootstrap/Dropdown';
import DropdownButton from 'react-bootstrap/DropdownButton';

function Questions() {

    const lesson = QuestionData
        .map((les) => {
            return (
                <QuestionTableRow key={les.id} lessonTitle={les.lessonTitle} id={les.id} grade={les.grade} QuestionText={les.QuestionText} RightAnswer={les.RightAnswer} Answers={les.Answers} />
            )
        })
    return (
        <div className="history_lists">
            <div className="list1">
                <div className="rowTable row g-3">
                    <div className='col-sm'>
                        <span className='span-header'>Questions</span></div>
                    <div className='col-sm-7'>
                        <div className='row'>
                            <div className='col'>
                                <DropdownButton id="dropdown-basic-button" title="Filter by year">
                                    <Dropdown.Item href="#/action-1">4</Dropdown.Item>
                                    <Dropdown.Item href="#/action-2">5</Dropdown.Item>
                                    <Dropdown.Item href="#/action-3">6</Dropdown.Item>
                                </DropdownButton></div>
                            <div className='col'>
                                <DropdownButton id="dropdown-basic-button" title="Filter by lesson">
                                    <Dropdown.Item href="#/action-1">Lesson 1</Dropdown.Item>
                                    <Dropdown.Item href="#/action-2">Lesson 2</Dropdown.Item>
                                    <Dropdown.Item href="#/action-3">Lesson 3</Dropdown.Item>
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
                            <th>Grade</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        {lesson}
                    </tbody>
                </table>
            </div>
        </div>
    );
}
export default Questions;