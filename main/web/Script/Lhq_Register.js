var frm = document.querySelector('form');
frm.onsubmit = function () {
    var tel = document.getElementById("tel");
    var upwd = document.getElementById("upwd");
    var eupwd = document.getElementById("eupwd");
    var email = document.getElementById("email");
    var uname = document.getElementById("uname");
    var age = document.getElementById("age");
    //判空
    if(tel.value===''||upwd.value===''||eupwd.value===''||uname.value===''||age.value===''||email.value===''){
        alert("信息不能为空！");
        return false;
    }
    //不为空
    else {
        //校验电话号码
        if (!(/^1[3-9]\d{9}$/.test(tel.value))) {
            alert("格式错误！电话号码第一个必须为1，第二个必须为3-9");
            return false;
        }
        //校验姓名
        if (!(/[\u4e00-\u9fa5_a-zA-Z0-9_]{5,20}/.test(uname.value))) {
            alert("格式错误！姓名长度在5-20,不包含特殊字符");
            return false;
        }
        //校验邮箱
        if (!(/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.(com|cn|net)$/.test(email.value))) {
            alert("邮箱输入错误！");
            return false;
        }
        //校验密码
        if (!(/^(?=.*[A-Za-z])(?=.*\d)(?=.*\W)[A-Za-z\d\W]{8,16}$/.test(upwd.value))) {
            alert("密码格式错误！长度为8-16位，必须包含数字，字母，特殊字符");
            return false;
        }
        //密码确认
        if (upwd.value != eupwd.value) {
            alert("密码不一致！");
            return false;
        }
        //校验年龄
        if (!(/^(?:[1-9][0-9]?|1[01][0-9]|120)$/.test(age.value))) {
            alert("格式错误！年龄必须为1-120的整数");
            return false;
        }
    }
}