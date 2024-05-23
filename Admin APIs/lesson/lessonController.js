const lessonServices = require('./lessonServices')
const pdf2img = require('pdf-img-convert');
const t = require('tesseract.js')
const fs = require('fs')
const AI_services = require('../AI_Summerization/AI_Services')


const getAllLessons = (done)=>{
    lessonServices.getAllLessons(done)
}

const addLesson = (data, done)=>{
    lessonServices.addLesson(data, done)
}

//summarize the pdf and add it to lessons database
const pdf_summarize = async (path, done)=>{
    const extractedText = await convertFromPdfToText(path)
    await AI_services.summarizeText(extractedText, (err, summarizeText)=>{
        if (err) {
            return done(err, undefined)
        }
        console.log("summarized Text: ",summarizeText.data);
        return done(undefined, summarizeText.data)
    })
}

//delete lesson by id
const deleteLesson = (lessonID, done)=>{
  lessonServices.deleteLesson(lessonID, done)
}

const updateLesson = (lessonID, lessonTitle, lessonUnit, lessonGrade, characters, dates, done)=>{
  lessonServices.updateLesson(lessonID, lessonTitle, lessonUnit, lessonGrade, characters, dates, done)
}



const convertPdfIntoImages = async function (path) {
    try {
      pdfArray = await pdf2img.convert(path);
    console.log(pdfArray);
    console.log("saving");
    for (i = 0; i < pdfArray.length; i++){
      fs.writeFile("imagesFolder/output"+i+".png", pdfArray[i], function (error) {
        if (error) { console.error("Error: " + error); }
      }); //writeFile
    } // for
    } catch (error) {
      console.log(error);
    }
    
  }

  //Extract text from images
const extractTextFromImage = async(file)=>{
    try {
    const result = await t.recognize('./imagesFolder/'+file, 'ara')
    // console.log(result.data.text);
    const text = result.data.text
    return text
    } catch (error) {
      throw error
    }
  }

  //delete images in the folder
const deleteImagesInFolder = ()=>{
    fs.readdir('./imagesFolder', (err, files)=>{
      if (err) {
        throw err
      }
      console.log(files);
      files.forEach((file)=>{
        fs.unlink('./imagesFolder/'+file, (err)=>{
          if (err) {
            throw err
          }
        })
      })
        
    })
  }

  const convertFromPdfToText = async (path) => {
    try {
      let text = ''
      await convertPdfIntoImages(path)
      console.log("Thomas");
  
      const files = await fs.promises.readdir('./imagesFolder');
  
      for (const index in files) {
        console.log(files[index]);
        let newText = await extractTextFromImage(files[index]);
        text = text + newText
      }
      deleteImagesInFolder()
      return text
  
    } catch (error) {
      throw error
    }
  }


module.exports = {getAllLessons, addLesson, pdf_summarize, deleteLesson, updateLesson}
