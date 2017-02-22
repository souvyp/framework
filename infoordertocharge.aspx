<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<META HTTP-EQUIV="expires" CONTENT="0">
		<meta name="viewport" content="inital-scale=1.0,user-scalable=no;">		
		<title>待收费订单详情</title>
		<link href="css/h.css" rel="stylesheet" type="text/css"/>
		<script language="javascript" src="/assets/js/jquery-1.11.1.min.js"></script>
		<script language="javascript" src="/js/index.js" ></script>
		<script language="javascript" src="/assets/js/sea.js" ></script>
	</head>
	<style>
		*{
			margin: 0;
			padding: 0;
		}
		li{
			list-style-type:none;
		}
		#header{
			width:100%;
			height:120px;
			background-color:rgb(235,102,43);
			text-align:center;
			line-height:120px;
			color:white;
			font-weight: bold;
			font-size: 45px;
			font-family: "微软雅黑";
		}
		.order{
			width:100%;
		}
		.uniorder{
			width: 100%;
			margin-top: 20px;
			position: relative;
		}
		.expenselist{
			width: 98%;
			background-color: white;
			margin-bottom: 10px;
			margin: 0 auto;
			padding-top: 25px;
			padding-bottom: 25px;
		}
		.expenselist table{
			width: 100%;
			background-color: white;
		}
		.expenselist table tr{
			height:60px;
			line-height: 60px;
		}
		.expenselist table tr td{
			font-size: 40px;
			color: rgb(92,92,92);
			background-color: white;
		}
		.expenselist table tr td span{
			background-color: white;
			font-size: 40px;
		}
		.expensedescription{
			width:98%;
			background-color: white;
			padding-bottom: 10px;
			padding-top: 10px;
			margin: 0 auto;
		}
		.expensedescription table{
			width:100%;
			font-size: 10px;
			background-color: white;
			border-bottom: 1px solid rgb(230,230,230);
		}
		.expensedescription table tr td{
			background-color: white;
		}
		.expensedescription table tr td span{
			background-color: white;
		}
		/*第一联，送货时间样式*/
		.transdate{
			height:140px;
			width:98%;
			margin: 0 auto;
			padding-top: 10px;
			padding-bottom: 10px;
			border-bottom: 1px solid rgb(233,233,233);
		}
		/*图标*/
		.transdatemark{
			display:-webkit-box;
			display:-moz-box;
			display:box;
			-webkit-box-pack: center;
			-webkit-box-align: center; 
			-moz-box-pack: center; 
			-moz-box-align: center;
			height: 120px;
			width: 6%;
			float: left;
		}
		/*提货时间*/
		.pickdate{
			height: 60px;
			line-height: 60px;
			width: 44%;
			float: right;
			font-size: 35px;
			color: #666;
			padding-left: 2%;
		}
		/*送货时间*/
		.deliverydate{
			height: 60px;
			line-height: 60px;
			width: 46%;
			float: right;
			font-size: 35px;
			color: #666;
		}
		/*时间1*/
		.pickdate1{
			height: 60px;
			line-height: 60px;
			width: 44%;
			float: right;
			font-size: 40px;
			color: #666;
			font-weight: bold;
			padding-left: 2%;
		}
		/*时间2*/
		.deliverydate1{
			height: 60px;
			line-height: 60px;
			width: 46%;
			float: right;
			font-size: 40px;
			color: #666;
			font-weight: bold;
		}
		/*第二联,送货地址样式*/
		.transaddress{
			width: 98%;
			height: 140px;
			margin: 0 auto;
			padding-top: 10px;
			padding-bottom: 10px;
			border-bottom: 1px solid rgb(233,233,233);
		}
		/*图标*/
		.transaddressmark{
			display:-webkit-box;
			display:-moz-box;
			display:box;
			-webkit-box-pack: center;
			-webkit-box-align: center; 
			-moz-box-pack: center; 
			-moz-box-align: center;
			width: 6%;
			height: 120px;
			float: left;
		}
		/*发货地址*/
		.transaddress1{
			height: 60px;
			line-height: 60px;
			float: right;
			width: 92%;
			font-size: 35px;
			color: #666;
			padding-left: 2%;
		}
		/*收货地址*/
		.transaddress2{
			height: 60px;
			line-height: 60px;
			float: right;
			width: 92%;
			font-size: 35px;
			color: #666;
			padding-left: 2%;
		}
		/*第三联，运输双方*/
		.transperson{
			width: 98%;
			height: 140px;
			margin: 0 auto;
			padding-top: 10px;
			padding-bottom: 10px;
			border-bottom: 1px solid rgb(233,233,233);
		}
		/*图标*/
		.transpersonmark{
			display:-webkit-box;
			display:-moz-box;
			display:box;
			-webkit-box-pack: center;
			-webkit-box-align: center; 
			-moz-box-pack: center; 
			-moz-box-align: center;
			width:6%;
			height: 120px;
			float: left;
		}
		/*发货方*/
		.transperson1{
			width:44%;
			height: 60px;
			line-height: 60px;
			float: right;
			font-size: 35px;
			color: #666;
			padding-left: 2%;
		}
		/*收货方*/
		.transperson2{
			width:46%;
			height: 60px;
			line-height: 60px;
			float: right;	
			font-size: 35px;	
			color: #666;	
		}
		/*发货方名字*/
		.transperson1name{
			width:44%;
			padding-left: 2%;
			height: 60px;
			line-height: 60px;
			float: right;
			font-size: 40px;
			color: #666;
			font-weight: bold;
		}
		/*收货方名字*/
		.transperson2name{
			width:46%;
			height: 60px;
			line-height: 60px;
			float: right;	
			font-size: 40px;	
			color: #666;	
			font-weight: bold;
		}
		/*第四联,货物描述*/
		.description{
			width:98%;
			height:140px;
			margin: 0 auto;
			padding-top: 10px;
			margin-bottom: 20px;
			border-bottom: 1px solid rgb(233,233,233);
		}
		/*图标*/
		.descriptionmark{
			display:-webkit-box;
			display:-moz-box;
			display:box;
			-webkit-box-pack: center;
			-webkit-box-align: center; 
			-moz-box-pack: center; 
			-moz-box-align: center;
			width:6%;
			height: 120px;
			float: left;
		}
		/*重量*/
		.weight{
			height: 60px;
			line-height: 60px;
			width:30%;
			float: right;
			font-size: 35px;
			color: #666;
		}
		/*体积*/
		.volume{
			height: 60px;
			line-height: 60px;
			width:30%;
			float: right;
			font-size: 35px;
			color: #666;
		}
		/*数量*/
		.amount{
			height: 60px;
			line-height: 60px;
			width: 30%;
			float: right;
			font-size: 35px;
			color: #666;
		}
		/*重量值*/
		.weight1{
			height: 60px;
			line-height: 60px;
			width:30%;
			float: right;
			font-size: 40px;
			color: #666;
			font-weight: bold;
		}
		/*体积值*/
		.volume1{
			height: 60px;
			line-height: 60px;
			width:30%;
			float: right;
			font-size: 40px;
			color: #666;
			font-weight: bold;
		}
		/*数量值*/
		.amount1{
			height: 60px;
			line-height: 60px;
			width: 30%;
			float: right;
			font-size: 40px;
			color: #666;
			font-weight: bold;
		}
		
		/*总计价格*/
		.transprice{
			width:98%;
			height:140px;
			margin: 0 auto;
			padding-top: 10px;
			padding-bottom: 10px;
		}
		/*图标*/
		.pricemark{
			display:-webkit-box;
			display:-moz-box;
			display:box;
			-webkit-box-pack: center;
			-webkit-box-align: center; 
			-moz-box-pack: center; 
			-moz-box-align: center;
			height: 120px;
			width:6%;
			float: left;
			font-size: 40px;
		}
		/*价格*/
		.priceamount{
			height: 60px;
			line-height: 60px;
			width: 90%;
			float: right;
			font-size: 35px;
			color: #666;
		}
		.priceamount1{
			height: 60px;
			line-height: 60px;
			width: 90%;
			float: right;
			font-size: 40px;
			color: #666;
			font-weight: bold;
		}
		/*第五联，总计价格样式*/
		.sumarize{
			width:98%;
			height:140px;
			margin: 0 auto;
			padding-top: 10px;
			margin-bottom: 20px;
		}
		/*图标*/
		.sumarizemark{
			display:-webkit-box;
			display:-moz-box;
			display:box;
			-webkit-box-pack: center;
			-webkit-box-align: center; 
			-moz-box-pack: center; 
			-moz-box-align: center;
			height: 120px;
			width: 6%;
			float: left;
		}
		/*合计价格*/
		.totalprice{
			height: 120px;
			line-height: 120px;
			width: 20%;
			float: left;
			font-size: 35px;
			color: #666;
			padding-left: 2%;
		}
		/*合计价格值*/
		.totalpricevalue{
			height: 120px;
			line-height: 120px;
			width: 10%;
			float: left;
			font-size: 40px;
			color: #666;
			font-weight: bold;
		}
		.titletd{
			width: 20%;
			font-size: 35px !important;
		}
		.content1{
			width: 30%;
			font-size: 40px !important;
		}
		.content2{
			width: 30%;
			font-size: 40px !important;
		}
		img{
			height: 55px;
			width: 55px;
		}
	</style>
	<body>
		<!--<div id="header">待收费订单详情</div>-->
		<input type="hidden" id="OpenId" value="<%=GetUrlPara( "OpenId", false )%>">
		<div id="main">
			<ul name="WaitCharge"></ul>
			<ul name="WaitChargeDetail"></ul>
		</div>
		<script id="WaitCharge" type="text/html">
			<li>
				<div class="expenselist">
					<table>
						<tr>
							<td class="titletd" style="color: #666;">发货方名称:</td>
							<td colspan="3" style="color: #333;">{{CompanyName}}</td>
						</tr>
						<tr>
							<td class="titletd" style="color: #666;">联系人:</td>
							<td class="content1" style="color: #333;">{{Contact}}</td>
							<td class="titletd" style="color: #666;">联系电话:</td>
							<td class="content2" style="color: #333;">{{Phone}}</td>
						</tr>
						<tr>
							<td class="titletd" style="color: #666;">所属行业:</td>
							<td class="content1" style="color: #333;">
								{{if Industry == "1"}}
									互联网/电子商务
								{{else if Industry == "2"}}
									计算机软件
								{{else if Industry == "3"}}
									计算机硬件
		                        {{else if Industry == "4"}}
									财务/审计
		                        {{else if Industry == "5"}}
									 金融/银行
		                        {{else if Industry == "6"}}
									 保险/贸易进出口
		                        {{else if Industry == "7"}}
									 建筑/建材
		                        {{else if Industry == "8"}}
									 人力资源服务
		                        {{else if Industry == "9"}}
									  法律/法务
		                        {{else if Industry == "10"}}
									  航空/航天
		                        {{else if Industry == "11"}}
									  其它行业
								{{/if}}
							</td>
							<td class="titletd" style="color: #666;">公司网址:</td>
							<td class="content2" style="color: #333;">{{Web}}</td>
						</tr>
						<tr>
							<td class="titletd" style="color: #666;">发货方ID:</td>
							<td class="content1" style="color: #333;">{{customercompanyid}}</td>
							<td class="titletd" style="color: #666;">待收运费:</td>
							<td class="content2"><span style="color: rgb(235,102,43)">￥{{TotalCost}}</span></td>
						</tr>
					</table>
				</div>
				<div style="height: 30px;background-image: url(img/013.png);repeat-x;"></div>
			</li>
		</script>
		<script id="WaitChargeDetail" type="text/html">
			<li>
				<div class="expensedescription">
					<div class="order">
						<div class="transdate">
							<div class="transdatemark"><img src="img/schedule.png"></div>
							<div class="pickdate"><span>提货时间</span></div>
							<div class="deliverydate"><span>送货时间</span></div>
							<div class="pickdate1"><span>{{totime}}</span></div>
							<div class="deliverydate1"><span>{{fromtime}}</span></div>
						</div>
						<div class="transaddress">
							<div class="transaddressmark"><img src="img/location.png" style="width: 60px;height: 60px;"></div>
							<div class="transaddress1"><span>发货地址:{{fromadd}}</span></div>
							<div class="transaddress2"><span>收货地址:{{toadd}}</span></div>
						</div>
						<div class="transperson">
							<div class="transpersonmark"><img src="img/person.png"></div>
							<div class="transperson1"><span>发货方</span></div>
							<div class="transperson2"><span>收货方</span></div>
							<div class="transperson1name"><span>{{CustomerCompany}}</span></div>
							<div class="transperson2name"><span>{{endusername}}</span></div>
						</div>
						<div class="description">
							<div class="descriptionmark"><img src="img/book.png"></div>
							<div class="weight"><span>总重量</span></div>
							<div class="volume"><span>总体积</span></div>
							<div class="amount"><span>总数量</span></div>
							<div class="weight1"><span>{{TotalWeight}}吨</span></div>
							<div class="volume1"><span>{{TotalVolume}}方</span></div>
							<div class="amount1"><span>{{TotalAmount}}</span></div>
						</div>
						<div class="sumarize">
							<div class="sumarizemark"><img src="img/totalamount.png"></div>
							<div class="totalprice"><span>合计价格:</span></div>
							<div class="totalpricevalue"><span><span style="color:rgb(235,102,43);">￥</span>{{TotalCost}}</span></div>
						</div>
					</div>
					<!--小分割线-->
					<div style="width: 98%;border-bottom: 1px solid #666;margin: 15px auto;"></div>
				</div>
			</li>
		</script>
	</body>
	<script type="text/javascript">
		seajs.use('/assets/NSF/js/NSF.System.Data.js', WaitChargeDetail);
	</script>
</html>
