<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache">
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
		<META HTTP-EQUIV="expires" CONTENT="0">
		<meta name="viewport" content="inital-scale=1.0,user-scalable=no;">
		<title>合单信息</title>
		<link href="css/a01-a0102.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/assets/js/jquery-1.11.1.min.js"></script>
		<script language="javascript" src="/assets/NSF/js/NSF.0.0.4.min.js"></script>
		<script language="javascript" src="/js/index.js"></script>

	</head>
	<style>
		a{
			text-decoration: none;
		}
		li {
			list-style-type: none;
		}
		
		.identifier {
			border-bottom-style: dashed;
		}
		
		.description {
			border-bottom: 0;
		}
		
		.information {
			border-bottom-style: dashed;
		}
		
		.accord {
			font-size: 10px;
			background-color: white;
			margin-top: 10px;
			width: 95%;
			margin: 0 auto;
		}
		
		.accord p {
			background-color: white;
		}
		
		.accord table {
			width: 100%;
			font-size: 35px;
		}
		
		.accord table input {
			width: 100%;
			height: 60px;
			border: 0;
			border-radius: 2px;
			color: white;
			font-family: "微软雅黑";
			font-weight: bold;
			font-size: 60px;
		}
		
		.tijiao {
			background-color: rgb(235, 102, 43);
			font-size: 45px !important;
			height: 100px !important;
			line-height: 100px;
		}
		
		body {
			margin: 0;
			padding: 0;
		}
		
		.deny {
			width: 70%;
			position: fixed;
			top: 30%;
			left: 7.5%;
			z-index: 10;
			border: 1px solid rgb(211, 211, 211);
			border-radius: 2px;
			box-shadow: 2px 2px 2px rgb(102, 102, 102);
			background-color: rgb(245, 245, 245);
			padding: 5%;
			display: none;
		}
		
		.deny p {
			height: 40px;
			width: 98.72%;
			line-height: 40px;
			font-size: 40px;
			background-color: rgb(245, 245, 245);
			border-bottom: 1px solid rgb(204, 204, 204);
			padding-bottom: 10px;
			margin-bottom: 20px;
			margin-top: 30px;
			color: #666;
		}
		
		.deny textarea {
			width: 98.24%;
			height: 100px;
			font-size: 20px;
			border: 1px solid rgb(211, 211, 211);
			border-radius: 2px;
			background-color: white;
			margin-bottom: 10px;
		}
		
		.deny input {
			width: 200px;
			height: 100px;
			font-size: 40px;
			background-color: rgb(16, 128, 194);
			border: 0;
			border-radius: 2px;
			color: white;
		}
		
		.btn2 {
			width: 100%;
			margin: 0 auto;
		}
		
		.recbtn {
			width: 46%;
			height: 100px;
			border-radius: 4px;
			background-color: rgb(235, 102, 43);
			border: 0;
			font-size: 45px;
			color: white;
			font-weight: bold;
			margin-left: 2%;
		}
		
		.comfbtn {
			width: 46%;
			height: 100px;
			background-color: rgb(102, 102, 102);
			border-radius: 4px;
			border: 0;
			font-size: 45px;
			color: white;
			font-weight: bold;
			margin-left: 3%;
		}
		
		.quxiao {
			width: 48% !important;
			margin: 20px 0 0 0;
			padding: 0;
			height: 20px;
			background-color: rgb(102, 102, 102) !important;
			float: left;
			border-radius: 4px;
		}
		
		.queren {
			width: 48% !important;
			float: right;
			height: 20px;
			margin: 20px 20px 0 0;
			padding: 0;
			background-color: rgb(235, 102, 43) !important;
			border-radius: 4px;
		}
	</style>

	<body code="orders">
		<div id="header">合单信息</div>
		<input type="hidden" id="OpenId" value="<%=GetUrlPara( " OpenId ", false )%>">
		<div id="main">

			<li class="order">
				<ul name="AllList">
					<div class="identifier">
						<table>
							<tr>
								<td class="titletd"><span>订单编号:</span></td>
								<td colspan="3" view-fld='{fld:"Code",method:"show"}'></td>
							</tr>
							<tr>
								<td class="titletd"><span>合同编号:</span></td>
								<td class="content1" view-fld='{fld:"PactCode",method:"show"}'></td>
								<td class="titletd"><span>下单时间:</span></td>
								<td class="content2" view-fld='{fld:"CreateTime",method:"show"}'> </td>
								<input style="display: none;" class="Operation" view-fld='{fld:"Operation",method:"show"}'> 
							</tr>
							<tr>
								 
							</tr>							
						</table>
					</div>
				</ul>
			</li>

			<li class="order_">
				<ul name="AllList_">
					<div class="defaultdiv">
						<!--详细信息-->
						<div class="information">
							<table>
								<tr>
									<td class="titletd"><span>发货方:</span></td>
									<td class="content1" view-fld='{fld:"CustomerCompanyName",method:"show"}'> </td>
									<td class="titletd"><span>收货方:</span></td>
									<td class="content2" view-fld='{fld:"endusername",method:"show"}'> </td>

								</tr>
								<tr>
									<td class="titletd"><span>提货时间:</span></td>
									<td class="content1" view-fld='{fld:"Fromtime",method:"show"}'> </td>
									<td class="titletd"><span>送货时间:</span></td>
									<td class="content2" view-fld='{fld:"Totime",method:"show"}'> </td>

								</tr>
								<tr>
									<td class="titletd"><span>发货地址:</span></td>
									<td colspan="3" view-fld='{fld:"from",method:"show"}'> </td>
								</tr>
								<tr>
									<td class="titletd"><span>收货地址:</span></td>
									<td colspan="3" view-fld='{fld:"to",method:"show"}'> </td>
								</tr>
								<tr>
									<td class="titletd"><span>总重量:</span></td>
									<td colspan="" view-fld='{fld:"weight",method:"show"}'> </td>
									<td class="titletd"><span>总体积:</span></td>
									<td colspan="" view-fld='{fld:"volume",method:"show"}'></td>
								</tr>
								<tr>
									<td class="titletd"><span>总数量:</span></td>
									<td view-fld='{fld:"amount",method:"show"}'> </td>
									<td class="titletd"><span>合计:</span></td>
									<td style="color:#eb662b ;" view-fld='{fld:"TotalCost",method:"show"}'></td>								
								</tr>
								<tr>
									<td colspan="4" style="text-align: center;">
										<a view-fld='{fld:"Code",method:"template",template:"<a class=\"jump_a\" href>立即查看</a><input type=\"hidden\" name=\"stuts\" value=\"@fromtime@\" /><input type=\"hidden\" name=\"toProvince_id1\" value=\"@toprovinceid@\" /><input type=\"hidden\" name=\"toCity_id1\" value=\"@tocityid@\" /><input type=\"hidden\" name=\"toDistrict_id1\" value=\"@todistrictid@\" />"}'>
										<!--<a class="jump_a" href="">立即查看</a>-->
									</td>
								</tr>								
							</table>
						</div>
					</div>
				</ul>
			</li>
		</div>
		</div>

		<!--订单详情-->

	</body>
	<script type="text/javascript">
		location.onload = getData();
		location.onload = get_Data();
		 
		function get_Data() {
			var _orderid = NSF.UrlVars.Get('id', location.href);
			var _AllList = new NSF.System.Data.Grid();
			$('ul[name="AllList"]').attr('view-id', '{ id:"Dtms_0016",cross:"false", rowIdentClass:"AllList", paras:[{"name":"id","value":' + _orderid + '}]}');
			_AllList.Initialize("/", "AllList", $("ul[name='AllList']").attr("view-id"), $("ul[name='AllList']"));
			 
		}
		function getData() {
			var _orderid = NSF.UrlVars.Get('id', location.href);
			var _AllList = new NSF.System.Data.Grid();
			$('ul[name="AllList_"]').attr('view-id', '{ id:"Dtms_0016",cross:"false", rowIdentClass:"AllList_", paras:[{"name":"id","value":' + _orderid + '},{"name":"rows","value":10},{"name":"page","value":1}]}');
			_AllList.Pagination("first-ds-pag", $("div[name='first-ds-pag']"), "page");
			_AllList.Initialize("/", "AllList_", $("ul[name='AllList_']").attr("view-id"), $("ul[name='AllList_']"));
		}

		function page(page) {
			var view = $('ul[name="AllList_"]').attr('view-id');
			view = NSF.System.Json.ToJson(view);
			for(var i = 0; i < view.paras.length; i++) {
				if(view.paras[i].name == 'page')
					view.paras[i].value = page;
			}
			view = NSF.System.Json.ToString(view)
			$('ul[name="AllList_"]').attr('view-id', view);
			getData();
		}
		
		function jump_over(){
			var _url = document.location.toString();　　　　
		   	var Eid = NSF.UrlVars.Get('id',_url); 
		   	var openid = NSF.UrlVars.Get('openid',_url); 
		   	var conbined = NSF.UrlVars.Get('conbined',_url); 			
			var Operation = $('.Operation').text();
			if(Operation == 1){ //已拒绝
				$('.jump_a').attr('href','http://driver.wlyuan.com.cn/pricingbyorder.aspx?openid='+ openid +'&id='+ Eid +'&conbined='+ conbined+'');	
			} else {
				$('.jump_a').attr('href','http://driver.wlyuan.com.cn/pricingbyorder.aspx?openid='+ openid +'&id='+ Eid +'&conbined='+ conbined+'');
			}
		}
		
		setTimeout('jump_over()',500);
	 
		
	</script>

</html>