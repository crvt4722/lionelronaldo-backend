function includeHTML() {
    var z, i, elmnt, file, xhttp;
    /*loop through a collection of all HTML elements:*/
    z = document.getElementsByTagName("*");
    for (i = 0; i < z.length; i++) {
      elmnt = z[i];
      /*search for elements with a certain attribute:*/
      file = elmnt.getAttribute("w3-include-html");
      if (file) {
        /*make an HTTP request using the attribute value as the file name:*/
        xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4) {
            if (this.status == 200) {elmnt.innerHTML = this.responseText;}
            if (this.status == 404) {elmnt.innerHTML = "Page not found.";}
            /*remove the attribute, and call this function once more:*/
            elmnt.removeAttribute("w3-include-html");
            includeHTML();
          }
        }      
        xhttp.open("GET", file, true);
        xhttp.send();
        /*exit the function:*/
        return;
      }
    }
  };


function addModalJs(){
    const modal = document.querySelector('.modal')
    const modalLogin = document.querySelector('.modal.login')
    const modalSignup = document.querySelector('.modal.signup')

    const modalContainer = document.querySelector('.modal-container')
    const modalContainerLogin = document.querySelector('.modal-container__login')
    const modalContainerSignup = document.querySelector('.modal-container__signup')

    const modalClose = document.querySelector('.modal-close')
    const modalCloseLogin = document.querySelector('.modal-close__login')
    const modalCloseSignup = document.querySelector('.modal-close__signup')


    const loginBtn = document.querySelector('.login-btn')

    function showModal(modal){
        modal.classList.add('open')
    }

    function hideModal(modal){
        modal.classList.remove('open')
    }

    loginBtn.addEventListener('click', showModal.bind(this, modalLogin))
    modalCloseLogin.addEventListener('click', hideModal.bind(this, modalLogin))

    modalCloseSignup.addEventListener('click', hideModal.bind(this, modalSignup))

    modalClose.addEventListener('click', hideModal.bind(this, modal))


    modalSignup.addEventListener('click', hideModal.bind(this,modalSignup))
    modalLogin.addEventListener('click', hideModal.bind(this,modalLogin))
    modal.addEventListener('click', hideModal.bind(this,modal))


    modalContainer.addEventListener('click', (e) => e.stopPropagation())
    modalContainerLogin.addEventListener('click', (e) => e.stopPropagation())
    modalContainerSignup.addEventListener('click', (e) => e.stopPropagation())

    const loginLabels = document.querySelectorAll('.login-label')
    const signupLabels = document.querySelectorAll('.signup-label')

    function transfromToLogin(modalLogin, modalSignup){
        modalSignup.classList.remove('open')
        modalLogin.classList.add('open')
    }

    function transfromToSignup(modalLogin, modalSignup){
        modalSignup.classList.add('open')
        modalLogin.classList.remove('open')
    }

    for (let loginLabel of loginLabels){
        loginLabel.addEventListener('click', transfromToLogin.bind(this, modalLogin, modalSignup))
    }

    for(let signupLabel of signupLabels){
        signupLabel.addEventListener('click', transfromToSignup.bind(this, modalLogin, modalSignup))
    }
}