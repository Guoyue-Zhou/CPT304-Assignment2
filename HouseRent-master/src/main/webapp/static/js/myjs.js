var form1=document.querySelector("#form1");
var form2=document.querySelector("#form2")
var form3=document.querySelector("#form3");
var text=document.querySelector("#text")
var btn=document.querySelector("#btn")

// var provinces="";
// var cities="";
// var areas="";
function linkage(form1,form2,form3,text,btn,data){
	for(var i=0;i<data.country.length;i++){
		var opc=document.createElement("option");
		opc.innerHTML=data.country[i].title;
		opc.value=data.country[i].name;
		form1.appendChild(opc);	
	}
	
	form1.onchange=function(){
		
		form2.innerHTML=" <option>city</option>"
	
		
		for(var j=0;j<data.cities[this.value].length;j++){
			var opc1=document.createElement("option");
			opc1.innerHTML=data.cities[this.value][j].title;
			opc1.value=data.cities[this.value][j].name;
			
			
			form2.appendChild(opc1)
			
			for(var k=0;k<data.holiday[opc1.value].length;k++){
				var opc2=document.createElement("option");
				opc2.innerHTML=data.holiday[opc1.value][k].title;
				opc2.value=data.holiday[opc1.value][k].name;
				form3.appendChild(opc2)
			}
			
	
		}

		

	}
	
	form2.onchange=function(){
		form3.innerHTML=" <option>holiday</option>";
		for(var a=0;a<data.holiday[this.value].length;a++){
			var opc3=document.createElement("option");
			opc3.innerHTML=data.holiday[this.value][a].title;
			opc3.value=data.holiday[this.value][a].name;
			form3.appendChild(opc3)
		}
	}
	
	btn.onclick=function(){
		var obj={};
		console.log(form1.options[form1.selectedIndex].text)
		obj.country={
			name:form1.options[form1.selectedIndex].value,
			title:form1.options[form1.selectedIndex].text,
		};
		obj.cities={
			name:form2.options[form2.selectedIndex].value,
			title:form2.options[form2.selectedIndex].text,
		};
		obj.holiday={
			name:form3.options[form3.selectedIndex].value,
			title:form3.options[form3.selectedIndex].text,
		};
		obj.detail={
			name:"detail",
			title:text.value
		}









console.log(obj)














    }
	
}

linkage(form1,form2,form3,text,btn,data);



layui.use(['element', 'carousel','layer','form'], function () {
    var element = layui.element,
        carousel = layui.carousel,
        $ = layui.jquery,
        layer = layui.layer,
        form = layui.form;

    var layer_index;
    carousel.render({
        elem:"#bg-item",
        width:"100%",
        height:"600px",
        anim:"fade"
    });
    $('.operation').click(function () {
        layer_index = layer.open({
            type:1,
            content:$('#sign'),
            area:['360px','460px'],
            title:"房屋租赁",
            closeBtn:2
        });
    });
    $('.list-item li').click(function () {
        $('.list-item li').removeClass('click-this');
        $(this).addClass('click-this');
    });

    $('.regist-btn').click(function () {
        if($("input[name='uName']").val()!=""&&$("input[name='uPassword']").val()!=""&&$("input[name='uPhoneNumber']").val()!=""&&$("input[name='uNickName']").val()!=""){
            $.post("regist",$('.form').serialize(),function (res) {
                console.log(res)
                if(res=='OK'){
                    layer.close(layer_index);
                    layer.alert("注册成功",{icon:1,time:2000});
                    $('.form')[0].reset();
                }else{
                    layer.msg("注册失败,用户名以存在");
                }
            })
        }else{
            layer.msg("请填写所有表单");
        }
    });

    form.on("submit(login)",function(){
        $.post("login",$('#login').serialize(),function (res) {
            if(res=="OK"){
                // window.location.href="toIndexPage";
                window.location.href="toIndexPage";
            }else{
                layer.msg("用户名或者密码错误");
            }
        });
        return false;
    });


    //监听提交
    form.on("submit(formD)",function(){
        $.post("getWeather",$('#ch').serialize(),function (res) {
            if(res!=null){
                layer.msg(res.val());
                // window.location.href="toIndexPage";
                window.location.href="toIndexPage";
            }else{
                layer.msg("用户名或者密码错误");
            }
        });
        return false;
    });

});






