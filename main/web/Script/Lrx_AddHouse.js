var frm=document.querySelector('form')
var location =document.getElementById("h_location");
function JudgeLocation(){
    frm.onsubmit=function () {
        var city=location.slice(2);
        if(city!='上海'&&city!='包头'&&city!='南昌')
            return false;
        return true;
    }
}