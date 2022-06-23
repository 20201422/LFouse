var isShow=true;
function change(){
    var password=document.getElementById("password");//通过id获取密码框
    var eyes=document.getElementById("eyes");//通过id获取图片
    if (isShow) {//判断是否为显示ture为显示false为不显示
        password.type="text";
        isShow=false;
        eyes.src="Image/show.jpg";
    }else{
        password.type="password";
        isShow=true;
        eyes.src="Image/hide.jpg";
    }
}
