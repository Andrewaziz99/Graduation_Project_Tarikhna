import OverlayDel from '../overlay/OverlayDel';
import '../lesson/Lessons.css';
import OverlayEditQues from '../overlay/OverlayEditQues';

function QuestionTableRow(props) {


    return (
        <tr >
            <td>{props.id}</td>
            <td>{props.lessonTitle}</td>
            <td>{props.QuestionText}</td>
            <td>{props.level}</td>
            <OverlayEditQues buttonTitle='Edit' buttonStyle='edit' buttonIcon="bi bi-pencil-square" id ={props.id} lessonTitle={props.lessonTitle} correctAns={props.correctAns} QuestionText={props.QuestionText} choices={props.choices} level={props.level} lessonID={props.lessonID}/>
            <OverlayDel buttonTitle='Delete' buttonStyle='delete' buttonIcon="bi bi-trash3" type={'question'} lessonTitle={props.QuestionText} id ={props.id}/>
        </tr>
    );
}
export default QuestionTableRow;