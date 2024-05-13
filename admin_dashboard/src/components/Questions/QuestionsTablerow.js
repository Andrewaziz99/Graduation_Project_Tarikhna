import OverlayDel from '../overlay/OverlayDel';
import '../lesson/Lessons.css';
import OverlayEditQues from '../overlay/OverlayEditQues';

function QuestionTableRow(props) {


    return (
        <tr >
            <td>{props.id}</td>
            <td>{props.lessonTitle}</td>
            <td>{props.QuestionText}</td>
            <td>{props.grade}</td>
            <OverlayEditQues buttonTitle='Edit' buttonStyle='edit' buttonIcon="bi bi-pencil-square" lessonTitle={props.lessonTitle} RightAnswer={props.RightAnswer} QuestionText={props.QuestionText} Answers={props.Answers} />
            <OverlayDel buttonTitle='Delete' buttonStyle='delete' buttonIcon="bi bi-trash3" lessonTitle={props.QuestionText} />
        </tr>
    );
}
export default QuestionTableRow;