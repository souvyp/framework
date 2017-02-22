<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<META HTTP-EQUIV="expires" CONTENT="0">
		<meta name="viewport" content="inital-scale=1.0,user-scalable=no;">		
		<title>待报价订单列表</title>
		<script language="javascript" src="/assets/js/jquery-1.11.1.min.js"></script>
		<script language="javascript" src="/js/index.js" ></script>
		<script language="javascript" src="/assets/js/sea.js" ></script>
	</head>
	<style>
		*{
			width: 100%;
			}
		body{
			width: 100%;
		}
		span{
			height: 70px;
			line-height: 70px;
		}
		li{
			list-style-type: none;
		}
		.header{
			width:100%;
			height:120px;
			background-color:rgb(235,102,43);
			font-size: 45px;
			text-align:center;
			line-height:120px;
			color:white;
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
			width:98%;
			height:140px;
			margin: 0 auto;
			padding-top: 10px;
			margin-bottom: 20px;
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
		img{
			height: 55px;
			width: 55px;
		}
		.uniorder{
			width: 100%;
			margin-top: 20px;
			position: relative;
		}
		.options{
			width: 100%;
			height: 120px;
			background-color: rgb(240,240,240);
			margin-top: 5px;
		}
		.options ul{
			list-style: none;
			width: 100%;
			height:120px;
		}
		.options ul li{
			float: left;
			height:120px;
			width: 49%;
			text-align: center;
			line-height: 120px;
			font-size: 45px;
			font-family: "微软雅黑";
			color: rgb(100,100,100);
			cursor:pointer;
		}
		.active{
			color: rgb(237,101,41);
			border-bottom: 10px solid rgb(237,101,41);
		}	
		.header1{
			display: block;
		}
		.header2{
			display: none;
		}
		.pricing{
			display: block;
		}
		.appending{
			display: block;
		}
		.search{
			width: 100%;
			height: 120px;
			line-height: 120px;
			background-color: rgb(240,240,240);
		}
		.btn1{
			float: left;
			outline: medium;
			background-color: white;
			border: 1px solid white;
			border-radius: 4px;
			margin-left: 2%;
			margin-top: 15px;
			font-size: 35px;
			height: 90px;
			line-height: 90px;
			width: 73%;
			font-family: "微软雅黑";
		}
		.btn2{
			float: right;
			background-color: rgb(237,101,41);
			border: 1px solid rgb(237,101,41);
			border-radius: 5px;
			margin-right: 2%;
			margin-top: 15px;
			height: 90px;
			line-height: 90px;
			color: white;
			font-size: 45px;
			width: 20%;
			font-family: "微软雅黑";
			text-align: center;
		}			
		.andandefault1{
			display:none;
		}
		.andandefault2{
			display:none;
		}
		.buchongdefault1{
			display:none;
		}
		.buchongdefault2{
			display:none;
		}
		a{
			font-size: 35px;
		}
		ul{
			padding: 0;
		}
		*{
			margin: 0;
			padding: 0;
		}
		.active{
			color:rgb(237,101,41);
			border-bottom:10px solid rgb(237,101,41) !important;
		}
	</style>
	<body>
		<!--<div class="header header1">待报价订单列表</div>-->
		<!--<div class="header header2">待补充报价订单列表</div>-->
		<input type="hidden" id="OpenId" value="<%=GetUrlPara( "OpenId", false )%>">
		
		<!--<div class="search">
			<input type="text" placeholder="单据编号/收货方/发货方" class="btn1">
			<div class="btn2">搜索</div>
		</div>-->S
		
		<div class="options">
			<ul class="navDiv">
				<li class="active" role="#0" onclick="LoadPricingList($(this).attr('role'))">待按单报价订单</li>
				<li style="width: 2%";>|</li>
				<li role="#1" onclick="LoadPricingList($(this).attr('role'))">待补充报价订单</li>
			</ul>
		</div>
		
		<ul class="" name="Pricing" view-id='{ id:"Dtms_0002",cross:"false", model:"Pricing", rowIdentClass:"Pricing", paras:[]}'></ul>
		
		<ul class="" name="Addition" view-id='{ id:"Dtms_0003",cross:"false", model:"Addition", rowIdentClass:"Addition", paras:[]}'></ul>
		
		<script id="Pricing" type="text/html">
			<li class="pricing order" style="position: relative;">
				{{if SrcClass == "3"}}
					<a href="" target="_self">
						<input type="hidden" class="orderID" value={{id}}>
						<input type="hidden" class="srcClass" value={{SrcClass}}>
						<div class="order">
							<div class="transdate">
								<div class="transdatemark"><img src="img/schedule.png"></div>
								<div class="pickdate"><span>单据编号</span></div>
								<div class="deliverydate"><span>合同编号</span></div>
								<div class="pickdate1"><span>{{PactCode}}</span></div>
								<div class="deliverydate1"><span>{{Code}}</span></div>
							</div>
							<div class="transperson">
								<div class="transpersonmark"><img src="img/book.png" style="width: 60px;height: 60px;"></div>
								<div class="transperson1"><span>订单数量</span></div>
								<div class="transperson2"><span>运输模式</span></div>
								<div class="transperson1name"><span>{{OrderCount}}</span></div>
								<div class="transperson2name"><span>
									{{if ShipMode == "1"}}
										市内
									{{else if ShipMode == "2"}}
										长途
									{{/if}}
									</span></div>
							</div>
							<div class="transaddress">
								<div class="transaddressmark"><img src="img/person.png" ></div>
								<div class="transaddress1"><span>承运商名称</span></div>
								<div class="transaddress2"><span>{{CustomerName}}</span></div>
							</div>
							
							
							<!--分割线-->
							<div style="height: 30px;background-image: url(img/013.png);repeat-x;"></div>
						</div>	
					</a>
				{{else}}
					<a href="" target="_self">
						<input type="hidden" class="orderID" value={{id}}>
						<input type="hidden" class="srcClass" value={{SrcClass}}>
						<div class="transdate">
						<div class="transdatemark"><img src="img/schedule.png"></div>
						<div class="pickdate"><span>发货时间</span></div>
						<div class="deliverydate"><span>收货时间</span></div>
						<div class="pickdate1"><span>{{FromTime}}</span></div>
						<div class="deliverydate1"><span>{{ToTime}}</span></div>
						</div>
						<div class="transaddress">
						<div class="transaddressmark"><img src="img/location.png"></div>
						<div class="transaddress1"><span>发货地址:{{IFrom}}</span></div>
						<div class="transaddress2"><span>收货地址:{{ITo}}</span></div>
						</div>
						<div class="transperson">
						<div class="transpersonmark"><img src="img/person.png"></div>
						<div class="transperson1"><span>收货方</span></div>
						<div class="transperson2"><span>发货方</span></div>
						<div class="transperson1name"><span>{{EndUserName}}</span></div>
						<div class="transperson2name"><span>{{CustomerName}}</span></div>
						</div>
						<div class="description">
						<div class="descriptionmark"><img src="img/book.png"></div>
						<div class="weight"><span>总重量</span></div>
						<div class="volume"><span>总体积</span></div>
						<div class="amount"><span>总数量</span></div>
						<div class="weight1"><span>{{TotalWeigh}}吨</span></div>
						<div class="volume1"><span>{{TotalVolume}}立方米</span></div>
						<div class="amount1"><span>{{TotalAmount}}</span></div>
						</div>
					</a>
				<div style="height: 30px;background-image: url(img/013.png);repeat-x;"></div>
			</li>
		{{/if}}
		</script>
			
		<script id="Addition" type="text/html">
			<li class="appending order" style="position: relative;">
				<a href="" target="_self">
					<input type="hidden" class="orderID" value={{id}}>
					<input type="hidden" class="combined" value={{Combined}}>
					
					<div class="transdate">
						<div class="transdatemark"><img src="img/schedule.png"></div>
						<div class="deliverydate"><span>收货时间</span></div>
						<div class="pickdate"><span>发货时间</span></div>
						<div class="deliverydate1"><span>{{ToTime}}</span></div>
						<div class="pickdate1"><span>{{FromTime}}</span></div>
					</div>
					<div class="transaddress">
						<div class="transaddressmark"><img src="img/location.png"></div>
						<div class="transaddress1"><span>发货地址:{{IFrom}}</span></div>
						<div class="transaddress2"><span>收货地址:{{ITo}}</span></div>
					</div>
					<div class="transperson">
						<div class="transpersonmark"><img src="img/person.png"></div>
						<div class="transperson1"><span>收货方</span></div>
						<div class="transperson2"><span>发货方</span></div>
						<div class="transperson1name"><span>{{EndUserName}}</span></div>
						<div class="transperson2name"><span>{{CustomerName}}</span></div>
					</div>
					<div class="description">
						<div class="descriptionmark"><img src="img/book.png"></div>
						<div class="weight"><span>总重量</span></div>
						<div class="volume"><span>总体积</span></div>
						<div class="amount"><span>总数量</span></div>
						<div class="weight1"><span>{{TotalWeigh}}吨</span></div>
						<div class="volume1"><span>{{TotalVolume}}立方米</span></div>
						<div class="amount1"><span>{{TotalAmount}}</span></div>
					</div>
				</a>
				<div style="height: 30px;background-image: url(img/013.png);repeat-x;"></div>
			</li>	
		</script>
	</body>
	<script>
		seajs.use('/assets/NSF/js/NSF.System.Data.js', LoadPricingList);
	</script>
</html>
