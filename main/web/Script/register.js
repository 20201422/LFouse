var frm = document.querySelector('form');
frm.onsubmit = function () {
    var tel = document.getElementById("tel");
    var upwd = document.getElementById("upwd");
    var uname = document.getElementById("uname");
    var sex = document.getElementById("sex");
    var age = document.getElementById("age");
    if(tel.value==''||upwd.value==''||uname.value==''||sex.value==''||age.value==''){
        alert("信息不能为空！");
        return false;
    }
    //校验电话号码
    if(!(/^1[3-9]\d{9}$/.test(tel.value))){
        alert("电话号码第一个必须为1，第二个必须为3-9");
        return false;
    }
    //校验姓名
    if(!(/[\u4e00-\u9fa5_a-zA-Z0-9_]{5,20}/.test(uname.value))){
        alert("长度在5-20");
        return false;
    }
    //校验密码
    if(!(/^(?![0-9]+$)(?![a-zA-Z]+$)(?![0-9a-zA-Z]+$)(?![0-9\\W]+$)(?![a-zA-Z\\W]+$)[0-9A-Za-z\\W]{6,18}$/.test(upwd.value))){
        alert("密码格式错误！长度为8-16位，必须包含数字，字母，特殊字符");
        return false;
    }
    //校验年龄
    if(!(/^([1-9]|[1-9]\\d|100)$/.test(age.value))){
        alert("年龄必须为1-100的整数");
        return false;
    }
}