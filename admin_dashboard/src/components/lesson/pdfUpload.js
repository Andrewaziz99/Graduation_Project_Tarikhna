import axios from 'axios';
import React, { useState } from 'react';
import Button from 'react-bootstrap/Button';
import Overlay from '../overlay/overlayLessonPDF';

function PDF_Upload(params) {
    let summarizedLesson
    const [file, setFile] = useState();
    const [showOverlay, setShowOverlay] = useState(false)
    const upload = async () => {
        const formData = new FormData()
        formData.append('file', file)
        try {
            const res = await axios.post('http://localhost:9000/lesson/uploadPdf', formData)
            if (res.data.status) {
                console.log(res.data.data);
                summarizedLesson = res.data.data
                if (summarizedLesson) {
                    setShowOverlay(true)
                }
            } else {
                console.log(res.data.message);
            }

        } catch (error) {
            console.log(error);
            alert("Failed to reach to server")
        }


    }
    return (
        <div>
            <input type='file' onChange={(e) => { setFile(e.target.files[0]) }}></input>
            <Button className='edit' onClick={upload}>
                upload
            </Button>
            {showOverlay && <Overlay show={true} />}

        </div>

    )
}

export default PDF_Upload