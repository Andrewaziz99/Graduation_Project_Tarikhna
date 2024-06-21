import { useState } from 'react';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import './overlay.css'
import Dropdown from 'react-bootstrap/Dropdown';
import DropdownButton from 'react-bootstrap/DropdownButton';
import AllLessons from '../lesson/Lessonsdata'
import { json } from 'react-router-dom';

function OverlayEditQues(props) {
    const [show, setShow] = useState(false);
    const [lessonTitle, setLessonTitle] = useState(props.lessonTitle)
    const [questionLevel, setQuestionLevel] = useState(props.level)
    const [questionText, setQuestionText] = useState(props.QuestionText)
    const [questionChoices, setQuestionChoices] = useState(props.choices)
    const [questionCorrectAns, setCorrectAns] = useState(props.correctAns)
    const [lessonID, setLessonID] = useState(props.lessonID)

    const handleClose = () => {
        setShow(false);
        setLessonTitle(props.lessonTitle)
        setQuestionLevel(props.level)
        setQuestionText(props.QuestionText)
        setQuestionChoices(props.choices)
        setCorrectAns(props.correctAns)
        setLessonID(props.lessonID)
    }
    const handleShow = () => { setShow(true) };
    const updateChoices = (index, newValue) => {
        let updatedChoices = [...questionChoices]
        updatedChoices[index] = newValue
        setQuestionChoices(updatedChoices)
        console.log(questionChoices);
    }
    const editQuestion = async () => {
        const updatedQuestionData = {
            'questionID': props.id,
            'question': questionText,
            'choices': questionChoices,
            'correctAns': questionCorrectAns,
            'level': questionLevel,
            'lessonID': lessonID
        }
        try {
            const response = await fetch('http://localhost:8888/questions/editQuestion', {
                method: 'PUT',
                body: JSON.stringify(updatedQuestionData),
                headers: { 'Content-Type': 'application/json' }
            })
            const data = await response.json()
            if (data.status) {
                alert(data.message)
                console.log(data);
            } else {
                console.error(`HTTP ${response.status}: ${response.statusText}`);
                alert(data.message)
            }
        } catch (error) {
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
                            <label className='form-label' value={questionText}>Question Text</label>
                            <input type="text" className="form-control" value={questionText} onChange={(e) => { setQuestionText(e.target.value) }} />
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
                                    <input type="text" className="form-control" placeholder="Answer" value={questionChoices[0]} onChange={(e) => { updateChoices(0, e.target.value) }} />
                                </div>
                                <div className="col input-group">
                                    <div class="input-group-text">B</div>
                                    <input type="text" className="form-control" placeholder="Answer" value={questionChoices[1]} onChange={(e) => { updateChoices(1, e.target.value) }} />
                                </div>
                            </div>
                            <div className="row padtop ">
                                <div className="col input-group">
                                    <div class="input-group-text">C</div>
                                    <input type="text" className="form-control" placeholder="Answer" value={questionChoices[2]} onChange={(e) => { updateChoices(2, e.target.value) }} />
                                </div>
                                <div className="col input-group">
                                    <div class="input-group-text">D</div>
                                    <input type="text" className="form-control" placeholder="Answer" value={questionChoices[3]} onChange={(e) => { updateChoices(3, e.target.value) }} />
                                </div>
                            </div>
                        </div>
                    </form>
                </Modal.Body>
                <Modal.Footer>
                    <Button className='cancelmodal' onClick={handleClose}>
                        Cancel
                    </Button>
                    <Button className="edit" onClick={(e) => { editQuestion() }}>{props.buttonTitle}</Button>
                </Modal.Footer>
            </Modal>
        </>
    );
}
export default OverlayEditQues;