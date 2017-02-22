<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<META HTTP-EQUIV="expires" CONTENT="0">
		<meta name="viewport" content="inital-scale=1.0,user-scalable=no;">		
		<title>待回单订单列表</title>
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
		span{
			height: 70px;
			line-height: 70px;
		}
		.header{
			width: 100%;
			height:120px;
			line-height: 120px;
			background: rgb(235,102,43);
			text-align: center;
			color: white;
			font-size: 50px;
			font-weight: bold;
			font-family: "微软雅黑";
		}
		.order{
			width:98%;
			margin: 0 auto;
		}
		/*第一联，送货时间样式*/
		.transdate{
			height:140px;
			width:98%;
			border-bottom: 1px solid rgb(233,233,233);
			margin: 0 auto;
			padding-top: 10px;
			padding-bottom: 10px;
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
			width: 46%;
			float: right;
			font-size: 35px;
			color: #666;
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
			width: 46%;
			float: right;
			font-size: 40px;
			color: #666;
			font-weight: bold;
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
			border-bottom: 1px solid rgb(233,233,233);
			margin: 0 auto;
			padding-top: 10px;
			padding-bottom: 10px;
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
		}
		/*收货地址*/
		.transaddress2{
			height: 60px;
			line-height: 60px;
			float: right;
			width: 92%;
			font-size: 35px;
			color: #666;
		}
		/*第三联，运输双方*/
		.transperson{
			width: 98%;
			height: 140px;
			border-bottom: 1px solid rgb(233,233,233);
			margin: 0 auto;
			padding-top: 10px;
			padding-bottom: 10px;
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
			width:46%;
			height: 60px;
			line-height: 60px;
			float: right;
			font-size: 35px;
			color: #666;
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
			width:46%;
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
			border-bottom: 1px solid rgb(233,233,233);
			margin: 0 auto;
			padding-top: 10px;
			padding-bottom: 10px;
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
		/*重量*/
		.weight1{
			height: 60px;
			line-height: 60px;
			width:30%;
			float: right;
			font-size: 40px;
			color: #666;
			font-weight: bold;
		}
		/*体积*/
		.volume1{
			height: 60px;
			line-height: 60px;
			width:30%;
			float: right;
			font-size: 40px;
			color: #666;
			font-weight: bold;
		}
		/*数量*/
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
		img{
			height: 55px;
			width: 55px;
		}
		.uniorder{
			width: 100%;
			margin-top: 20px;
			position: relative;
		}
		li{
			list-style-type: none;
		}
	</style>
	<body>
		<!--<div class="header">待回单订单列表</div>-->
		<input type="hidden" id="OpenId" value="<%=GetUrlPara( "OpenId", false )%>">
		<div id="main">
			<ul name="Receipt" view-id='{ id:"Driver_grid_jplist_0009",cross:"false", model:"Receipt", rowIdentClass:"Receipt", paras:[]}'></ul>
		</div>

		<script id="Receipt" type="text/html">
			<li>
				<a target="_self">
					<input type="hidden" class="orderID" value={{id}}>
					<input type="hidden" class="combined" value={{Combined}}>
					<div class="order">
						<div class="transdate">
							<div class="transdatemark"><img src="img/schedule.png"></div>
							<div class="pickdate"><span>收货时间</span></div>
							<div class="deliverydate"><span>发货时间</span></div>
							<div class="pickdate1"><span>{{ToTime}}</span></div>
							<div class="deliverydate1"><span>{{FromTime}}</span></div>
						</div>
						<div class="transaddress">
							<div class="transaddressmark"><img src="img/location.png"></div>
							<div class="transaddress1"><span>发货地址:{{FromAdd}}</span></div>
							<div class="transaddress2"><span>收货地址:{{ToAdd}}</span></div>
						</div>
						<div class="transperson">
							<div class="transpersonmark"><img src="img/person.png"></div>
							<div class="transperson2"><span>收货方</span></div>
							<div class="transperson1"><span>发货方</span></div>
							<div class="transperson1name"><span>{{EndUserName}}</span></div>
							<div class="transperson2name"><span>{{CustomerName}}</span></div>
						</div>
						<div class="description">
							<div class="descriptionmark"><img src="img/book.png"></div>
							<div class="weight"><span>总重量</span></div>
							<div class="volume"><span>总体积</span></div>
							<div class="amount"><span>总数量</span></div>
							<div class="weight1"><span>{{TotalWeight}}吨</span></div>
							<div class="volume1"><span>{{TotalVolume}}立方米</span></div>
							<div class="amount1"><span>{{TotalAmount}}</span></div>
						</div>
						<div class="transprice">
							<div class="pricemark"><img src="img/totalamount.png"></div>
							<div class="priceamount"><span>合计价格</span></div>
							<div class="priceamount1"><span>￥{{TotalCost}}</span></div>
						</div>
					</div>
				</a>

				<!--底框-->
				<div style="height: 30px;width:100%;background-image: url(img/013.png);repeat-x;border:0;"></div>
			</li>
		</script>
	</body>
	<script type="text/javascript">
		seajs.use('/assets/NSF/js/NSF.System.Data.js', Receipt);
	</script>
</html>
