    var tel = document.getElementById("tel");
    var email = document.getElementById("email");
    var uname = document.getElementById("uname");
    var age = document.getElementById("age");
    //校验姓名
    function check1() {
        var result;
        if (!(/[\u4e00-\u9fa5_a-zA-Z0-9_]{2,20}/.test(uname.value))) {
            document.getElementById("check1").innerHTML = "× 长度在2-20,不包含特殊字符";
            document.getElementById("uname").focus();
            document.getElementById("check1").style.color="Red";
            result = false;
        }
        else{
            document.getElementById("check1").innerHTML = "√";
            document.getElementById("check1").style.color="#48c625";
            result = true;
        }
        return result;
    }
    //校验电话号码
    function check2() {
        var result;
        if (!(/^1[3-9]\d{9}$/.test(tel.value))) {
            document.getElementById("check2").innerHTML = "× 电话号码格式错误";
            document.getElementById("tel").focus();
            document.getElementById("check2").style.color="Red";
            result = false;
        }
        else{
            document.getElementById("check2").innerHTML = "√";
            document.getElementById("check2").style.color="#48c625";
            result = true;
        }
        return result;
    }
    //校验邮箱
    function check3() {
        var result;
        if (!(/^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.(com|cn|net)$/.test(email.value))) {
            document.getElementById("check3").innerHTML = "× 邮箱格式错误";
            document.getElementById("email").focus();
            document.getElementById("check3").style.color="Red";
            result = false;
        }
        else{
            document.getElementById("check3").innerHTML = "√";
            document.getElementById("check3").style.color="#48c625";
            result = true;
        }
        return result;
    }
    //校验年龄
    function check4(){
        var result;
        if (!(/^(?:[1-9][0-9]?|1[01][0-9]|120)$/.test(age.value))) {
            document.getElementById("check4").innerHTML = "× 年龄必须在1-120之间";
            document.getElementById("age").focus();
            document.getElementById("check4").style.color="Red";
            result = false;
        }
        else{
            document.getElementById("check4").innerHTML = "√";
            document.getElementById("check4").style.color="#48c625";
            result = true;
        }
        return result;
    }
    var frm = document.querySelector('form');
    frm.onsubmit = function () {
        if(tel.value===''||uname.value===''||age.value===''||email.value===''){
            alert("信息不能为空！");
            return false;
        }
        else{
            if(check1()&&check2()&&check3()&&check4())
                return true;
            else{
                alert("信息存在错误！");
                return false;
            }
        }
}