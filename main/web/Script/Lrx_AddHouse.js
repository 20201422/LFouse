var frm=document.querySelector('form')
frm.onsubmit = function(){
        var location =document.getElementById("h_location").value;
        var city=location.slice(0,2);
        var name=document.getElementById("h_name").value;
        var layout=document.getElementById("h_layout").value;
        var area=document.getElementById("h_area").value;
        var floor=document.getElementById("h_floor").value;
        var traffic=document.getElementById("h_traffic").value;
        var price=document.getElementById("h_price").value;
        var photo=document.getElementById("file").value;
        if (location==''||name==''||layout==''||area==''||floor==''||traffic==''||price==''||photo==''){
                alert("提交失败！信息不能为空")
                return false;
        }
        if(city!='上海'&&city!='包头'&&city!='南昌'){
            alert("提交失败！所选区域不在服务区")
            return false;
        }
        alert("提交成功");
        return true;
}