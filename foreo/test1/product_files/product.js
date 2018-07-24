// 与苹果连接
var name=document.getElementById('name');
//发送请求
function sendRequest(input){
    $.ajax({
    type:"GET",
    headers: {
        Accept: "application/json; charset=utf-8",
        token: input.token
        //"c4340b61e38e4beeb2c834459ecbfed6"；input.token
    },
    async:true,
    url:"/h5/getuserDevicesByPhone?token="+input.token,
    //"Zhcxw74brvR9fz"
    success:function(data){
        if(data.code==="00" && data.returnData.UserRegisteredUFO){
            var html="";
            $.each(data.returnData.UserRegisteredUFO,function(i,p){
                var date = new Date(p.createTime);
                var M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '/';
                var Y = date.getFullYear() + "";
                var D = date.getDate() + '/';
                var stamp = D + M + Y;
                // var number=p.emailorPhone;
                // var showNumber=number.substr(0,5)+"****"+number.substr(9);
                //background:url(${p.image_background});
               html+=
               `<div style="background:url(${p.image_background});background-size:100% 100%;margin-top:0%;padding: 3%;position:relative;">
                 <div style="float: left;display:inline-block'">
                   <img src="${p.image_devicename}" style="float: left;margin-left:1rem;margin-top:3.3%;width: 44%;">
                   <ul>
                     <li>注册时间<br><span>${stamp}</span></li>
                     <li>注册手机号<br><span>${p.emailorPhone}</span></li>
                   </ul>
                   <div class="clearfix"></div>
                </div>
                 <img src="${p.image_device}" style="float: right;width: 35%;position:absolute;right:5%;top:5%;">
                 <div class="clearfix"></div>
             </div>
             `;
            //alert(p.image_background.naturalWidth+""+p.image_background.naturalHeight);
            })
            $('#add').html(html);
            if(deviceChecker.isApple()){
                connectWebViewJavascriptBridge(function(bridge){
                    bridge.send({"hasData":"yes"},function(responseCallback)
                    {
                    })
                })
            }
        }else{
            if(deviceChecker.isAndroid()){
                window.SysClientJs.registerNewDevice("0");//安卓直接跳转注册新仪器
            }else if(deviceChecker.isApple()){
                connectWebViewJavascriptBridge(function(bridge){
                    bridge.send({"hasData":"no"},function(responseCallback)
                    {
                    })
                    bridge.send({"jump":"sss"},function(responseCallback)
                    {
                    })
               })
            } 
            else{
                alert("not apple or android");
            }
        }
    },
    error:function(xhr){
        alert("服务器异常");
      }
    })
}
function getJson(json){
    var data=$.parseJSON(json);
    var token=data.token;
    var sn=data.sn;
    //把token传过去header里面
    sendRequest(data);
   // alert("sn:"+data.sn+""+"token:"+data.token+""+"phone:"+data.phone);
}
function connectWebViewJavascriptBridge(callback) {
    if (window.WebViewJavascriptBridge) {
        callback(WebViewJavascriptBridge)
    } else {
        document.addEventListener('WebViewJavascriptBridgeReady', function () {
            callback(WebViewJavascriptBridge)
        }, false)
    }
}
alert("ready");
if (deviceChecker.isAndroid()) {
    alert("android");
    window.SysClientJs.getTitle('{"getTitle":"仪器注册记录","isback":"true"}');
    window.SysClientJs.getUFORegisiter('getJson');
} else if (deviceChecker.isApple()) {
    alert("进来");
    connectWebViewJavascriptBridge(function (bridge) {
        //初始化bridge
        bridge.init(function (message, responseCallback) { })
        connectWebViewJavascriptBridge(function (bridge) {
            bridge.send({"functionName":"getuserData"}, function (response) {
            })
        });
    })
    window['getUFORegisiter'] = (data) => {
        var dt = JSON.parse(data);
        var token = dt.token;
        var sn = dt.sn;
        var phone = dt.phone;
        // $('#name').text(dt.userName);
        // if (dt.isFirstConnect === false) {
        //     $("#small").css('display', 'none');
        // }
        alert("有交互");
        sendRequest(dt);
    }
}else{

    alert("not apple or andriod");
}


// 点击注册新仪器
 document.getElementById('next').onclick=function(){
        if (deviceChecker.isAndroid()){
            window.SysClientJs.registerNewDevice("1");//安卓注册新仪器
         }else if(deviceChecker.isApple()){
            connectWebViewJavascriptBridge(function(bridge){
                bridge.send({"registerNewDevice":"yes"},function(responseCallback)
                {
                })
            })
        } 
        else{
            alert("not apple or android");
        }
}


