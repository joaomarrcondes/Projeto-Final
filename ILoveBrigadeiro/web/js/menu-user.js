const center = document.querySelector('.dropdowncenter');
const menu = document.querySelector('.dropdownmenu');

center.onclick=function(){
    center.classList.dropdowncenter('active');
    menu.classList.dropdowncenter('active');
}