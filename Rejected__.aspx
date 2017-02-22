<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="inital-scale=1.0,user-scalable=no;">		
		<meta charset="UTF-8">
		<title>客户邀请列表</title>
		<script language="JavaScript" src="js/jquery-3.1.0.js"></script>
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
		.order{
			width:98%;
			padding-left: 2%;
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
			width:30.6%;
			float: right;
			font-size: 35px;
			color: #666;
		}
		/*体积*/
		.volume{
			height: 60px;
			line-height: 60px;
			width:30.6%;
			float: right;
			font-size: 35px;
			color: #666;
		}
		/*数量*/
		.amount{
			height: 60px;
			line-height: 60px;
			width: 30.6%;
			float: right;
			font-size: 35px;
			color: #666;
		}
		/*重量*/
		.weight1{
			height: 60px;
			line-height: 60px;
			width:30.6%;
			float: right;
			font-size: 40px;
			color: #666;
			font-weight: bold;
		}
		/*体积*/
		.volume1{
			height: 60px;
			line-height: 60px;
			width:30.6%;
			float: right;
			font-size: 40px;
			color: #666;
			font-weight: bold;
		}
		/*数量*/
		.amount1{
			height: 60px;
			line-height: 60px;
			width: 30.6%;
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
		/*第五联，合计价格，被拒原因*/
		.priceandreason{
			width: 98%;
			height: 140px;
			margin: 0 auto;
			padding-top: 10px;
			padding-bottom: 10px;
		}
		.priceandreasonmark{
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
		.zongji{
			height: 60px;
			line-height: 60px;
			float: right;
			width: 92%;
			font-size: 35px;
			color: #666;
		}
		.denyreason{
			height: 60px;
			line-height: 60px;
			float: right;
			width: 92%;
			font-size: 35px;
			color: #666;
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
		.header1{
			display: none;
		}
		.header2{
			display: none;
		}
		.header3{
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
			color: white;
			font-size: 45px;
			width: 20%;
			font-family: "微软雅黑";
		}
		.bidagainbtn{
			width: 200px;
			height: 80px;
			font-size: 35px;
			margin-left: 9%;
			margin-bottom: 40px;
			color: white;
			border-radius: 4px;
			border: 1px solid rgb(235,102,43);
			background-color: rgb(235,102,43);
			font-family: "微软雅黑";
		}
		.finished{
			width: 100%;
			display: none;
			background-color: white;
		}
		.refused{
			width: 100%;
			display: none;
			background-color: white;
		}
		.berefused{
			width: 100%;
			display: block;
			background-color: white;
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
			width: 33%;
			text-align: center;
			line-height: 120px;
			font-size: 45px;
			font-family: "微软雅黑";
			color: rgb(100,100,100);
		}
		.li3{
			color: rgb(237,101,41);
			border-bottom: 10px solid rgb(237,101,41);
		}
	</style>
	<body>
		 
	 
		<div class="options">
			<ul>
				<li class="li1" onclick="choose('finished','refused','berefused','header1','header2','header3','li1','li2','li3')">待审核客户</li>
				<li style="width: 0.5%";>|</li>
				<li class="li2" onclick="choose('refused','finished','berefused','header2','header3','header1','li2','li3','li1')">已审核客户</li>
				 
			</ul>
		</div>
		
		<div class="finished">
			<div class="order">
				<div class="transdate">
					<div class="transdatemark"><img src="img/schedule.png"></div>
					<div class="pickdate"><span>提货时间</span></div>
					<div class="deliverydate"><span>送货时间</span></div>
					<div class="pickdate1"><span>2016-08-30 10:00</span></div>
					<div class="deliverydate1"><span>2016-09-07 15:30</span></div>
				</div>
				<div class="transaddress">
					<div class="transaddressmark"><img src="img/location.png"></div>
					<div class="transaddress1"><span>发货地址:江苏南通财富广场1003室</span></div>
					<div class="transaddress2"><span>收货地址:上海普陀区杰地大厦2902号</span></div>
				</div>
				<div class="transperson">
					<div class="transpersonmark"><img src="img/person.png"></div>
					<div class="transperson1"><span>发货方</span></div>
					<div class="transperson2"><span>收货方</span></div>
					<div class="transperson1name"><span>中保物流</span></div>
					<div class="transperson2name"><span>李先生</span></div>
				</div>
				<div class="description">
					<div class="descriptionmark"><img src="img/book.png"></div>
					<div class="weight"><span>总重量</span></div>
					<div class="volume"><span>总体积</span></div>
					<div class="amount"><span>总数量</span></div>
					<div class="weight1"><span>100吨</span></div>
					<div class="volume1"><span>560立方米</span></div>
					<div class="amount1"><span>1235</span></div>
				</div>
			</div>
			<div style="height: 30px;background-image: url(img/013.png);repeat-x;"></div>
			<div class="uniorder">
			<img src="img/uniorder.png" style="position: absolute;right: 1%;top:1%">
			<div class="order">
				<div class="transdate">
					<div class="transdatemark"><img src="img/schedule.png"></div>
					<div class="pickdate"><span>提货时间</span></div>
					<div class="deliverydate"><span>送货时间</span></div>
					<div class="pickdate1"><span>2016-08-30 10:00</span></div>
					<div class="deliverydate1"><span>2016-09-07 10:00</span></div>
				</div>
				<div class="transaddress">
					<div class="transaddressmark"><img src="img/location.png"></div>
					<div class="transaddress1"><span>发货地址:江苏南通财富广场1003室</span></div>
					<div class="transaddress2"><span>收货地址:上海普陀区杰地大厦2902号</span></div>
				</div>
				<div class="transperson">
					<div class="transpersonmark"><img src="img/person.png"></div>
					<div class="transperson1"><span>发货方</span></div>
					<div class="transperson2"><span>收货方</span></div>
					<div class="transperson1name"><span>中保物流</span></div>
					<div class="transperson2name"><span>李先生</span></div>
				</div>
				<div class="description">
					<div class="descriptionmark"><img src="img/book.png"></div>
					<div class="weight"><span>总重量</span></div>
					<div class="volume"><span>总体积</span></div>
					<div class="amount"><span>总数量</span></div>
					<div class="weight1"><span>100吨</span></div>
					<div class="volume1"><span>560立方米</span></div>
					<div class="amount1"><span>1235</span></div>
				</div>
			</div>
			<div class="order">
				<div class="transdate">
					<div class="transdatemark"><img src="img/schedule.png"></div>
					<div class="pickdate"><span>提货时间</span></div>
					<div class="deliverydate"><span>送货时间</span></div>
					<div class="pickdate1"><span>2016-08-30 10:00</span></div>
					<div class="deliverydate1"><span>2016-09-07 10:00</span></div>
				</div>
				<div class="transaddress">
					<div class="transaddressmark"><img src="img/location.png"></div>
					<div class="transaddress1"><span>发货地址:江苏南通财富广场1003室</span></div>
					<div class="transaddress2"><span>收货地址:上海普陀区杰地大厦2902号</span></div>
				</div>
				<div class="transperson">
					<div class="transpersonmark"><img src="img/person.png"></div>
					<div class="transperson1"><span>发货方</span></div>
					<div class="transperson2"><span>收货方</span></div>
					<div class="transperson1name"><span>中保物流</span></div>
					<div class="transperson2name"><span>李先生</span></div>
				</div>
				<div class="description">
					<div class="descriptionmark"><img src="img/book.png"></div>
					<div class="weight"><span>总重量</span></div>
					<div class="volume"><span>总体积</span></div>
					<div class="amount"><span>总数量</span></div>
					<div class="weight1"><span>100吨</span></div>
					<div class="volume1"><span>560立方米</span></div>
					<div class="amount1"><span>1235</span></div>
				</div>
			</div>
			<div class="order">
				<div class="transdate">
					<div class="transdatemark"><img src="img/schedule.png"></div>
					<div class="pickdate"><span>提货时间</span></div>
					<div class="deliverydate"><span>送货时间</span></div>
					<div class="pickdate1"><span>2016-08-30 10:00</span></div>
					<div class="deliverydate1"><span>2016-09-07 10:00</span></div>
				</div>
				<div class="transaddress">
					<div class="transaddressmark"><img src="img/location.png"></div>
					<div class="transaddress1"><span>发货地址:江苏南通财富广场1003室</span></div>
					<div class="transaddress2"><span>收货地址:上海普陀区杰地大厦2902号</span></div>
				</div>
				<div class="transperson">
					<div class="transpersonmark"><img src="img/person.png"></div>
					<div class="transperson1"><span>发货方</span></div>
					<div class="transperson2"><span>收货方</span></div>
					<div class="transperson1name"><span>中保物流</span></div>
					<div class="transperson2name"><span>李先生</span></div>
				</div>
				<div class="description">
					<div class="descriptionmark"><img src="img/book.png"></div>
					<div class="weight"><span>总重量</span></div>
					<div class="volume"><span>总体积</span></div>
					<div class="amount"><span>总数量</span></div>
					<div class="weight1"><span>100吨</span></div>
					<div class="volume1"><span>560立方米</span></div>
					<div class="amount1"><span>1235</span></div>
				</div>
			</div>
			</div>
		</div>
		
		<div class="refused">
			<div class="order">
				<div class="transdate">
					<div class="transdatemark"><img src="img/schedule.png"></div>
					<div class="pickdate"><span>提货时间</span></div>
					<div class="deliverydate"><span>送货时间</span></div>
					<div class="pickdate1"><span>2016-08-30 10:00</span></div>
					<div class="deliverydate1"><span>2016-09-07 10:00</span></div>
				</div>
				<div class="transaddress">
					<div class="transaddressmark"><img src="img/location.png"></div>
					<div class="transaddress1"><span>发货地址:江苏南通财富广场1003室</span></div>
					<div class="transaddress2"><span>收货地址:上海普陀区杰地大厦2902号</span></div>
				</div>
				<div class="transperson">
					<div class="transpersonmark"><img src="img/person.png"></div>
					<div class="transperson1"><span>发货方</span></div>
					<div class="transperson2"><span>收货方</span></div>
					<div class="transperson1name"><span>中保物流</span></div>
					<div class="transperson2name"><span>李先生</span></div>
				</div>
				<div class="description">
					<div class="descriptionmark"><img src="img/book.png"></div>
					<div class="weight"><span>总重量</span></div>
					<div class="volume"><span>总体积</span></div>
					<div class="amount"><span>总数量</span></div>
					<div class="weight1"><span>100吨</span></div>
					<div class="volume1"><span>560立方米</span></div>
					<div class="amount1"><span>1235</span></div>
				</div>
			</div>
			<div style="height: 30px;background-image: url(img/013.png);repeat-x;"></div>
			<div class="uniorder">
			<img src="../img/uniorder.png" style="position: absolute;right: 1%;top:1%">
			<div class="order">
				<div class="transdate">
					<div class="transdatemark"><img src="img/schedule.png"></div>
					<div class="pickdate"><span>提货时间</span></div>
					<div class="deliverydate"><span>送货时间</span></div>
					<div class="pickdate1"><span>2016-08-30 10:00</span></div>
					<div class="deliverydate1"><span>2016-09-07 10:00</span></div>
				</div>
				<div class="transaddress">
					<div class="transaddressmark"><img src="img/location.png"></div>
					<div class="transaddress1"><span>发货地址:江苏南通财富广场1003室</span></div>
					<div class="transaddress2"><span>收货地址:上海普陀区杰地大厦2902号</span></div>
				</div>
				<div class="transperson">
					<div class="transpersonmark"><img src="img/person.png"></div>
					<div class="transperson1"><span>发货方</span></div>
					<div class="transperson2"><span>收货方</span></div>
					<div class="transperson1name"><span>中保物流</span></div>
					<div class="transperson2name"><span>李先生</span></div>
				</div>
				<div class="description">
					<div class="descriptionmark"><img src="img/book.png"></div>
					<div class="weight"><span>总重量</span></div>
					<div class="volume"><span>总体积</span></div>
					<div class="amount"><span>总数量</span></div>
					<div class="weight1"><span>100吨</span></div>
					<div class="volume1"><span>560立方米</span></div>
					<div class="amount1"><span>1235</span></div>
				</div>
			</div>
			<div class="order">
				<div class="transdate">
					<div class="transdatemark"><img src="img/schedule.png"></div>
					<div class="pickdate"><span>提货时间</span></div>
					<div class="deliverydate"><span>送货时间</span></div>
					<div class="pickdate1"><span>2016-08-30 10:00</span></div>
					<div class="deliverydate1"><span>2016-09-07 10:00</span></div>
				</div>
				<div class="transaddress">
					<div class="transaddressmark"><img src="img/location.png"></div>
					<div class="transaddress1"><span>发货地址:江苏南通财富广场1003室</span></div>
					<div class="transaddress2"><span>收货地址:上海普陀区杰地大厦2902号</span></div>
				</div>
				<div class="transperson">
					<div class="transpersonmark"><img src="img/person.png"></div>
					<div class="transperson1"><span>发货方</span></div>
					<div class="transperson2"><span>收货方</span></div>
					<div class="transperson1name"><span>中保物流</span></div>
					<div class="transperson2name"><span>李先生</span></div>
				</div>
				<div class="description">
					<div class="descriptionmark"><img src="img/book.png"></div>
					<div class="weight"><span>总重量</span></div>
					<div class="volume"><span>总体积</span></div>
					<div class="amount"><span>总数量</span></div>
					<div class="weight1"><span>100吨</span></div>
					<div class="volume1"><span>560立方米</span></div>
					<div class="amount1"><span>1235</span></div>
				</div>
			</div>
			<div class="order">
				<div class="transdate">
					<div class="transdatemark"><img src="img/schedule.png"></div>
					<div class="pickdate"><span>提货时间</span></div>
					<div class="deliverydate"><span>送货时间</span></div>
					<div class="pickdate1"><span>2016-08-30 10:00</span></div>
					<div class="deliverydate1"><span>2016-09-07 10:00</span></div>
				</div>
				<div class="transaddress">
					<div class="transaddressmark"><img src="img/location.png"></div>
					<div class="transaddress1"><span>发货地址:江苏南通财富广场1003室</span></div>
					<div class="transaddress2"><span>收货地址:上海普陀区杰地大厦2902号</span></div>
				</div>
				<div class="transperson">
					<div class="transpersonmark"><img src="img/person.png"></div>
					<div class="transperson1"><span>发货方</span></div>
					<div class="transperson2"><span>收货方</span></div>
					<div class="transperson1name"><span>中保物流</span></div>
					<div class="transperson2name"><span>李先生</span></div>
				</div>
				<div class="description">
					<div class="descriptionmark"><img src="img/book.png"></div>
					<div class="weight"><span>总重量</span></div>
					<div class="volume"><span>总体积</span></div>
					<div class="amount"><span>总数量</span></div>
					<div class="weight1"><span>100吨</span></div>
					<div class="volume1"><span>560立方米</span></div>
					<div class="amount1"><span>1235</span></div>
				</div>
			</div>
			</div>
		</div>
		
		 
	</body>
	<script>
		function choose(type1,type2,type3,hd1,hd2,hd3,no1,no2,no3){
			var opt1 = document.getElementsByClassName(type1);
			var opt2 = document.getElementsByClassName(type2);
			var opt3 = document.getElementsByClassName(type3);
			var head1 = document.getElementsByClassName(hd1);
			var head2 = document.getElementsByClassName(hd2);
			var head3 = document.getElementsByClassName(hd3);
			var li1 = document.getElementsByClassName(no1);
			var li2 = document.getElementsByClassName(no2);
			var li3 = document.getElementsByClassName(no3);

			opt2[0].style.display = "none";
			opt3[0].style.display = "none";
			opt1[0].style.display = "block";
			head2[0].style.display = "none";
			head3[0].style.display = "none";
			head1[0].style.display = "block";
			
			li1[0].style.color = "rgb(237,101,41)";
			li2[0].style.color = "rgb(100,100,100)";
			li3[0].style.color = "rgb(100,100,100)";
			
			li1[0].style.borderBottom = "10px solid rgb(237,101,41)"
			li2[0].style.borderBottom = "0"
			li3[0].style.borderBottom = "0"
		}
	</script>
</html>
