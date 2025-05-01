function showHide(_myObj,_action) {
    var _myTableObj = document.getElementById((_myObj.parentNode.id).substring(0,(_myObj.parentNode.id).indexOf('_')));
    if (_action == 'show') {
        _myTableObj.style.display = 'block';
        _myObj.parentNode.innerHTML = '<a href="#" onclick="showHide(this,\'hide\');">Hide</a>';
    }
    if (_action == 'hide') {
        _myTableObj.style.display = 'none';
        _myObj.parentNode.innerHTML = '<a href="#" onclick="showHide(this,\'show\');">Show</a>';
    }
}