// const lessonsData = [
//     { lessonTitle: 'Lesson Title 1', grade: 4, id: 1, summaryText: [{ character: "kotoz", events: ["event1", "event2", "event3 kotoz"] }, { character: "harry", events: ["event1", "event 2 harry"] }], summaryByDate: [{ date: '1/12/2000', events: ["eventdate1", "eventdate2"] }] },
//     { lessonTitle: 'Lesson Title 2', grade: 4, id: 2, summaryText: [{ character: "kotoz", events: ["event1", "event2", "event3 kotoz"] }, { character: "harry", events: ["event1", "event 2 harry"] }], summaryByDate: [{ date: '1/12/2000', events: ["eventdate1", "eventdate2"] }] },
//     { lessonTitle: 'Lesson Title 3', grade: 4, id: 3, summaryText: [{ character: "kotoz", events: ["event1", "event2", "event3 kotoz"] }, { character: "harry", events: ["event1", "event 2 harry"] }], summaryByDate: [{ date: '1/12/2000', events: ["eventdate1", "eventdate2"] }] },
//     { lessonTitle: 'Lesson Title 4', grade: 4, id: 4, summaryText: [{ character: "kotoz", events: ["event1", "event2", "event3 kotoz"] }, { character: "harry", events: ["event1", "event 2 harry"] }], summaryByDate: [{ date: '1/12/2000', events: ["eventdate1", "eventdate2"] }] },
//     { lessonTitle: 'Lesson Title 1', grade: 5, id: 5, summaryText: [{ character: "kotoz", events: ["event1", "event2", "event3 kotoz"] }, { character: "harry", events: ["event1", "event 2 harry"] }], summaryByDate: [{ date: '1/12/2000', events: ["eventdate1", "eventdate2"] }] },
//     { lessonTitle: 'Lesson Title 2', grade: 5, id: 6, summaryText: [{ character: "kotoz", events: ["event1", "event2", "event3 kotoz"] }, { character: "harry", events: ["event1", "event 2 harry"] }], summaryByDate: [{ date: '1/12/2000', events: ["eventdate1", "eventdate2"] }] },
//     { lessonTitle: 'Lesson Title 3', grade: 5, id: 7, summaryText: [{ character: "kotoz", events: ["event1", "event2", "event3 kotoz"] }, { character: "harry", events: ["event1", "event 2 harry"] }], summaryByDate: [{ date: '1/12/2000', events: ["eventdate1", "eventdate2"] }] },
//     { lessonTitle: 'Lesson Title 1', grade: 6, id: 8, summaryText: [{ character: "kotoz", events: ["event1", "event2", "event3 kotoz"] }, { character: "harry", events: ["event1", "event 2 harry"] }], summaryByDate: [{ date: '1/12/2000', events: ["eventdate1", "eventdate2"] }] },
//     { lessonTitle: 'Lesson Title 2', grade: 6, id: 9, summaryText: [{ character: "kotoz", events: ["event1", "event2", "event3 kotoz"] }, { character: "harry", events: ["event1", "event 2 harry"] }], summaryByDate: [{ date: '1/12/2000', events: ["eventdate1", "eventdate2"] }] }



// ];
let lessonsData

async function getAllLessons() {
    const myHeaders = new Headers();
    // myHeaders.append('Content-Type', 'application/json');
    myHeaders.append('Authorization', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidXNlciIsImlkIjoiNjY0MjlkNDAxNWI4Y2E1NTNmNGFjNzY2IiwibmFtZSI6IlRob21hcyIsImVtYWlsIjoidGhvbWFzbWFnZWQyQGdtYWlsLmNvbSIsInllYXIiOiI2IiwiaWF0IjoxNzE1NjUzMjMxfQ.2cXsUtJ8GFN-jn62wIjUv59jqIEqmjaVIZnS-1Ujd_M');
    try {
        let response = await fetch("http://localhost:8888/lesson/getAllLessons", {
            method: "GET",
            headers: myHeaders
        })
        const data = await response.json()
        if (data.status) {
            lessonsData = data.data
            return lessonsData
        } else {
            console.error(`HTTP ${response.status}: ${response.statusText}`);
            alert(data.message)
        }
    } catch (error) {
        console.log(error);
        alert("Failed to fetch data")
        return []
    }
    
}

lessonsData = await getAllLessons()
console.log("Here in lesson data");
console.log(lessonsData);


export default lessonsData;