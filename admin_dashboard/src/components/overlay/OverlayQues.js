import { useState } from 'react';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import './overlay.css'
import Dropdown from 'react-bootstrap/Dropdown';
import DropdownButton from 'react-bootstrap/DropdownButton';

function OverlayQues(props) {
    const [show, setShow] = useState(false);

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);

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
                            </div>
                            <div className="col">
                                <DropdownButton id="dropdown-basic-button" title="Choose lesson">
                                    <Dropdown.Item href="#/action-1">A</Dropdown.Item>
                                    <Dropdown.Item href="#/action-2">B</Dropdown.Item>
                                    <Dropdown.Item href="#/action-3">C</Dropdown.Item>
                                    <Dropdown.Item href="#/action-3">D</Dropdown.Item>
                                </DropdownButton>
                            </div>
                            <div className="col">
                                <label className='form-label'>Grade</label>
                            </div>
                            <div className="col">
                                <DropdownButton id="dropdown-basic-button" title="Grade">
                                    <Dropdown.Item href="#/action-1">A</Dropdown.Item>
                                    <Dropdown.Item href="#/action-2">B</Dropdown.Item>
                                    <Dropdown.Item href="#/action-3">C</Dropdown.Item>
                                    <Dropdown.Item href="#/action-3">D</Dropdown.Item>
                                </DropdownButton>
                            </div>
                        </div>
                        <div className="width-100">
                            <label className='form-label'>Question Text</label>
                            <input type="text" className="form-control" value={props.QuestionText} />
                        </div>
                        <div className="row padtop">
                            <div className="col">
                                <label className='form-label'>Right Answer</label>
                            </div>
                            <div className="col">
                                <DropdownButton id="dropdown-basic-button" title="Right answer">
                                    <Dropdown.Item href="#/action-1">A</Dropdown.Item>
                                    <Dropdown.Item href="#/action-2">B</Dropdown.Item>
                                    <Dropdown.Item href="#/action-3">C</Dropdown.Item>
                                    <Dropdown.Item href="#/action-3">D</Dropdown.Item>
                                </DropdownButton>
                            </div>
                        </div>

                        <div className="width-100">
                            <label className='form-label'>Answers</label>
                            <div className="row">
                                <div className="col input-group">
                                    <div class="input-group-text">A</div>
                                    <input type="text" className="form-control" placeholder="Answer" />
                                </div>
                                <div className="col input-group">
                                    <div class="input-group-text">B</div>
                                    <input type="text" className="form-control" placeholder="Answer" />
                                </div>
                            </div>
                            <div className="row padtop ">
                                <div className="col input-group">
                                    <div class="input-group-text">C</div>
                                    <input type="text" className="form-control" placeholder="Answer" />
                                </div>
                                <div className="col input-group">
                                    <div class="input-group-text">D</div>
                                    <input type="text" className="form-control" placeholder="Answer" />
                                </div>
                            </div>
                        </div>
                    </form>
                </Modal.Body>
                <Modal.Footer>
                    <Button className='cancelmodal' onClick={handleClose}>
                        Cancel
                    </Button>
                    <Button className="edit">{props.buttonTitle}</Button>
                </Modal.Footer>
            </Modal>
        </>
    );
}
export default OverlayQues;