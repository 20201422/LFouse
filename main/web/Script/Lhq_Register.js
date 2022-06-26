
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
        document.getElementById("check1").innerHTML = "× 电话格式错误";
        document.getElementById("tel").focus();
        document.getElementById("check1").style.color="Red";
        result = false;
    } else {
        document.getElementById("check1").innerHTML = "√";
        document.getElementById("check1").style.color="Green";
        result = true;
    }
    return result;
}
//校验姓名
function check2() {
    var result;
    if (!(/[\u4e00-\u9fa5_a-zA-Z0-9_]{2,20}/.test(uname.value))) {
        document.getElementById("check2").innerHTML = "× 长度应在2-20,不包含特殊字符";
        document.getElementById("uname").focus();
        document.getElementById("check2").style.color="Red";
        result = false;
    } else {
        document.getElementById("check2").innerHTML = "√";
        document.getElementById("check2").style.color="Green";
        result = true;
    }
    return result;
}
//校验邮箱
function check3() {
    var result;
    if (!(/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.(com|cn|net)$/.test(email.value))) {
        document.getElementById("check3").innerHTML = "× 邮箱格式错误";
        document.getElementById("check3").style.color="Red";
        document.getElementById("email").focus();
        result = false;
    } else {
        document.getElementById("check3").innerHTML = "√";
        document.getElementById("check3").style.color="Green";
        result = true;
    }
    return result;
}
//校验密码
function check4() {
    var result;
    if (!(/^(?=.*[A-Za-z])(?=.*\d)(?=.*\W)[A-Za-z\d\W]{8,16}$/.test(upwd.value))) {
        document.getElementById("check4").innerHTML = "× 长度8-16,包含特殊字符,数字,字母";
        document.getElementById("upwd").focus();
        document.getElementById("check4").style.color="Red";
        result = false;
    } else {
        document.getElementById("check4").innerHTML = "√";
        document.getElementById("check4").style.color="Green";
        result = true;
    }
    return result;
}
//密码确认
function check5() {
    var result;
    if (upwd.value != eupwd.value) {
        document.getElementById("check5").innerHTML = "×,两次密码不一致";
        document.getElementById("eupwd").focus();
        document.getElementById("check5").style.color="Red";
        result = false;
    } else {
        document.getElementById("check5").innerHTML = "√";
        document.getElementById("check5").style.color="Green";
        result = true;
    }
    return result;
}
//校验年龄
function check6() {
    var result;
    if (!(/^(?:[1-9][0-9]?|1[01][0-9]|120)$/.test(age.value))) {
        document.getElementById("check6").innerHTML = "×,必须在1-120范围内";
        document.getElementById("age").focus();
        document.getElementById("check6").style.color="Red";
        result = false;
    } else {
        document.getElementById("check6").innerHTML = "√";
        document.getElementById("check6").style.color="#48c625";
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