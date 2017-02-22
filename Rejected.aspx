<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!DOCTYPE html>
<html>
	<head>
		<title>被拒绝订单</title>
		<meta charset="UTF-8">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<META HTTP-EQUIV="expires" CONTENT="0">
		<meta name="viewport" content="inital-scale=1.0,user-scalable=no;">		
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
			display: block;
		}
		.header2{
			display: none;
		}
		.header3{
			display: none;
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
			line-height: 90px;
			color: white;
			font-size: 45px;
			width: 20%;
			font-family: "微软雅黑";
			text-align: center;
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
			display: block;
			background-color: white;
		}
		/*.refused{
			width: 100%;
			display: none;
			background-color: white;
		}
		.berefused{
			width: 100%;
			display: none;
			background-color: white;
		}*/
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
			cursor:pointer;
		}
		.active{
			color: rgb(237,101,41);
			border-bottom: 10px solid rgb(237,101,41);
		}
	</style>
	<body>
		<div class="header header1">被拒绝订单</div>

		<div class="search">
			<input type="text" placeholder="单据编号/收货方/发货方" class="btn1">
			<div class="btn2">搜索</div>
			<input type="hidden" id="OpenId" value="<%=GetUrlPara( "OpenId", false )%>">
		</div>
		
		<ul class="" name="finished" view-id='{ id:"Dtms_0010",cross:"false", model:"finished", rowIdentClass:"finished", paras:[]}'>
		</ul>

		<ul class="" name="refused" view-id='{ id:"Dtms_0012",cross:"false", model:"refused", rowIdentClass:"refused", paras:[]}'>
		</ul>

		<ul class="" name="berefused" view-id='{ id:"Dtms_0013",cross:"false", model:"berefused", rowIdentClass:"berefused", paras:[]}'>
		</ul>

		<div class="page"></div>
            <div name="first-ds-pag">
                <div style="text-align:center;display:none">
                    <ul class="pag pagination">
                        <li class="bord_li prev"><a href="#">
                            </a>
                        </li>
                        <li class="bord_li next"><a href="#">
                            </a>
                        </li>
                        <li class="bord_li border_li_marg showrec">每页<span class="pagesize"></span>条 ， 共<span class="recamount"></span>条</li>
                    </ul>
                </div>
            </div>   
		<!--已完成订单-->
		<script id="finished" type="text/html">
			<li class="order">
				<a>
					<input type="hidden" class="orderID" value={{id}}>
					<input type="hidden" class="combined" value={{Combined}}>
					<div class="transdate">
						<div class="transdatemark"><img src="img/schedule.png"></div>
						<div class="pickdate"><span>提货时间</span></div>
						<div class="deliverydate"><span>送货时间</span></div>
						<div class="pickdate1"><span>{{ToTime}}</span></div>
						<div class="deliverydate1"><span>{{FromTime}}</span></div>
					</div>
					<div class="transaddress">
						<div class="transaddressmark"><img src="img/location.png"></div>
						<div class="transaddress1"><span>发货地址:{{FromAddress}}</span></div>
						<div class="transaddress2"><span>收货地址:{{ToAddress}}</span></div>
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
						<div class="weight1"><span>{{Weight}}吨</span></div>
						<div class="volume1"><span>{{Volume}}立方米</span></div>
						<div class="amount1"><span>{{Qty}}</span></div>
					</div>
					<div style="height: 30px;background-image: url(img/013.png);repeat-x;"></div>
				</a>
			</li>	
		</script>

		<!--已拒绝订单-->
		<script id="refused" type="text/html">
			<li class="order">
				<a>
					<input type="hidden" class="orderID" value={{id}}>
					<input type="hidden" class="combined" value={{Combined}}>

					<div class="transdate">
						<div class="transdatemark"><img src="img/schedule.png"></div>
						<div class="pickdate"><span>提货时间</span></div>
						<div class="deliverydate"><span>送货时间</span></div>
						<div class="pickdate1"><span>{{ToTime}}</span></div>
						<div class="deliverydate1"><span>{{FromTime}}</span></div>
					</div>
					<div class="transaddress">
						<div class="transaddressmark"><img src="img/location.png"></div>
						<div class="transaddress1"><span>发货地址:{{FromAddress}}</span></div>
						<div class="transaddress2"><span>收货地址:{{ToAddress}}</span></div>
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
						<div class="weight1"><span>{{Weight}}吨</span></div>
						<div class="volume1"><span>{{Volume}}立方米</span></div>
						<div class="amount1"><span>{{Qty}}</span></div>
					</div>
					<div style="height: 30px;background-image: url(img/013.png);repeat-x;"></div>
				</a>
			</li>	
		</script>

		<!--被拒绝订单-->
		<script id="berefused" type="text/html">
			<li class="order">
				<a>
					<input type="hidden" class="orderID" value={{Orderid}}>
					<input type="hidden" class="combined" value={{Combined}}>

					<div class="transdate">
						<div class="transdatemark"><img src="img/schedule.png"></div>
						<div class="pickdate"><span>提货时间</span></div>
						<div class="deliverydate"><span>送货时间</span></div>
						<div class="pickdate1"><span>{{ToTime}}</span></div>
						<div class="deliverydate1"><span>{{FromTime}}</span></div>
					</div>
					<div class="transaddress">
						<div class="transaddressmark"><img src="img/location.png"></div>
						<div class="transaddress1"><span>发货地址:{{fromAddress}}</span></div>
						<div class="transaddress2"><span>收货地址:{{toAddress}}</span></div>
					</div>
					<div class="transperson">
						<div class="transpersonmark"><img src="img/person.png"></div>
						<div class="transperson1"><span>收货方</span></div>
						<div class="transperson2"><span>发货方</span></div>
						<div class="transperson1name"><span>{{endusername}}</span></div>
						<div class="transperson2name"><span>{{CustomerName}}</span></div>
					</div>
					<div class="description">
						<div class="descriptionmark"><img src="img/book.png"></div>
						<div class="weight"><span>总重量</span></div>
						<div class="volume"><span>总体积</span></div>
						<div class="amount"><span>总数量</span></div>
						<div class="weight1"><span>{{TotalWeight}}吨</span></div>
						<div class="volume1"><span>{{TotalVolume}}立方米</span></div>
						<div class="amount1"><span>{{TotalAmounts}}</span></div>
					</div>
					<div style="height: 30px;background-image: url(img/013.png);repeat-x;"></div>
				</a>
			</li>	
		</script>
	</body>
	<script type="text/javascript">
		seajs.use('/assets/NSF/js/NSF.System.Data.js', BeRefusedList);
	</script>
</html>
