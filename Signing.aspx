<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<META HTTP-EQUIV="expires" CONTENT="0">
		<meta name="viewport" content="inital-scale=1.0,user-scalable=no;">		
		<script type="text/javascript" src="assets/js/jquery-3.1.0.js" ></script>
		<script language="javascript" src="/js/index.js" ></script>
		<script language="javascript" src="/assets/js/sea.js" ></script>
		<title>待签收订单列表</title>
	</head>
	<style>
		*{
			width: 100%;
			margin: 0;
			padding: 0;
		}
		body{
			width: 100%;
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
			width:100%;
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
			width: 98%;
			height: 140px;
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
		img{
			height: 55px;
			width: 55px;
		}
		.uniorder{
			width: 100%;
			margin-top: 20px;
			position: relative;
		}
		.signdefault{
			display:none;
		}
		li{
			list-style-type: none;
		}
	</style>
	<body>
		<!--<div class="header">待签收订单列表</div>-->
		<input type="hidden" id="OpenId" value="<%=GetUrlPara( "OpenId", false )%>">
		<ul class="" name="Signing" view-id='{ id:"Driver_grid_jplist_0008",cross:"false", model:"Signing", rowIdentClass:"Signing", paras:[]}'>
		</ul>
		
		<script id="Signing"  type="text/html">
			<li class="default">
				<a  target="_self">
					<input type="hidden" class="orderID" value={{id}}>
					<input type="hidden" class="combined" value={{Combined}}>
					<div class="order">
						<div class="transdate">
							<div class="transdatemark"><img src="../img/schedule.png"></div>
							<div class="deliverydate"><span>收货时间</span></div>
							<div class="pickdate"><span>发货时间</span></div>
							<div class="deliverydate1"><span>{{ToTime}}</span></div>
							<div class="pickdate1"><span>{{FromTime}}</span></div>
							
						</div>
						<div class="transaddress">
							<div class="transaddressmark"><img src="../img/location.png" style="width: 60px;height: 60px;"></div>
							<div class="transaddress1"><span>发货地址:</span><span>{{FromAdd}}</span></div>
							<div class="transaddress2"><span>收货地址:</span><span>{{ToAdd}}</span></div>
						</div>
						<div class="transperson">
							<div class="transpersonmark"><img src="../img/person.png"></div>
							<div class="transperson2"><span>收货方</span></div>
							<div class="transperson1"><span>发货方</span></div>
							<div class="transperson2name"><span>{{EndUserName}}</span></div>
							<div class="transperson1name"><span>{{CustomerName}}</span></div>
						</div>
						<div class="description">
							<div class="descriptionmark"><img src="../img/book.png"></div>
							<div class="weight"><span>总重量</span></div>
							<div class="volume"><span>总体积</span></div>
							<div class="amount"><span>总数量</span></div>
							<div class="weight1"><span>{{TotalWeight}}</span></div>
							<div class="volume1"><span>{{TotalVolume}}</span></div>
							<div class="amount1"><span>{{TotalAmount}}</span></div>
						</div>
						<div class="sumarize">
							<div class="sumarizemark"><img src="../img/totalamount.png"></div>
							<div class="totalprice"><span>合计价格:</span></div>
							<div class="totalpricevalue"><span><span style="color:rgb(235,102,43);">￥<span>{{TotalCost}}</span></div>
						</div>
					</div>
					
				<!--分割线-->
				<div style="height: 30px;background-image: url(../img/013.png);repeat-x;"></div>
				
				</a>
			</li>
		</script>
		
	</body>
	<script>
		seajs.use('/assets/NSF/js/NSF.System.Data.js', Signing);
	</script>
</html>
