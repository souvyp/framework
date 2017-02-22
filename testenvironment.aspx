<!DOCTYPE html>
<html>
	<head>
		<meta charset="{CHARSET}">
		<title></title>
		<script language="javascript" src="assets/js/jquery-1.11.1.min.js"></script>
		<script language="javascript" src="assets/js/sea.js" ></script>
		<script language="javascript" src="assets/NSF/js/NSF.0.0.4.min.js"></script>
	</head>
	<style>
		select{
			width: 100%;
			font-size: 35px;
		}
		iframe{
			width: 450px;
			height: 700px;
			float: left;
			scrolling:yes;
			margin: 0;
			padding: 0;
			margin: 10px 0 10px 0;
		}
		.links{
			float: left;
			height: 100px;
			width: 100%;
			font-size: 30px;
		}
		ul{
			padding-left: 0;
			margin: 0;
		}
		li{
			float:left;
			height: 50px;
			line-height: 50px;
			text-align: center;
			width:32.65%;
			list-style-type: none;
			border: 1px solid gainsboro;		
		}
		.phone{
			width: 450px;
			height: 830px;	
			margin: 0 auto;		
			border: 1px solid black;
			border-radius: 5px;
		}
		.todolist{
			visibility: hidden;
			width: 32.65%;
			float: left;
			border: 1px solid gainsboro;
			z-index: 2;
		}
		.todolist a{
			display: block;
			font-size: 27px;
			margin-left: 5px;
		}
		.myorders{
			visibility: hidden;
			width: 32.65%;
			float: left;
			border: 1px solid gainsboro;
			z-index: 2;
		}
		.myorders a{
			display: block;
			font-size: 27px;
			margin-left: 5px;
		}
		.personalcenter{
			visibility: hidden;
			width: 32.65%;
			float: left;
			border: 1px solid gainsboro;
			z-index: 2;
		}
		.personalcenter a{
			display: block;
			font-size: 27px;
			margin-left: 5px;
		}
	</style>
	<body onload="initia()">
		<div class="phone">
			
			<select onchange="initia()">
				<option value="123432433dsds">OpenID=123432433dsds</option>
				<option value="2">OpenID=2</option>
				<option value="3">OpenID=3</option>
			</select>
			
			<iframe name="telephone" src="poweron.html"></iframe>
			
			<div class="links">
				<ul>
					<li onclick="list1()">我的待办</li>
					<li onclick="list2()">我的订单</li>
					<li onclick="list3()">个人中心</li>
				</ul>
			</div>
			
			<div class="menu">
				<div class="todolist">
					<a href="Receiving.aspx" target="telephone">待接收订单</a>
					<a href="Pricing.aspx" target="telephone">待报价订单</a>
					<a href="Signing.aspx" target="telephone">待签收订单</a>
					<a href="Receipt.aspx" target="telephone">待回单订单</a>
					<a href="Balancing.aspx" target="telephone">待收费订单</a>
				</div>	
				<div class="myorders">
					<a href="Completed.aspx" target="telephone">已完成订单</a>
					<a href="Refused.aspx" target="telephone">已拒绝订单</a>
					<a href="Rejected.aspx" target="telephone">被拒绝订单</a>
				</div>
				<div class="personalcenter">
					<a href="Binding.aspx" target="telephone">绑定帐号</a>
					<a href="information.aspx" target="telephone">我的资料</a>
					<a href="Invited.aspx" target="telephone">客户邀请</a>
				</div>
			</div>
		</div>
	</body>
	<script>	
	function list1(){
		if($(".todolist").css("visibility")=="hidden"){
			var hre1 = $("option:checked").val();
			
			var todolist = $(".todolist");
			todolist.eq(0).css("visibility","visible");
			
			for(var i=0;i<todolist.eq(0).children().length;i++){
				todolist.eq(0).children();
				
				var hre2 = $(".todolist").children().eq(i).attr("href");
				var _index = hre2.indexOf("?");
				
				if(_index==-1){
					var _url = hre2+"?OpenID="+hre1;
					$(".todolist").children().eq(i).attr("href",_url);
				}else if(_index!=-1){
					var hre3 = hre2.substring(0,_index);
					var _url = hre3+"?OpenID="+hre1;
					$(".todolist").children().eq(i).attr("href",_url);
				}
			}
		}else if($(".todolist").css("visibility")=="visible"){
			var todolist = $(".todolist");
			todolist.eq(0).css("visibility","hidden");
		}
	}
	
	function list2(){
		if($(".myorders").css("visibility")=="hidden"){
			var hre1 = $("option:checked").val();
			
			var myorders = $(".myorders");
			myorders.eq(0).css("visibility","visible");
			
			for(var i=0;i<myorders.eq(0).children().length;i++){
				myorders.eq(0).children();
				
				var hre2 = $(".myorders").children().eq(i).attr("href");
				var _index = hre2.indexOf("?");
				
				if(_index==-1){
					var _url = hre2+"?OpenID="+hre1;
					$(".myorders").children().eq(i).attr("href",_url);
				}else if(_index!=-1){
					var hre3 = hre2.substring(0,_index);
					var _url = hre3+"?OpenID="+hre1;
					$(".myorders").children().eq(i).attr("href",_url);
				}
			}
		}else if($(".myorders").css("visibility")=="visible"){
			var todolist = $(".myorders");
			todolist.eq(0).css("visibility","hidden");
		}
	}
	
	function list3(){
		if($(".personalcenter").css("visibility")=="hidden"){
			var hre1 = $("option:checked").val();
			
			var personalcenter = $(".personalcenter");
			personalcenter.eq(0).css("visibility","visible");
			
			for(var i=0;i<personalcenter.eq(0).children().length;i++){
				personalcenter.eq(0).children();
				
				var hre2 = $(".personalcenter").children().eq(i).attr("href");
				var _index = hre2.indexOf("?");
				
				if(_index==-1){
					var _url = hre2+"?OpenID="+hre1;
					$(".personalcenter").children().eq(i).attr("href",_url);
				}else if(_index!=-1){
					var hre3 = hre2.substring(0,_index);
					var _url = hre3+"?OpenID="+hre1;
					$(".personalcenter").children().eq(i).attr("href",_url);
				}
			}
		}else if($(".personalcenter").css("visibility")=="visible"){
			var personalcenter = $(".personalcenter");
			personalcenter.eq(0).css("visibility","hidden");
		}
	}	
		
	function initia(){
		var todolist = $(".todolist");
		var myorders = $(".myorders");
		var personalcenter = $(".personalcenter");
		var hre1 = $("option:checked").val();
		for(var i=0;i<todolist.eq(0).children().length;i++){
			todolist.eq(0).children();
			
			var hre2 = $(".todolist").children().eq(i).attr("href");
			var _index = hre2.indexOf("?");
			
			if(_index==-1){
				var _url = hre2+"?OpenID="+hre1;
				$(".todolist").children().eq(i).attr("href",_url);
			}else if(_index!=-1){
				var hre3 = hre2.substring(0,_index);
				var _url = hre3+"?OpenID="+hre1;
				$(".todolist").children().eq(i).attr("href",_url);
			}
		}
		for(var i=0;i<myorders.eq(0).children().length;i++){
			myorders.eq(0).children();
			
			var hre2 = $(".myorders").children().eq(i).attr("href");
			var _index = hre2.indexOf("?");
			
			if(_index==-1){
				var _url = hre2+"?OpenID="+hre1;
				$(".myorders").children().eq(i).attr("href",_url);
			}else if(_index!=-1){
				var hre3 = hre2.substring(0,_index);
				var _url = hre3+"?OpenID="+hre1;
				$(".myorders").children().eq(i).attr("href",_url);
			}
		}
		for(var i=0;i<personalcenter.eq(0).children().length;i++){
			personalcenter.eq(0).children();
			
			var hre2 = $(".personalcenter").children().eq(i).attr("href");
			var _index = hre2.indexOf("?");
			
			if(_index==-1){
				var _url = hre2+"?OpenID="+hre1;
				$(".personalcenter").children().eq(i).attr("href",_url);
			}else if(_index!=-1){
				var hre3 = hre2.substring(0,_index);
				var _url = hre3+"?OpenID="+hre1;
				$(".personalcenter").children().eq(i).attr("href",_url);
			}
		}		
	}
	</script>
</html>
