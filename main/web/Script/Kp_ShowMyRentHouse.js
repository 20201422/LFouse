function quxiao(h_id){

    document.getElementById("h_id").value=h_id;

    var qr=confirm("确定要取消租房吗？（不退费）");
    if(qr){
        document.getElementById("quxiao").submit();
    }

}