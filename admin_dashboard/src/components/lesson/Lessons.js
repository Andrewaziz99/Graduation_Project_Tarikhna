import Overlay from '../overlay/overlay';
import './Lessons.css';
import lessonsData from './Lessonsdata';
import TableRow from './TableRow';
import SidebarMenu from '../sidebar/Sidebar';
// import FileUpload from './pdfUpload'
import OverlayLessonPDF from '../overlay/overlayLessonPDF'

function Lessons() {
    console.log("lesson Data");
    console.log(lessonsData);
    let lesson
        lesson = lessonsData.map((les) => {
            console.log(les.year);
            return (
                <TableRow key={les._id} lessonTitle={les.Title} id={les._id} grade={les.year} summaryText={les.characters} summaryByDate={les.dates} unit={les.unit} artext={les.AR_Text} />
                // <TableRow key={les.id} lessonTitle={les.lessonTitle} id={les.id} grade={les.grade} summaryText={les.summaryText} summaryByDate={les.summaryByDate} />
            )
        })
    
    return (
        <>
            <div className="row">
                <div className="col-2">
                    <SidebarMenu />
                </div>
                <div className="col-10">


                    <div class="history_lists">
                        <div class="list1">
                            <div class="rowTable">
                                <span className='span-header'>Lessons</span>
                                <Overlay buttonTitle='Add' buttonStyle='edit' />
                                <OverlayLessonPDF buttonTitle='Upload' buttonStyle='edit' />



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
                </div>
            </div>
        </>
    );
}
export default Lessons;