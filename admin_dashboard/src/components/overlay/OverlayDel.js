import { useState } from 'react';
import Button from 'react-bootstrap/Button';
import Modal from 'react-bootstrap/Modal';
import './overlay.css'
import lessonsData from '../lesson/Lessonsdata';
function OverlayDel(props) {
    const [show, setShow] = useState(false);

    const handleClose = () => setShow(false);
    const handleShow = () => setShow(true);
    const deleteLesson = async (lessonID) => {
        console.log("lesson  id");
        console.log(lessonID);
        try {
            if (props.type == 'question') {
                const response = await fetch('http://localhost:8888/questions/deleteQuestion/?questionID=' + lessonID, {
                    method: "DELETE"
                })
                const data = await response.json()
                if (data.status) {
                    console.log(data.data);
                    alert(data.message)
                } else {
                    console.error(data.message);
                    alert(data.message)
                }
            } else {
                const response = await fetch('http://localhost:8888/lesson/deleteLesson/?id=' + lessonID, {
                    method: "DELETE"
                })
                const data = await response.json()
                if (data.status) {
                    console.log(data.data);
                    alert(data.message)
                } else {
                    console.error(data.message);
                    alert(data.message)
                }
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
                    <Button variant="danger" onClick={() => { deleteLesson(props.id); handleClose() }}>Delete</Button>
                </Modal.Footer>
            </Modal>
        </>
    );
}
export default OverlayDel;