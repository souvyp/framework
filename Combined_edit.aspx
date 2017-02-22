<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<META HTTP-EQUIV="expires" CONTENT="0">
		<meta name="viewport" content="inital-scale=1.0,user-scalable=no;">		
		<title>合单详情</title>
		<link href="css/a01-a0102.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/assets/js/jquery-1.11.1.min.js"></script>
		<script language="javascript" src="/js/index.js" ></script>
		<script language="javascript" src="/assets/js/sea.js" ></script>
	</head>
	<style>
		.identifier{
			border-bottom-style: dashed;
		}
		.description{
			border-bottom: 0;
		}
		.information{
			border-bottom-style: dashed;
		}
		.accord{
			font-size: 10px;
			background-color: white;
			margin-top: 10px;
			width: 95%;
			margin: 0 auto;
		}
		.accord p{
			background-color: white;
		}
		.accord table{
			width: 100%;
			font-size: 35px;
		}
		.accord table input{
			width:100%;
			height:60px;
			border:0;
			border-radius: 2px;
			color:white;
			font-family: "微软雅黑";
			font-weight: bold;
			font-size: 60px;
		}
		.tijiao{
			background-color: rgb(235,102,43);
			font-size: 45px !important;
			height: 100px !important;
			line-height: 100px;
		}
		body{
			margin: 0;
			padding: 0;
		}
		.deny{
			width:70%;
			position: fixed;top:30%;left:7.5%;
			z-index: 10;
			border: 1px solid rgb(211,211,211);
			border-radius: 2px;
			box-shadow: 2px 2px 2px rgb(102,102,102);
			background-color: rgb(245,245,245);
			padding: 5%;
			display:none;
		}
		.deny p{
			height:40px;
			width: 98.72%;
			line-height: 40px;
			font-size: 40px;
			background-color: rgb(245,245,245);
			border-bottom: 1px solid rgb(204,204,204);
			padding-bottom: 10px;
			margin-bottom: 20px;
			margin-top: 30px;
			color: #666;
		}
		.deny textarea{
			width: 98.24%;
			height: 100px;
			font-size: 20px;
			border: 1px solid rgb(211,211,211);
			border-radius: 2px;
			background-color: white;
			margin-bottom: 10px;
		}
		.deny input{
			width: 200px;
			height:100px;
			font-size: 40px;
			background-color: rgb(16,128,194);
			border:0;
			border-radius: 2px;
			color: white;
		}
		.btn2{
			width:100%;
			margin: 0 auto;
		}
		.recbtn{
			width:46%;
			height: 100px;
			border-radius: 4px;
			background-color: rgb(235,102,43);
			border: 0;
			font-size: 45px;
			color: white;
			font-weight: bold;
			margin-left: 2%;
		}
		.comfbtn{
			width:46%;
			height: 100px;
			background-color: rgb(102,102,102);
			border-radius: 4px;
			border:0;
			font-size: 45px;
			color: white;
			font-weight: bold;
			margin-left: 3%;
		}
		.quxiao{
			width: 48% !important;
			margin: 20px 0 0 0;
			padding: 0;
			height: 20px;
			background-color: rgb(102,102,102) !important;
			float: left;
			border-radius: 4px;
		}
		.queren{
			width: 48% !important;
			float: right;
			height: 20px;
			margin: 20px 20px 0 0;
			padding: 0;
			background-color: rgb(235,102,43) !important;
			border-radius: 4px;
		}
		li{
			list-style-type:none;
		}
	</style>
	<body>
		<!--<div id="header">合单详情</div>-->
		<div id="main">
			<ul  name="CombinedDetail"></ul>
			<ul  name="orderDetail"></ul>
		</div>

		<!--拼车单详情-->
		<script id="CombinedDetail" type="text/html">
			<li class="order">
				<div class="identifier">
					<table>
						<tr>
							<td class="titletd"><span>订单编号:</span></td>
							<td colspan="3" >
								{{Code}}
								<input type="hidden" id="TotalCost" value="{{TotalCost}}">
							</td>
						</tr>
						<tr>
							<td class="titletd"><span>合同编号:</span></td>
							<td class="content1" colspan="3" >
								{{PactCode}} 
							</td>
						</tr>						
						<tr>
							<td class="titletd"><span>下单时间:</span></td>
							<td class="content2" colspan="3" >
								{{CreateTime}}
							</td>
						</tr>
					</table>
				</div>
			</li>
		</script>
		<!--订单详情-->
		<script id="orderDetail" type="text/html">
			<li class="order">
				<div class="defaultdiv">
					<!--详细信息-->
					<div class="information">
						<table>
							<tr>
								<td class="titletd"><span>收货方:</span></td>
								<td class="content2" colspan="3" >{{endusername}}</td>
							</tr>
							<tr>
								<td class="titletd"><span>发货时间:</span></td>
								<td class="content2" >{{Fromtime}}</td>
								<td class="titletd"><span>收货时间:</span></td>
								<td class="content1" >{{Totime}}</td>
							</tr>
							<tr>
								<td class="titletd"><span>发货地址:</span></td>
								<td colspan="3" >{{from}}</td>
							</tr>
							<tr>
								<td class="titletd"><span>收货地址:</span></td>
								<td colspan="3" >{{to}}</td>
							</tr>
							<tr>
								<td class="titletd"><span>总重量:</span></td>
								<td colspan="" >{{weight}}公斤</td>
								<td class="titletd"><span>总体积:</span></td>
								<td colspan="" >{{volume}}立方米</td>
							</tr>
							<tr>
								<td class="titletd"><span>总数量:</span></td>
								<td colspan="3" >{{amount}}</td>
							</tr>
						</table>
					</div>
				</div>
			</li>	
		</script>
	</body>
	<script type="text/javascript">
		seajs.use('/assets/NSF/js/NSF.System.Data.js', CombinedDetail);
	</script>
</html>
