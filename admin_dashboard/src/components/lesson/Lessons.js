import Overlay from '../overlay/overlay';
import './Lessons.css';
import lessonsData from './Lessonsdata';
import TableRow from './TableRow';

function Lessons() {

    const lesson = lessonsData.map((les) => {
        return (
            <TableRow key={les.id} lessonTitle={les.lessonTitle} id={les.id} grade={les.grade} summaryText={les.summaryText} summaryByDate={les.summaryByDate} />
        )
    })
    return (
        <div class="history_lists">
            <div class="list1">
                <div class="rowTable">
                    <span className='span-header'>Lessons</span>
                    <Overlay buttonTitle='Add' buttonStyle='edit' />
                </div>
                <table>
                    <thead>
                        <tr>
                            <th>#ID</th>
                            <th>Lesson Title</th>
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
export default Lessons;