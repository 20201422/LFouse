$(document).ready(function(){
    $("#My").click(function(){
        if(document.getElementById("MyCz")&&document.getElementById("MyZf")){
            $("#MyCz").remove();
            $("#MyZf").remove();
        }
        else
            $("#MyCzOrZf").append("<a href='' id='MyCz'>我的出租&nbsp;</a><a href='' id='MyZf'>&nbsp;我的租房</a>")
    });
    $("#My").mouseover(function (){
        if(!document.getElementById("MyCz")&&!document.getElementById("MyZf"))
            $("#MyCzOrZf").append("<a href='Lrx_ShowServlet' id='MyCz'>我的出租&nbsp;</a><a href='' id='MyZf'>&nbsp;我的租房</a>")
    });
    // $("#My").mouseout(function (){
    //     if()
    // });
});