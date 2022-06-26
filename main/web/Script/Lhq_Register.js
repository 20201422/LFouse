
var tel = document.getElementById("tel");
var upwd = document.getElementById("upwd");
var eupwd = document.getElementById("eupwd");
var email = document.getElementById("email");
var uname = document.getElementById("uname");
var age = document.getElementById("age");

//校验电话号码
function check1() {
    var result;
    if (!(/^1[3-9]\d{9}$/.test(tel.value))) {
        document.getElementById("check1").innerHTML = "×";
        document.getElementById("tel").focus();
        result = false;
    } else {
        document.getElementById("check1").innerHTML = "√";
        result = true;
    }
    return result;
}
//校验姓名
function check2() {
    var result;
    if (!(/[\u4e00-\u9fa5_a-zA-Z0-9_]{2,20}/.test(uname.value))) {
        document.getElementById("check2").innerHTML = "×";
        document.getElementById("uname").focus();
        result = false;
    } else {
        document.getElementById("check2").innerHTML = "√";
        result = true;
    }
    return result;
}
//校验邮箱
function check3() {
    var result;
    if (!(/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.(com|cn|net)$/.test(email.value))) {
        document.getElementById("check3").innerHTML = "×";
        document.getElementById("email").focus();
        result = false;
    } else {
        document.getElementById("check3").innerHTML = "√";
        result = true;
    }
    return result;
}
//校验密码
function check4() {
    var result;
    if (!(/^(?=.*[A-Za-z])(?=.*\d)(?=.*\W)[A-Za-z\d\W]{8,16}$/.test(upwd.value))) {
        document.getElementById("check4").innerHTML = "×";
        document.getElementById("upwd").focus();
        result = false;
    } else {
        document.getElementById("check4").innerHTML = "√";
        result = true;
    }
    return result;
}
//密码确认
function check5() {
    var result;
    if (upwd.value != eupwd.value) {
        document.getElementById("check5").innerHTML = "×";
        document.getElementById("eupwd").focus();
        result = false;
    } else {
        document.getElementById("check5").innerHTML = "√";
        result = true;
    }
    return result;
}
//校验年龄
function check6() {
    var result;
    if (!(/^(?:[1-9][0-9]?|1[01][0-9]|120)$/.test(age.value))) {
        document.getElementById("check6").innerHTML = "×";
        document.getElementById("age").focus();
        result = false;
    } else {
        document.getElementById("check6").innerHTML = "√";
        result = true;
    }
    return result;
}
var frm = document.querySelector('form');
frm.onsubmit = function () {
    if(tel.value===''||upwd.value===''||eupwd.value===''||uname.value===''||age.value===''||email.value===''){
        alert("信息不能为空！");
        return false;
    }
    else{
        if(check1()&&check2()&&check3()&&check4()&&check5()&&check6()) {
            return true;
        }
        else{
            alert("信息存在错误！");
            return false;
        }
    }
}