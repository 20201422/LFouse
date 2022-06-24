var frm = document.querySelector('form');
frm.onsubmit = function () {
    var check = document.getElementById("check");
    var upwd = document.getElementById("upwd");
    var newupwd = document.getElementById("newupwd");
    var enewupwd = document.getElementById("enewupwd");
    //判空
    if(upwd.value===''||newupwd.value===''||enewupwd.value===''){
        alert("信息不能为空！");
        return false;
    }
    //不为空
    else {
        //校验旧密码
        if (check.value != upwd.value) {
            alert("旧密码输入错误！");
            return false;
        }
        //校验密码
        if (!(/^(?=.*[A-Za-z])(?=.*\d)(?=.*\W)[A-Za-z\d\W]{8,16}$/.test(newupwd.value))) {
            alert("密码格式错误！长度为8-16位，必须包含数字，字母，特殊字符");
            return false;
        }
        //密码确认
        if (newupwd.value != enewupwd.value) {
            alert("密码不一致！");
            return false;
        }
    }
}