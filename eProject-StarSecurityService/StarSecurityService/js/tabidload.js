function setActiveMenu() {
    var control = document.getElementById('tabid');
    var menuid = control.innerText;

    var menu = document.getElementById(menuid);
    menu.className = 'active';
}
window.onload = setActiveMenu;