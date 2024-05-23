import Overlay from '../overlay/overlay';
import './Lessons.css';
import lessonsData from './Lessonsdata';
import TableRow from './TableRow';
// import FileUpload from './pdfUpload'
import OverlayLessonPDF from '../overlay/overlayLessonPDF'

function Lessons() {
    console.log("lessons data");
    console.log("lesson Data");
    console.log(lessonsData);
    const lesson = lessonsData.map((les) => {
        console.log(les.year);
        return (
            <TableRow key={les._id} lessonTitle={les.Title} id={les._id} grade={les.year} summaryText={les.characters} summaryByDate={les.dates} unit={les.unit} />
            // <TableRow key={les.id} lessonTitle={les.lessonTitle} id={les.id} grade={les.grade} summaryText={les.summaryText} summaryByDate={les.summaryByDate} />
        )
    })
    return (
        <div class="history_lists">
            <div class="list1">
                <div class="rowTable">
                    <span className='span-header'>Lessons</span>
                    <Overlay buttonTitle='Add' buttonStyle='edit' />
                    <OverlayLessonPDF buttonTitle='Upload' buttonStyle='edit'/>

                    

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