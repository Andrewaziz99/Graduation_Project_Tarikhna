import OverlayDel from '../overlay/OverlayDel';
import OverlayEditLesson from '../overlay/OverlayEditLesson';
import Overlay from '../overlay/overlay';
import './Lessons.css';

function TableRow(props) {
    // console.log("char");
    // console.log(props);

    return (
        <tr >
            <td>{props.id}</td>
            <td>{props.lessonTitle}</td>
            <td>{props.grade}</td>
            <OverlayEditLesson buttonTitle='Edit' buttonStyle='edit' buttonIcon="bi bi-pencil-square" summaryText={props.summaryText} lessonTitle={props.lessonTitle} summaryByDate={props.summaryByDate} unit={props.unit} grade={props.grade} lessonID={props.id} artext={props.artext} />
            <OverlayDel buttonTitle='Delete' buttonStyle='delete' buttonIcon="bi bi-trash3" type={'lesson'} lessonTitle={props.lessonTitle} id={props.id} />
        </tr>
    );
}
export default TableRow;