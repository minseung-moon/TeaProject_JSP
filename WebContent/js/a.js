(()=>{
    const header = document.querySelector('header');
    window.addEventListener("scroll", () => {
        if (window.scrollY > 0) {
          header.style.transform = "translate(0, 0px)";
        }
        if (window.scrollY == 0) {
          header.style.transform = "translate(0, 40px)";
        }
      });

    const brand = document.querySelectorAll('.brand');
    brand.forEach(popup => popup.addEventListener('click',()=>{
      popup.classList.toggle('active')
    }))
    const menu = document.querySelector('.menu');
    const bar = document.querySelector('.fas.fa-bars');
    const xmark = document.querySelector('.fas.fa-plus');
    bar.addEventListener('click',()=>{
      menu.classList.add('active');
    })
    xmark.addEventListener('click',()=>{
      menu.classList.remove('active');
    })
    
    const toRegister = document.querySelector('#toRegister');
    const toLogin = document.querySelector('#toLogin');
    toRegister.addEventListener('click',()=>{
    	toRegister.style.transform="rotateY(180deg)";
    	toLogin.style.transform="rotateY(0deg)";
    });
    toLogin.addEventListener('click',()=>{
    	toLogin.style.transform="rotateY(180deg)";
    	toRegister.style.transform="rotateY(0deg)";
    });
    
})()