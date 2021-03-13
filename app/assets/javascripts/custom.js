
document.addEventListener('turbolinks:load',() =>{
  const mobileBtn = document.getElementById('menu');
  const mobileNav = document.getElementById('mobile-nav');
  const mobileMenuExit = document.getElementById('close-menu');
  const menuSignUp = document.getElementById('menu-sign-up');
  const signUpExit = document.getElementById('close-menu-signup');
  const signUpNav = document.getElementById('mobile-nav-signup');
  const clientDisplay = document.getElementById('client-display');
  const loanDisplay = document.getElementById('loan-display');
  const clientInfoBtn = document.getElementById('p-info');
  const loanInfoBtn = document.getElementById('l-info');
  
 
    if (mobileBtn){
      mobileBtn.addEventListener('click', ()=> {
        mobileNav.classList.remove('mobile-menu')
      })
    }
    if (mobileMenuExit){
      mobileMenuExit.addEventListener('click', ()=> {
        mobileNav.classList.add('mobile-menu')
      })
    }
    if (menuSignUp) {
      menuSignUp.addEventListener('click', ()=> {
        signUpNav.classList.remove('mobile-menu')
      })
    }
    if (signUpExit) {
      signUpNav.classList.add('mobile-menu')
    }

    if (clientInfoBtn) {
      clientInfoBtn.addEventListener('click', () => {
        loanDisplay.classList.add('toggle-display')
        clientDisplay.classList.remove('toggle-display')
      })
    }

    if (loanInfoBtn) {
      loanInfoBtn.addEventListener('click', ()=> {
        loanDisplay.classList.remove('toggle-display')
        clientDisplay.classList.add('toggle-display')
      })
    }

    clientInfoBtn.click();
    
})



document.addEventListener('turbolinks:load', function() {
    flatpickr('.date');
  })


  

  