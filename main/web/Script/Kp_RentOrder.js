function totalprice(h_price){//月份输入框合法判断及计算总价

    var limit=document.getElementById("lodge_limit").value//获取月份

    var zzbds=/^[1-9]\d*$/

    if(!zzbds.test(limit))//月份不合法
        document.getElementById("lodge_limit").value=1//改变为1
    else{//月份合法
        var totalprice=limit*h_price//计算总价

        document.getElementById("totalprice").innerText = totalprice;//传值
        document.getElementById("lodge_price").value = totalprice;//传值
    }

}
function queding(orderway,lodgecount){//确认订单并判断单选框

    var list=parseInt(lodgecount)
    var maxcount=3

    if(list===maxcount){//我的租房已到两套，则不可再租
        alert("一个用户同时最多仅可以拥有三套在租房屋哦！")
    }
    else{
        var lodge_pway = document.getElementsByName('lodge_pway')//得到支付方式

        var totalprice=document.getElementById("totalprice").innerText//总价
        var limit=document.getElementById("lodge_limit").value//月数
        if(lodge_pway[0].checked){//全款

            if(orderway==="1"){//创建
                var qr=confirm("订单合计"+totalprice+"RMB，共计"+limit+"个月，暂时不支持退费哦！");
                if(qr){
                    document.getElementById("orderway").value = orderway;//传值
                    document.getElementById("queding").submit();
                }
            }
            else if(orderway==="2"){//续租
                var qr=confirm("续租订单合计"+totalprice+"RMB，续租"+limit+"个月，暂时不支持退费哦！");
                if(qr){
                    document.getElementById("orderway").value = orderway;//传值
                    document.getElementById("queding").submit();
                }
            }

        }
        else if(lodge_pway[1].checked){//分期

            if(orderway==="1"){//创建
                var qr=confirm("订单合计"+totalprice+"RMB，共计"+limit+"个月，分"+limit+"期扣费，在每月的15号扣费，请确保账户余额充足，以免扣费失败。暂时不支持退费哦！！！");
                if(qr){
                    document.getElementById("orderway").value = orderway;//传值
                    document.getElementById("queding").submit();
                }
            }
            else if(orderway==="2"){//续租
                var qr=confirm("续租订单合计"+totalprice+"RMB，续租"+limit+"个月，分"+limit+"期扣费，在每月的15号扣费，请确保账户余额充足，以免扣费失败。暂时不支持退费哦！！！");
                if(qr){
                    document.getElementById("orderway").value = orderway;//传值
                    document.getElementById("queding").submit();
                }
            }

        }
        else{
            alert("请选择支付方式！")
        }
    }

}