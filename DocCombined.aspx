<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<META HTTP-EQUIV="expires" CONTENT="0">
		<meta name="viewport" content="inital-scale=1.0,user-scalable=no;">		
		<title>待报价合单详情</title>
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
		border:0;
	}
	.information{
		border-bottom-style: dashed;
	}
	.btn2{
		width: 90%;
		margin: 0 auto;
	}
	.recbtn{
		width:48%;
		height: 35px;
		background-color: rgb(16,128,194);
		border: 0;
		border-radius: 2px;
		margin-right: 1%;
		color: white;
	}
	.comfbtn{
		width:48%;
		height: 35px;
		background-color: rgb(102,102,102);
		border:0;
		border-radius: 2px;
		margin-left: 1%;
		color: white;
	}
	.quoteprice{
		width:98%;
		font-size: 35px;
		background-color: white;
		margin-top: 10px;
		margin: 0 auto;
	}
	.quoteprice p{
		background-color: white;
	}
	.quoteprice table{
		width:100%;	
	}
	.quoteprice table input{
		border:1px solid rgb(188,188,188);
		border-radius: 4px;
		background-color: white;
		height:80px;
		width: 99.7%;
		font-size: 35px;
		margin-bottom: 20px;
	}
	.tijiao{
		width:100% !important;
		height:100px !important;
		line-height: 100px !important;
		color:white;
		font-size: 45px !important;
		font-weight: bold;
		border: 0;
		border-radius: 4px !important;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	.pricetitletd{
		width: 10%;
	}
	.pricevalue{
		width: 60%;
	}
	li{
		list-style-type: none;
	}
	.hide{
		display: none;
	}
	</style>
	<body code="DocCombined">
		<!--<div id="header">待报价合单详情</div>-->
		<input type="hidden" id="OpenId" value="<%=GetUrlPara( "OpenId", false )%>">
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
								<input type="hidden" class="OrderID required" value="{{OrderID}}">
								<input type="hidden" class="PactCode required" value="{{PactCode}}">
								<input type="hidden" class="CustomerID required" value="{{CustomerID}}"
								<input type="hidden" class="Name required" value="{{Name}}">
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
								<td class="content1" >{{Fromtime}}</td>
								<td class="titletd"><span>收货时间:</span></td>
								<td class="content2" >{{Totime}}</td>
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

		<div style="height: 30px;background-image: url(img/013.png);repeat-x;"></div>
		<input class="Type required" type="hidden" value="4">
		<div class="quoteprice">
			<table>
				<tr>
					<td colspan="2"><p><span style="color: red;">*</span>根据您的实际情况可选填报价，至少填一项&nbsp;&nbsp;单价:RMB/元</p></td>
				</tr>
				<tr>
					<td class="pricetitletd">零担费:</td>
					<td class="pricevalue">
						<input class="LessLoadPrice required" type="text">
					</td>
				</tr>
				<tr>
					<td class="pricetitletd">整车费:</td><td class="pricevalue"><input class="FullLoadPrice required" type="text"></td>
				</tr>
				<tr>
					<td class="pricetitletd">提货费:</td><td class="pricevalue"><input class="PickPrice required" type="text"></td>
				</tr>
				<tr>
					<td class="pricetitletd">送货费:</td><td class="pricevalue"><input class="DeliveryPrice required" type="text"></td>
				</tr>
				<tr>
					<td class="pricetitletd">装货费:</td><td class="pricevalue"><input class="OnLoadPrice required" type="text"></td>
				</tr>
				<tr>
					<td class="pricetitletd">卸货费:</td><td class="pricevalue"><input class="OffLoadPrice required" type="text"></td>
				</tr>
				<tr>
					<td class="pricetitletd">附加费:</td><td class="pricevalue"><input class="AdditionPrice required" type="text"></td>
				</tr>
				<tr>
					<td class="pricetitletd">保险费:</td><td class="pricevalue"><input class="InsuranceCost required" type="text"></td>
				</tr>
				<tr>
					<td class="pricetitletd">税&nbsp费:</td><td class="pricevalue"><input class="TaxPrice required" type="text"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input class="tijiao" type="button" value="提 交 报 价" style="background-color: rgb(235,102,43);" onclick="NoZero()">
					</td>
				</tr>
			</table>
		</div>
	</body>
	<script type="text/javascript">
		seajs.use('/assets/NSF/js/NSF.System.Data.js', CombinedDetail);
	</script>
</html>
