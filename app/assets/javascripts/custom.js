
document.addEventListener('turbolinks:load',() =>{
  const mobileBtn = document.getElementById('menu');
  const mobileNav = document.getElementById('mobile-nav');
  const mobileMenuExit = document.getElementById('close-menu');
  const menuSignUp = document.getElementById('menu-sign-up');
  const signUpExit = document.getElementById('close-menu-signup');
  const signUpNav = document.getElementById('mobile-nav-signup');
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

    const clientLoadInfoLinks = document.querySelectorAll('load-info');
  
    clientLoadInfoLinks.forEach((link)=> {
      link.addEventListener('click')
    })
    document.getElementById('p-info').click()    
})



document.addEventListener('turbolinks:load', function() {
    flatpickr('.date');
  })


  

  