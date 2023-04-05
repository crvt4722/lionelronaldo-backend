var index = 0
function Slider(){

    let arr = ['Ronaldo', 'Messi', 'Maguire', 'Benzema', 'Neymar', 'Mbappe']
    let arrLength = arr.length

    let [firstImage, setFirstImage] = React.useState("./assets/img/vote/ronaldo.jpg")
    let [secondImage, setSecondImage] = React.useState("./assets/img/vote/messi.jpg")
    let [thirdImage, setThirdImage] = React.useState("./assets/img/vote/maguire.jpg")

    let [firstLabel, setFirstLabel] = React.useState('Ronaldo')
    let [secondLabel, setSecondLabel] = React.useState('Messi')
    let [thirdLabel, setThirdLabel] = React.useState('Maguire')

    function changeImage(){
        if(index == 7) index = 0
        if(index == -1) index = arrLength -1

        let first = arr[index%arrLength]
        let second = arr[(index+1)%arrLength]
        let third = arr[(index+2)%arrLength]
        console.log(first + second + third + index)

        setFirstImage('./assets/img/vote/' + first.toLowerCase() + '.jpg')
        setSecondImage('./assets/img/vote/' + second.toLowerCase() + '.jpg')
        setThirdImage('./assets/img/vote/' + third.toLowerCase() + '.jpg')

        setFirstLabel(first)
        setSecondLabel(second)
        setThirdLabel(third)
    }

    function hanldeControlNext(){
        index += 1
        changeImage()
    }

    function handleControllPrev(){
        index -= 1 
        changeImage()
    }

    return (
        <>
        <div className="control prev" onClick = {handleControllPrev}><i className="fa-sharp fa-solid fa-chevron-left"></i></div>
        <div className="item first">
            <img src= {firstImage} alt="" />
            <input type="radio" name="player" id="first-section" value={firstLabel}/>
            <label htmlFor="first-section">{firstLabel}</label>
        </div>

        <div className="item second">
            <img src= {secondImage} alt="" />
            <input type="radio" name="player" id ="second-section" value = {secondLabel} />
            <label htmlFor="second-section">{secondLabel}</label>
        </div>

        <div className="item third">
            <img src= {thirdImage} alt="" />
            <input type="radio" name="player" id = "third-section" value = {thirdLabel}/>
            <label htmlFor="third-section">{thirdLabel}</label>
        </div>
        <div className="control next" onClick={hanldeControlNext}><i className="fa-sharp fa-solid fa-chevron-right"></i></div>
        </>
    )
}

function BarChart(){

    React.useEffect(()=>{
        const ctx = document.getElementById('myChart');
        
        let labels = []
        let votes = []
        for (let i = 0 ;i < localStorage.length; ++i) {
            let key = localStorage.key(i)
            let value = localStorage.getItem(key)
            labels.push(key)
            votes.push(value)
        }
        
        
        const data = {
        labels: labels,
        datasets: [{
            label: 'Who is the best?',
            data: votes,
            backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(255, 159, 64, 0.2)',
            'rgba(255, 205, 86, 0.2)',
             'rgba(75, 192, 192, 0.2)',
             'rgba(54, 162, 235, 0.2)',
             'rgba(153, 102, 255, 0.2)',
             'rgba(201, 203, 207, 0.2)'
            ],
            borderColor: [
            'rgb(255, 99, 132)',
            'rgb(255, 159, 64)',
            'rgb(255, 205, 86)',
             'rgb(75, 192, 192)',
             'rgb(54, 162, 235)',
             'rgb(153, 102, 255)',
             'rgb(201, 203, 207)'
            ],
            borderWidth: 1
        }]
        };
        const config = {
            type: 'bar',
            data: data,
            options: {
                scales: {
                y: {
                    beginAtZero: true
                }
                }
            },
        };

        new Chart(ctx, config);
    }, [])

    return <canvas id="myChart"></canvas>
}

const root = ReactDOM.createRoot(document.querySelector('.items'))
root.render(<Slider/>)


function renderSlider(){
    root.render(<Slider/>)
}

let userInput = document.querySelector(".user-email").textContent
function submitSection(){
//    root.render(<Slider/>)
//    let userInput = prompt('Type your username: ')
    if (userInput){
        let players = document.getElementsByName('player')
        for (let player of players){
            if(player.checked){
                let data = JSON.stringify({"userName": userInput, "idol": player.value})

                let xhr = new XMLHttpRequest()
                xhr.open('POST', 'http://localhost:8080/LeoCris/ProcessReceiveVote', true)
                xhr.setRequestHeader('Content-Type', 'application/json')
                xhr.onreadystatechange = function() {
                    if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                      // X? lý ph?n h?i t? Servlet ho?c x? lý d? li?u trên trang ? ?ây
                        console.log('1111')

                        let resultObject = JSON.parse(xhr.responseText)
                        console.log(resultObject)

                        for (let player in resultObject){
                            localStorage.setItem(player, resultObject[player])
                        }
                    }
                  };
                xhr.send(data)
                break
            }
        }
        alert("Sucessfully!")
    }
}
function analysChart(){
    root.render(<BarChart/>)
}