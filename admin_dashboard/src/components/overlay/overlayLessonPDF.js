import { useState } from 'react';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import './overlay.css'
import OverlayTrigger from 'react-bootstrap/OverlayTrigger';
import Tooltip from 'react-bootstrap/Tooltip';
import axios from 'axios';


function Overlay(props) {
    const [show, setShow] = useState(false);


    const [character, setCharacter] = useState([{ nameOfCharacter: '', Events: [] }]);
    const [date, setDate] = useState([{ date: '', event: [] }]);
    const [title, setTitle] = useState('')
    const [unit, setUnit] = useState('')
    const [grade, setGrade] = useState('')
    const [file, setFile] = useState();
    const [showOverlay, setShowOverlay] = useState(false)
    // if (props.buttonTitle == "Edit") {
    //     setCharacter(props.summaryText);
    // }

    const handleClose = () => {
        setShow(false);
        setCharacter([{ nameOfCharacter: '', Events: [] }])
        setDate([{ date: '', event: [] }])
        setTitle('')
        setUnit('Choose unit')
        setGrade('Choose grade')
        setFile('')
    }
    const handleShow = () => setShow(true);

    let summarizedLesson
    const upload = async () => {
        handleShow()
        const formData = new FormData()
        formData.append('file', file)
        try {
            const res = await axios.post('http://localhost:8888/lesson/uploadPdf', formData)
            if (res.data.status) {
                // console.log(res.data.data);
                summarizedLesson = res.data.data
                console.log(summarizedLesson);
                setTitle(summarizedLesson.Title)
                setUnit(summarizedLesson.unit)
                setGrade(summarizedLesson.year)
                setCharacter(summarizedLesson.characters)
                setDate(summarizedLesson.dates)
            } else {
                console.log(res.data.message.error.message);
                alert(res.data.message.error.message)
            }

        } catch (error) {
            console.log(error);
            alert("An error has occured, please try again later")
        }
    }

    const handleAddTitle = (value) => {
        setTitle(value)
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
    const handleSubmit = async (e) => {
        e.preventDefault();
        // console.log(character);
        // console.log(date);
        // console.log(title);
        // console.log(grade);
        const data = {
            characters: character,
            dates: date,
            Title: title,
            unit: unit,
            year: grade
        }
        console.log(data.characters);
        const myHeaders = new Headers();
        myHeaders.append('Authorization', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoiNjY0MjlkNDAxNWI4Y2E1NTNmNGFjNzY2IiwibmFtZSI6IlRob21hcyIsImVtYWlsIjoidGhvbWFzbWFnZWQyQGdtYWlsLmNvbSIsInllYXIiOiI2IiwiaWF0IjoxNzE1NjUzMjMxfQ.2cXsUtJ8GFN-jn62wIjUv59jqIEqmjaVIZnS-1Ujd_M');
        myHeaders.append('Content-Type', 'application/json')

        try {
            let response = await fetch("http://localhost:8888/lesson/addLesson", {
                method: "POST",
                headers: myHeaders,
                body: JSON.stringify(data)
            })

            if (response.ok) {
                const data = await response.json();
                console.log(data); // Handle the response data as needed
            } else {
                console.error(`HTTP ${response.status}: ${response.statusText}`);
            }
        } catch (error) {
            console.log(error);
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
            <input type='file' onChange={(e) => { setFile(e.target.files[0]) }}></input>
            <Button className={props.buttonStyle} onClick={upload}>
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
                            <input type="text" className="form-control" onChange={(e) => { handleAddTitle(e.target.value) }} value={title} placeholder='Lesson title' />
                        </div>
                        <div className="col">
                            <label>Unit</label>
                            <select className="form-select" onChange={(e) => { handleAddUnit(e.target.value) }} >
                                <option >Choose unit</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                        <div className="col">
                            <label>Grade</label>
                            <select className="form-select" onChange={(e) => { handleAddGrade(e.target.value) }} >
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
                                        value={input.nameOfCharacter}
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
                </Modal.Body>
                <Modal.Footer>
                    <Button className='cancelmodal' onClick={handleClose}>
                        Cancel
                    </Button>
                    <Button onClick={handleSubmit} className="edit">{props.buttonTitle}</Button>
                </Modal.Footer>
            </Modal>
        </>
    );
}
export default Overlay;