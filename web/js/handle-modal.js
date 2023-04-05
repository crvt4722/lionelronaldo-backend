//const signupForm = document.querySelector('.signup .modal-content')
var signupForm = document.querySelector('.signup .modal-content')

signupForm.addEventListener('submit', (e) =>{
    e.preventDefault()

    let data = JSON.stringify({
        "fullname": document.querySelector('#fullname__signup').value,
        "email": document.querySelector('#email__signup').value,
        "password": document.querySelector('#password__signup').value,
        "repassword": document.querySelector('#repassword__signup').value
    })

    console.log(data)

    let xhr = new XMLHttpRequest()
    xhr.open('POST', 'http://localhost:8080/LeoCris/ProcessSignup', true)
    xhr.setRequestHeader('Content-Type', 'application/json')
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
          // Xử lý phản hồi từ backend.
            document.querySelector('.alert-danger__signup').textContent = xhr.responseText

            setTimeout(()=>{
                document.querySelector('.alert-danger__signup').textContent = ''
            }, 3000)
        }
      };
    xhr.send(data)
})


//Login
var loginForm = document.querySelector('.login .modal-content')

loginForm.addEventListener('submit', (e) =>{
    e.preventDefault()

    let data = JSON.stringify({
        "email": document.querySelector('#email__login').value,
        "password": document.querySelector('#password__login').value
    })

    console.log(data)

    let xhr = new XMLHttpRequest()
    xhr.open('POST', 'http://localhost:8080/LeoCris/ProcessLogin', true)
    xhr.setRequestHeader('Content-Type', 'application/json')
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
          // Xử lý phản hồi từ backend.
            document.querySelector('.alert-danger__login').textContent = xhr.responseText
            
            setTimeout(()=>{
                document.querySelector('.alert-danger__login').textContent = ''
                
                if(xhr.responseText.includes('logined successfully!')){
                    const modalLogin = document.querySelector('.modal.login')
                    modalLogin.classList.remove('open')
                    location.reload()
                }
            }, 1000)
            
            
        }
      };
    xhr.send(data)
})
