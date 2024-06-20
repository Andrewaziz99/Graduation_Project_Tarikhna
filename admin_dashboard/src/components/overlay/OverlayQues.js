import { useState } from 'react';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import './overlay.css'
import Dropdown from 'react-bootstrap/Dropdown';
import DropdownButton from 'react-bootstrap/DropdownButton';
import AllLessons from '../lesson/Lessonsdata'
import { json } from 'react-router-dom';


function OverlayQues(props) {
    const [show, setShow] = useState(false);
    const [lessonTitle, setLessonTitle] = useState('')
    const [questionLevel, setQuestionLevel] = useState()
    const [questionText, setQuestionText] = useState()
    const [questionChoices, setQuestionChoices] = useState([])
    const [questionCorrectAns, setCorrectAns] = useState()
    const [lessonID, setLessonID] = useState('')

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);
    const addChoices = (index, value) => {
        let choices = [...questionChoices]
        choices[index] = value
        setQuestionChoices(choices)
    }
    const checkNull = (event) => {
        if (lessonTitle == '') {
            alert("You must insert lesson Title");
        } else if (questionLevel == '') {
            alert("You must insert lesson Unit");
        } else if (questionText == '') {
            alert("You must choose year");
        } else if (questionChoices == []) {
            alert("You must insert at least one character");
        } else if (questionCorrectAns == '') {
            alert("You must insert at least one date");
        } else { addQuestion() }
    };
    const addQuestion = async () => {
        const questionData = {
            'question': questionText,
            'choices': questionChoices,
            'correctAns': questionCorrectAns,
            'level': questionLevel,
            'lessonID': lessonID
        }
        try {
            const response = await fetch('http://localhost:8080/questions/addQuestion', {
                body: JSON.stringify(questionData),
                method: "POST",
                headers: { 'Content-Type': 'application/json' }
            })
            const data = await response.json()
            if (response.ok) {
                if (data.status) {
                    console.log(data.data);
                    alert(data.message)
                } else {
                    console.error(data.message);
                    alert(data.message)
                }
            }
        } catch (error) {
            console.log(error);
            alert("An error has occured, please try again later")
        }
    }
    return (
        <>
            <Button className={props.buttonStyle} onClick={handleShow}>
                <i className={props.buttonIcon}></i>
                {props.buttonTitle}
            </Button>

            <Modal
                show={show}
                onHide={handleClose}
                backdrop="static"
                keyboard={false}
            >
                <Modal.Header className='modalheader' closeButton>
                    <Modal.Title>{props.buttonTitle} Question</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <h6>  You can add new question from here</h6>
                    <form onSubmit={(e) => e.preventDefaul()} className='width-100'>
                        <div className="row padtop align-items-center">
                            <div className="col">
                                <label className='form-label'>Lesson title</label>
                                <p>{lessonTitle}</p>
                            </div>
                            <div className="col">
                                <DropdownButton id="dropdown-basic-button" title="Choose lesson">
                                    {AllLessons.map(les => {
                                        return (
                                            <Dropdown.Item href="#/action-1" onClick={(e => { setLessonTitle(les.Title); setLessonID(les._id) })}>{les.Title}</Dropdown.Item>
                                        )
                                    })}
                                </DropdownButton>
                            </div>
                            <div className="col">
                                <label className='form-label'>Level</label>
                                <p>{questionLevel}</p>
                            </div>
                            <div className="col">
                                <DropdownButton id="dropdown-basic-button" title="Level">
                                    <Dropdown.Item href="#/action-1" onClick={(e) => { setQuestionLevel(1) }}>1</Dropdown.Item>
                                    <Dropdown.Item href="#/action-2" onClick={(e) => { setQuestionLevel(2) }}>2</Dropdown.Item>
                                    <Dropdown.Item href="#/action-3" onClick={(e) => { setQuestionLevel(3) }}>3</Dropdown.Item>
                                    <Dropdown.Item href="#/action-3" onClick={(e) => { setQuestionLevel(4) }}>4</Dropdown.Item>
                                    <Dropdown.Item href="#/action-3" onClick={(e) => { setQuestionLevel(5) }}>5</Dropdown.Item>
                                </DropdownButton>
                            </div>
                        </div>
                        <div className="width-100">
                            <label className='form-label'>Question Text</label>
                            <input type="text" className="form-control" value={props.QuestionText} onChange={(e) => { setQuestionText(e.target.value) }} />
                        </div>
                        <div className="row padtop">
                            <div className="col">
                                <label className='form-label'>Right Answer</label>
                                <p>{questionChoices[questionCorrectAns]}</p>
                            </div>
                            <div className="col">
                                <DropdownButton id="dropdown-basic-button" title="Right answer">
                                    <Dropdown.Item href="#/action-1" onClick={(e) => { setCorrectAns(0) }}>{questionChoices[0]}</Dropdown.Item>
                                    <Dropdown.Item href="#/action-2" onClick={(e) => { setCorrectAns(1) }}>{questionChoices[1]}</Dropdown.Item>
                                    <Dropdown.Item href="#/action-3" onClick={(e) => { setCorrectAns(2) }}>{questionChoices[2]}</Dropdown.Item>
                                    <Dropdown.Item href="#/action-3" onClick={(e) => { setCorrectAns(3) }}>{questionChoices[3]}</Dropdown.Item>
                                </DropdownButton>
                            </div>
                        </div>

                        <div className="width-100">
                            <label className='form-label'>Answers</label>
                            <div className="row">
                                <div className="col input-group">
                                    <div class="input-group-text">A</div>
                                    <input type="text" className="form-control" placeholder="Answer" onChange={(e) => { addChoices(0, e.target.value) }} />
                                </div>
                                <div className="col input-group">
                                    <div class="input-group-text">B</div>
                                    <input type="text" className="form-control" placeholder="Answer" onChange={(e) => { addChoices(1, e.target.value) }} />
                                </div>
                            </div>
                            <div className="row padtop ">
                                <div className="col input-group">
                                    <div class="input-group-text">C</div>
                                    <input type="text" className="form-control" placeholder="Answer" onChange={(e) => { addChoices(2, e.target.value) }} />
                                </div>
                                <div className="col input-group">
                                    <div class="input-group-text">D</div>
                                    <input type="text" className="form-control" placeholder="Answer" onChange={(e) => { addChoices(3, e.target.value) }} />
                                </div>
                            </div>
                        </div>
                    </form>
                </Modal.Body>
                <Modal.Footer>
                    <Button className='cancelmodal' onClick={handleClose}>
                        Cancel
                    </Button>
                    <Button className="edit" onClick={(e) => { checkNull() }}>{props.buttonTitle}</Button>
                </Modal.Footer>
            </Modal>
        </>
    );
}
export default OverlayQues;