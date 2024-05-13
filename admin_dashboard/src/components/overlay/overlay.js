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
    const [character, setCharacter] = useState([{ character: '', events: [] }]);
    // if (props.buttonTitle == "Edit") {
    //     setCharacter(props.summaryText);
    // }
    const [date, setDate] = useState([{ date: '', events: [] }]);

    const handleAddInput = () => {
        setCharacter([...character, { character: '', events: [] }]);
    };
    const handleAddDate = () => {
        setDate([...date, { date: '', events: [] }]);
    };
    const handleSubmit = (e) => {
        e.preventDefault();
        console.log(character);
        console.log(date);
    }
    const handleCharacterChange = (index, value) => {
        const updatedInputs = [...character];
        updatedInputs[index].character = value;
        setCharacter(updatedInputs);
    };
    const handleDateChange = (index, value) => {
        const updatedInputs = [...date];
        updatedInputs[index].date = value;
        setDate(updatedInputs);
    };
    const handleEventChange = (index, eventIndex, value) => {
        const updatedInputs = [...character];
        updatedInputs[index].events[eventIndex] = value;
        setCharacter(updatedInputs);
    };
    const handleDateEventChange = (index, eventIndex, value) => {
        const updatedInputs = [...date];
        updatedInputs[index].events[eventIndex] = value;
        setDate(updatedInputs);
    };
    const handleAddEvent = (index) => {
        const updatedInputs = [...character];
        updatedInputs[index].events.push('');
        setCharacter(updatedInputs);
    };
    const handleAddDateEvent = (index) => {
        const updatedInputs = [...date];
        updatedInputs[index].events.push('');
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
        updatedInputs[index].events.splice(eventIndex, 1);
        setCharacter(updatedInputs);
    };
    const handleRemoveDateEvent = (index, eventIndex) => {
        const updatedInputs = [...date];
        updatedInputs[index].events.splice(eventIndex, 1);
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
                            <input type="text" className="form-control" placeholder='Lesson title' />
                        </div>
                        <div className="col">
                            <label>Grade</label>
                            <select className="form-select">
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
                            <button className='col btn addchar' onClick={handleAddDate}>+ Character</button>
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
                                        onChange={(e) => handleCharacterChange(index, e.target.value)}
                                    />
                                    <button className='btn addeventbtn' onClick={() => handleAddEvent(index)}>Add Event</button>

                                </div>
                                {input.events.map((event, eventIndex) => (
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
                                {input.events.map((event, eventIndex) => (
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