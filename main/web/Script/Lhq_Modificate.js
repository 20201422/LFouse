
    var check = document.getElementById("check");
    var upwd = document.getElementById("upwd");
    var newupwd = document.getElementById("newupwd");
    var enewupwd = document.getElementById("enewupwd");
    //校验旧密码
    function check1() {
        var result;
        if (check.value != upwd.value) {
            document.getElementById("check1").innerHTML = "× 旧密码输入错误";
            document.getElementById("upwd").focus();
            document.getElementById("check1").style.color="Red";
            result = false;
        }
        else{
            document.getElementById("check1").innerHTML = "";
            result = true;
        }
        return result;
    }
    //校验密码
    function check2() {
        var result;
        if (!(/^(?=.*[A-Za-z])(?=.*\d)(?=.*\W)[A-Za-z\d\W]{8,16}$/.test(newupwd.value))) {
            document.getElementById("check2").innerHTML = "× 长度为8-16位,必须包含数字,字母,特殊字符";
            document.getElementById("newupwd").focus();
            document.getElementById("check2").style.color="Red";
            result = false;
        }
        else{
            document.getElementById("check2").innerHTML = "";
            result = true;
        }
        return result;
    }
    //密码确认
    function check3(){
        var result;
        if (newupwd.value != enewupwd.value) {
            document.getElementById("check3").innerHTML = "× 两次密码不一致";
            document.getElementById("enewupwd").focus();
            document.getElementById("check3").style.color="Red";
            result = false;
        }
        else{
            document.getElementById("check3").innerHTML = "";
            result = true;
        }
        return result;
    }
    var frm = document.querySelector('form');
    frm.onsubmit = function () {
        if(upwd.value===''||newupwd.value===''||enewupwd.value===''){
            alert("信息不能为空！");
            return false;
        }
        else{
            if(check1()&&check2()&&check3())
                return true;
            else{
                alert("信息存在错误！");
                return false;
            }
        }
    }