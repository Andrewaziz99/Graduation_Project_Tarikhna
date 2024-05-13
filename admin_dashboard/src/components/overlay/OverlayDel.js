import { useState } from 'react';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import './overlay.css'
function OverlayDel(props) {
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
                <Modal.Header className='modalheaderDel' closeButton>
                    <Modal.Title>{props.buttonTitle} Lesson</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    ARE YOU SURE YOU WANT TO DELETE {props.lessonTitle}
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={handleClose}>
                        Cancel
                    </Button>
                    <Button variant="danger">Delete</Button>
                </Modal.Footer>
            </Modal>
        </>
    );
}
export default OverlayDel;