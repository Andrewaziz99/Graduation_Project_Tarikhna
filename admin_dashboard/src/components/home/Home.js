import './Home.css';
import study from '../../assets/studying.png'
import questions from '../../assets/question.png'
import exam from '../../assets/exam.png'
import Card from '../card/Card';
function Home() {
    return (<>
        <div className="todos-container">
            <div className='col'>
                <center>
                    <img src={study} alt='study img' className="home-img" /></center>
                <p>
                    <div className='row'>
                        <div className="text" >
                            Trarikhna
                        </div><div className='text-2'>
                            Admin dashboard for educational app.
                        </div>
                    </div>


                </p>

                <div className="card-list">
                    <Card target="/questions" imagesrc={questions} title="Questions" cardClass="questions" description="You can edit on questions from here." />
                    <Card target="/lesson" imagesrc={exam} title="Lessons" cardClass="lessons" description="You can edit on Lesson text and infos from here." />
                    {/* <Card target="#" imagesrc={teacher} title="Questions" cardClass="ar-edit" description="You can edit on questions from here." /> */}
                </div>
            </div>
        </div>
    </>
    );
}
export default Home;
