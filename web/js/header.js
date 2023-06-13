setTimeout(()=>{
    const userEmail = document.querySelector('.user-email')
    const loginBtn = document.querySelector('.login-btn')
    const management = document.querySelector('.item--management')
    const authorization = document.querySelector('.item--authorization')
    const order = document.querySelector('.item--order')
    const dashboard = document.querySelector('.item--dashboard')
//    const textInput = document.querySelector('.search-login input')
    
    console.log(userEmail.textContent)
    if (userEmail.textContent != '') {
        loginBtn.style.display = 'none'
        
        let xhr = new XMLHttpRequest()
        xhr.open('GET', '/LeoCris/ProcessAuthorization', true)
        xhr.setRequestHeader('Content-Type', 'application/json')
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
              let role = xhr.responseText
              if (role  == 'admin') {
                  management.style.display = 'block'
                  dashboard.style.display = 'block'
                  authorization.style.display = 'block'
                  order.style.display = 'block'
                  textInput.style.display = 'none'
              }
              else if (role == 'ctv'){
                  management.style.display = 'block'
                  dashboard.style.display = 'block'
                  order.style.display = 'block'
//                  textInput.style.display = 'none'
              }
              else if (role == 'user'){
                  textInput.style.display = 'block'
              }
            }
          };
        xhr.send()
    }
},200)
