<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/static/layui/css/layui.css"/>
    <title>房屋租赁网</title>
    <link rel="stylesheet" href="/static/css/global.css">
    <script src="/static/layui/layui.js"></script>

    <link rel="stylesheet" type="text/css" href="/static/css/mycss.css">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>天气预报查询</title>
    <link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />
</head>

<style type="text/css">
    html,body,#container{
        height:100%;
    }
    .weather{
        width:5rem;
        display:inline-block;
        padding-left:0.5rem;
    }
    .sharp{
        height: 1rem;
        width: 1rem;
        background-color: white;
        transform: rotateZ(45deg);
        box-shadow: 2px 2px 3px rgba(114, 124, 245, .5);
        position: inherit;
        margin-left: 10.5rem;
        margin-top: -6px;
    }
</style>
<body  >

<div class="layui-carousel" id="bg-item">
    <div class="layui-header title">
        <div class="layui-container">
            <div class="layui-logo layui-pull-left">
                <img src="/static/img/logo.png" width="240px">
            </div>
            <c:if test="${not empty loginUser }">
	            <div class="personalCenter layui-pull-right"><a href="toUserSystem" target="_blank" style="color:#fff"><i class="layui-icon layui-icon-tree"></i>个人中心</a></div>
            </c:if>
            <c:if test="${empty loginUser }">
                <div class="personalCenter layui-pull-right"><a href="toAdminLogin" target="_blank" style="color:#fff"><i class="layui-icon layui-icon-tree"></i>管理员</a></div>
            </c:if>
            <c:if test="${empty loginUser }">
                <div class="operation layui-pull-right"><i class="layui-icon layui-icon-tree"></i>您好</div>
            </c:if>

        </div>
    </div>
    <!--搜索框-->
    <div class="layui-container">
        <div class="seach-input">
           	<form class="seach-form layui-form" method="post" action="findHouseByLike">
	           <div class="layui-pull-left input">
	                <input type="text" placeholder="Please input the characteristics, type and district name of the house..." name="keywords" class="seach layui-input"  lay-verify="">
	           </div>
	           <div class="layui-pull-left button">
	               <button class="btn seach-btn" lay-submit><i class="layui-icon layui-icon-search" style="font-size: 24px;"></i></button>
	           </div>
           	</form>
        </div>
    </div>
    <div carousel-item>
        <div style="background: url('/static/img/banner2.jpg')no-repeat center/cover"></div>
        <div style="background: url('/static/img/banner1.jpg')no-repeat center/cover"></div>
        <div style="background: url('/static/img/banner3.jpg')no-repeat center/cover"></div>
        <div style="background: url('/static/img/banner4.jpg')no-repeat center/cover"></div>
    </div>
</div>

<div class="layui-container">
    <div class="layui-tab layui-tab-brief" id="sign" lay-filter="" style="display: none;">
        <ul class="layui-tab-title">
            <li class="layui-this">登录</li>
            <li>注册</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <div class="" style="margin: 40px 20px;">
                    <form class="layui-form layui-form-pane" id="login">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" name="username" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <br>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="password" name="password" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <br>
                        <div class="layui-form-item">
                            <button class="layui-btn layui-btn-fluid layui-btn-normal layui-btn-radius" lay-submit lay-filter="login">立即登录</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="layui-tab-item">
                <div class="" style="margin: 30px 20px;">
                    <form class="layui-form layui-form-pane form">
                        <div class="layui-form-item">
                            <label class="layui-form-label">用户名</label>
                            <div class="layui-input-block">
                                <input type="text" name="uName" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">密码</label>
                            <div class="layui-input-block">
                                <input type="text" name="uPassword" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">手机号</label>
                            <div class="layui-input-block">
                                <input type="text" name="uPhoneNumber" required  lay-verify="required" placeholder="注册后不能修改" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">昵称</label>
                            <div class="layui-input-block">
                                <input type="text" name="uNickName" required  lay-verify="required" placeholder="注册后不能修改" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                    </form>
                    <div class="layui-form-item">
                        <input type="submit" class="layui-btn layui-btn-fluid layui-btn-radius layui-btn-normal regist-btn" value="立即注册" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<div id="box" >
<form id="ch">
    <img src="/static/img/sf.png" >
    <select class="layui-form-label" id="form1" >
        <option>choose country</option>

    </select>
    <img src="/static/img/cs.png" >
    <select class="layui-form-label" name="citycode" id="form2">
        <option>choose city</option>

    </select>
    <img src="/static/img/qy.png" >
    <select class="layui-form-label" id="form3">
        <option>choose holiday</option>

    </select>


    <button type="button"  lay-submit lay-filter="formD" class="layui-btn layui-btn-normal" id="btn">submit</button>
</form>
</div>
<div class="layui-container">
    <span id="tianqi"></span>
</div>


<table id="allWeather" lay-filter="user"></table>
<!--内容开始-->
<div class="list_control_bar layui-container" style="padding: 0">
    <div>

        <div class="list_title layui-pull-left"><span>All houses</span></div>

        <div class="list_more">
            <ul class="layui-pull-right list-item">
                <li class="click-this"><a href="toIndexPage">Default sort</a></li>
                <li><a href="findHousrOrderByAsc">ascending</a></li>
                <li><a href="findHousrOrderByDesc">descending</a></li>
            </ul>
        </div>
    </div>
</div>

<section class="layui-container">
    <hr>
    <h2>find<span style="color: #ffc601;margin: 0 5px;">${House.size()}</span>house information</h2>
    <div class="house-detail">
        <ul>
        	<c:forEach items="${House }" var="h">
	            <li>
	                <a href="toDetailsPage?id=${h.hID }" class="show-image">
	                    <img src="${h.houseImage }" width="240px" height="180px">
	                </a>
	                <div class="show-details">
	                    <p class="house-title">
	                        <a href="toDetailsPage?id=${h.hID }">${h.houseDesc }</a>
	                    </p>
	                    <p class="house-about">
	                        <span class="layui-icon layui-icon-home"></span>
	                        <span>${h.houseModel}</span>
	                        <span class="flag-line">|</span>
	                        <span>${h.houseArea } m<sup>2</sup></span>
	                        <span class="flag-line">|</span>
	                        <span>Ordinary decoration</span>
	                        <span class="flag-line">|</span>
	                        <span>${h.houseFloor }</span>
	                        <span class="flag-line">|</span>
	                        <span>${h.houseType }</span>
                            <span>${h.city}</span>
	                    </p>
	                    <p class="house-address clearfix">
	                        <span class="layui-icon layui-icon-location"></span>
	                        <span class="whole-line">
			    		        <span>${h.houseAddress}</span>
					        </span>
	                    </p>
	                    <div class="show-price">
	                        <span class="sale-price">${h.housePrice}</span>
	                        <span class="sale-unit">yuan/month</span>
	                    </div>
	                </div>
	            </li>
        	</c:forEach>
        </ul>
    </div>
</section>
<footer>

</footer>


<script>
    layui.use(['element', 'carousel','layer','form','table'], function () {
        var element = layui.element,
            carousel = layui.carousel,
            $ = layui.jquery,
            layer = layui.layer,
            form = layui.form;
        table = layui.table;


        
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


        //监听提交,
        form.on("submit(formDemo)",function(){
            $.post("getWeather",$('#ci').serialize(),function (res) {
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

        form.on("submit(formD)",function(){
            $.post("getWeather",$('#ch').serialize(),function (res) {
                if(res!=null){

                    var dt = table.render({
                        elem:"#allWeather",
                        url:"/getWeather",
                        where:  {citycode:$('#ch').serialize()},
                        page:true,
                        parseData:function(res){
                        console.log(res);
                        return {"code":0,
                             "msg":"",
                           "count":1000 ,
                            data:res,
                    }},
                        cols:[[
                            {field: 'xuhao', title: 'Serial number', align: 'center'},
                            {field: 'cityName', title: 'City', align: 'center'},
                            {field: 'date', title: 'date', align: 'center'},
                            {field: 'wea', title: 'weather', align: 'center'},
                            {field: 'tem', title: 'temperature', align: 'center'},
                            {field: 'win', title: 'wind direction', align: 'center'},
                            {field: 'win_speed', title: 'wind speed', align: 'center'},
                            {title: 'operation', align: 'operation',toolbar:"#tools"}
                        ]]
                    });

                    table.on('tool(user)',function(obj){
                        var data = obj.data;
                        var layEvent = obj.event;
                        var tr = obj.tr;
                        var currPage = dt.config.page.curr;

                        if(layEvent ==="edit"){
                            window.location.href="findHouseByLike?citycode="+$('#ch').serialize();
                        }

                            });
                    var result=JSON.stringify(res.res)
                    var r=$.parseJSON(result)
                    alert(r.val())
                    var divA = document.getElementById("tianqi");

                    divA.innerHTML = res.toString();

                    // window.location.href="toIndexPage";
                    window.location.href="toIndexPage";
                }else{
                    layer.msg("用户名或者密码错误");
                }
            });
            return false;
        });




    });






</script>


<script src="/static/js/data.js" type="text/javascript" charset="utf-8"></script>
<script src="/static/js/myjs.js" type="text/javascript" charset="utf-8"></script>
<script type="text/html" id="tools">
    <a class="layui-btn layui-btn-sm" lay-event="edit">Query rental information</a>

</script>

</body>
</html>
