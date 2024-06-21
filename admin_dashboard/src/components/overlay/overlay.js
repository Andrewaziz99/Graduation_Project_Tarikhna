import { useState } from 'react';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import './overlay.css'
import OverlayTrigger from 'react-bootstrap/OverlayTrigger';
import Tooltip from 'react-bootstrap/Tooltip';

function Overlay(props) {
    const [show, setShow] = useState(false);

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);
    const [character, setCharacter] = useState([{ nameOfCharacter: '', Events: [] }]);
    // if (props.buttonTitle == "Edit") {
    //     setCharacter(props.summaryText);
    // }
    const [date, setDate] = useState([{ date: '', event: [] }]);
    const [title, setTitle] = useState('')
    const [unit, setUnit] = useState('')
    const [grade, setGrade] = useState('')
    const [arText, setArText] = useState('')

    const handleAddTitle = (value) => {
        setTitle(value)
    }
    const handleAddArText = (value) => {
        setArText(value)
    }
    const handleAddUnit = (value) => {
        setUnit(value)
    }
    const handleAddGrade = (value) => {
        setGrade(value)
    }
    const handleAddInput = () => {
        setCharacter([...character, { nameOfCharacter: '', Events: [] }]);
    };
    const handleAddDate = () => {
        setDate([...date, { date: '', event: [] }]);
    };
    const checkNull = (event) => {
        if (title == '') {
            alert("You must insert lesson Title");
        } else if (unit == '') {
            alert("You must insert lesson Unit");
        } else if (grade == '') {
            alert("You must choose year");
        } else if (character[0].nameOfCharacter == '' || character[0].Events == []) {
            alert("You must insert at least one character");
        } else if (date[0].date == '' || date[0].event == []) {
            alert("You must insert at least one date");
        } else { handleSubmit(event) }
    };
    const handleSubmit = async (e) => {
        e.preventDefault();
        // console.log(character);
        // console.log(date);
        // console.log(title);
        // console.log(grade);
        const lessonData = {
            characters: character,
            dates: date,
            Title: title,
            unit: unit,
            year: grade,
            AR_Text: arText
        }

        console.log(lessonData.characters);
        const myHeaders = new Headers();
        myHeaders.append('Authorization', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoiNjY0MjlkNDAxNWI4Y2E1NTNmNGFjNzY2IiwibmFtZSI6IlRob21hcyIsImVtYWlsIjoidGhvbWFzbWFnZWQyQGdtYWlsLmNvbSIsInllYXIiOiI2IiwiaWF0IjoxNzE1NjUzMjMxfQ.2cXsUtJ8GFN-jn62wIjUv59jqIEqmjaVIZnS-1Ujd_M');
        myHeaders.append('Content-Type', 'application/json')

        try {
            console.log("data");
            console.log(lessonData.AR_Text);
            let response = await fetch("http://localhost:8888/lesson/addLesson", {
                method: "POST",
                headers: myHeaders,
                body: JSON.stringify(lessonData)
            })
            const data = await response.json();
            if (data.status) {
                console.log(data); // Handle the response data as needed
                alert(data.message)
            } else {
                console.error(data.message);
                alert(data.message)
            }
        } catch (error) {
            console.log(error);
            alert("An error has occured, please try again later")
        }

    }
    const handleCharacterChange = (index, value) => {
        const updatedInputs = [...character];
        updatedInputs[index].nameOfCharacter = value;
        setCharacter(updatedInputs);
    };
    const handleDateChange = (index, value) => {
        const updatedInputs = [...date];
        updatedInputs[index].date = value;
        setDate(updatedInputs);
    };
    const handleEventChange = (index, eventIndex, value) => {
        const updatedInputs = [...character];
        updatedInputs[index].Events[eventIndex] = value;
        setCharacter(updatedInputs);
    };
    const handleDateEventChange = (index, eventIndex, value) => {
        const updatedInputs = [...date];
        updatedInputs[index].event[eventIndex] = value;
        setDate(updatedInputs);
    };
    const handleAddEvent = (index) => {
        const updatedInputs = [...character];
        updatedInputs[index].Events.push('');
        setCharacter(updatedInputs);
    };
    const handleAddDateEvent = (index) => {
        const updatedInputs = [...date];
        updatedInputs[index].event.push('');
        setDate(updatedInputs);
    };
    const handleRemoveInput = (index) => {
        const updatedInputs = [...character];
        updatedInputs.splice(index, 1);
        setCharacter(updatedInputs);
    };
    const handleRemoveDate = (index) => {
        const updatedInputs = [...date];
        updatedInputs.splice(index, 1);
        setDate(updatedInputs);
    };
    const handleRemoveEvent = (index, eventIndex) => {
        const updatedInputs = [...character];
        updatedInputs[index].Events.splice(eventIndex, 1);
        setCharacter(updatedInputs);
    };
    const handleRemoveDateEvent = (index, eventIndex) => {
        const updatedInputs = [...date];
        updatedInputs[index].event.splice(eventIndex, 1);
        setDate(updatedInputs);
    };
    const renderTooltipDelCharacter = (props) => (
        <Tooltip id="button-tooltip" {...props}>
            Delete Character
        </Tooltip>
    );
    const renderTooltipDelDate = (props) => (
        <Tooltip id="button-tooltip" {...props}>
            Delete Date
        </Tooltip>
    );
    const renderTooltipDelEvent = (props) => (
        <Tooltip id="button-tooltip" {...props}>
            Delete Event
        </Tooltip>
    );

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
                    <Modal.Title>{props.buttonTitle} Lesson</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <h5>you can Add new lesson</h5>
                    <div className="row">
                        <div className="col">
                            <label>Lesson Title</label>
                            <input type="text" className="form-control" onChange={(e) => { handleAddTitle(e.target.value) }} placeholder='Lesson title' required />
                        </div>
                        <div className="col">
                            <label>Unit</label>
                            <select className="form-select" onChange={(e) => { handleAddUnit(e.target.value) }}>
                                <option ></option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                        <div className="col">
                            <label>Grade</label>
                            <select className="form-select" onChange={(e) => { handleAddGrade(e.target.value) }}>
                                <option >Choose grade</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                            </select>
                        </div>
                    </div>
                    <div >
                        <div className='row sections'>
                            <h5 className='col'>Character summary section</h5>
                            <button className='col btn addchar' onClick={handleAddInput}>+ Character</button>
                        </div>
                        {character.map((input, index) => (
                            <div key={index}>
                                <div className='flex input-group'>
                                    <OverlayTrigger
                                        placement="top"
                                        delay={{ show: 250, hide: 400 }}
                                        overlay={renderTooltipDelCharacter}
                                    >
                                        <button className='btn btn-danger ' onClick={() => handleRemoveInput(index)}>-</button>

                                    </OverlayTrigger>

                                    <input
                                        type="text"
                                        className='form-control'
                                        placeholder="Enter a character"
                                        value={input.character}
                                        required
                                        onChange={(e) => handleCharacterChange(index, e.target.value)}
                                    />
                                    <button className='btn addeventbtn' onClick={() => handleAddEvent(index)}>Add Event</button>

                                </div>
                                {input.Events.map((event, eventIndex) => (
                                    <div key={eventIndex} className="flex input-group pad">
                                        <input
                                            type="text"
                                            className='form-control'
                                            placeholder="Enter an event"
                                            value={event}
                                            onChange={(e) => handleEventChange(index, eventIndex, e.target.value)}
                                        />
                                        <OverlayTrigger
                                            placement="top"
                                            delay={{ show: 250, hide: 400 }}
                                            overlay={renderTooltipDelEvent}
                                        >
                                            <button className='btn btn-danger' onClick={() => handleRemoveEvent(index, eventIndex)}>-</button></OverlayTrigger>
                                    </div>
                                ))}


                            </div>
                        ))}
                    </div>
                    <div>
                        <div className='row sections'>
                            <h5 className='col'>Date summary section</h5>
                            <button className='col btn addchar' onClick={handleAddDate}>+ Date</button>
                        </div>

                        {date.map((input, index) => (
                            <div key={index}>
                                <div className='flex input-group'>
                                    <OverlayTrigger
                                        placement="top"
                                        delay={{ show: 250, hide: 400 }}
                                        overlay={renderTooltipDelDate}
                                    >
                                        <button className='btn btn-danger ' onClick={() => handleRemoveDate(index)}>-</button>
                                    </OverlayTrigger>
                                    <input
                                        type="text"
                                        className='form-control'
                                        placeholder="Enter a Date"
                                        value={input.date}
                                        required
                                        onChange={(e) => handleDateChange(index, e.target.value)}
                                    />
                                    <button className='btn addeventbtn' onClick={() => handleAddDateEvent(index)}>Add Event</button>
                                </div>
                                {input.event.map((event, eventIndex) => (
                                    <div key={eventIndex} className="flex input-group pad">
                                        <input
                                            type="text"
                                            className='form-control'
                                            placeholder="Enter an event"
                                            value={event}
                                            required
                                            onChange={(e) => handleDateEventChange(index, eventIndex, e.target.value)}
                                        />
                                        <OverlayTrigger
                                            placement="top"
                                            delay={{ show: 250, hide: 400 }}
                                            overlay={renderTooltipDelEvent}
                                        >
                                            <button className='btn btn-danger' onClick={() => handleRemoveDateEvent(index, eventIndex)}>-</button>
                                        </OverlayTrigger>
                                    </div>
                                ))}
                                <div className='flex'>


                                </div>
                            </div>
                        ))}

                    </div>
                    <div>
                        <div className='row sections'>
                            <h5 className='col'>AR Text Section</h5>
                        </div>
                        <input
                            type="text"
                            className='form-control'
                            placeholder="Enter a Date"
                            value={arText}
                            onChange={(e) => { handleAddArText(e.target.value) }}
                        />

                    </div>
                </Modal.Body>
                <Modal.Footer>
                    <Button className='cancelmodal' onClick={handleClose}>
                        Cancel
                    </Button>
                    <Button type='submit' onClick={checkNull} className="edit">{props.buttonTitle}</Button>
                </Modal.Footer>
            </Modal>
        </>
    );
}
export default Overlay;