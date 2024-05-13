import OverlayDel from '../overlay/OverlayDel';
import OverlayEditLesson from '../overlay/OverlayEditLesson';
import Overlay from '../overlay/overlay';
import './Lessons.css';

function TableRow(props) {

    return (
        <tr >
            <td>{props.id}</td>
            <td>{props.lessonTitle}</td>
            <td>{props.grade}</td>
            <OverlayEditLesson buttonTitle='Edit' buttonStyle='edit' buttonIcon="bi bi-pencil-square" summaryText={props.summaryText} lessonTitle={props.lessonTitle} summaryByDate={props.summaryByDate} />
            <OverlayDel buttonTitle='Delete' buttonStyle='delete' buttonIcon="bi bi-trash3" lessonTitle={props.lessonTitle} />
        </tr>
    );
}
export default TableRow;