<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<META HTTP-EQUIV="expires" CONTENT="0">
		<meta name="viewport" content="inital-scale=1.0,user-scalable=no;">		
		<title>待按单报价订单详情</title>
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
		text-align: center;
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
	<body code="Pricing">
		<input type="hidden" id="OpenId" value="<%=GetUrlPara( "OpenId", false )%>">
		<div id="main">
			<ul  name="orderDetail"></ul>
		</div>
		<div id="nodata" style="text-align:center;margin-top:50%;font-size:50px;font-farmily:'微软雅黑';letter-spacing:5px;display:none">
 			<img src="/img/tixing.png" style="width:100px !important;height:100px !important;">
 			<br /><br />
 			<p>
	 			 您暂时没有待接收的订单！
 			</p>
    	</div>
		
		<!--订单详情-->
		<script id="orderDetail" type="text/html">
			<li class="order">
				<div class="identifier">
					<table>
						<tr>
							<td class="titletd"><span>订单编号:</span></td>
							<td colspan="3" >
								{{Code}}
								<input type="hidden" id="TotalCost" value="{{TotalCost}}">
								<input type="hidden" class="OrderID required" value="{{OrderID}}">
								<input type="hidden" class="PactCode required" value="{{PactCode}}">
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
							<td class="content2" colspan="" >
								{{CreateTime}}
							</td>
							<td class="content2" colspan="" >
							</td>
							<td class="content2" colspan="" >
							</td>
						</tr>
					</table>
				</div>
				<div class="defaultdiv">
					<!--详细信息-->
					<div class="information">
						<table>
							<tr>
								<td class="titletd"><span>发货方:</span></td>
								<td class="content1"  colspan="3" >{{Name}}
									<input type="hidden" class="Name required" value="{{Name}}">
									<input type="hidden" class="CustomerID required" value="{{CustomerID}}">
								</td>
							</tr>
							<tr>
								<td class="titletd"><span>发货时间:</span></td>
								<td class="content2" colspan="3" >{{FromTime}}</td>
							</tr>
							<tr>
								<td class="titletd"><span>发货地址:</span></td>
								<td colspan="3" >
									{{FromProvince}}{{FromCity}}{{FromDistrict}}  {{From}}
								</td>
							</tr>
							<tr>
								<td class="titletd"><span>是否提货:</span></td>
								<td class="content1">
									{{if IsPick == "0"}}
										否
									{{/if}}									
									{{if IsPick == "1"}}
										是 
									{{/if}}
								</td>		
								<td class="titletd"><span>是否装货:</span></td>
								<td class="content1">
									{{if IsOnLoad == "0"}}
										否
									{{/if}}
									{{if IsOnLoad == "1"}}
										是
									{{/if}}									
								</td>										
							</tr>							
							<tr>
								<td class="titletd"><span>发货电话:</span></td>
								<td class="content1" colspan="3" >{{FromContact}}</td>								
							</tr>
							<tr> 
								<td colspan="4" >
									<!--
										分割线
									-->
									<hr />
								</td>
							</tr>								
							<tr>	
								<td class="titletd"><span>收货方:</span></td>
								<td class="content2"  colspan="3" >{{EndUserName}}</td>
							</tr>
							<tr>
								<td class="titletd"><span>收货时间:</span></td>
								<td class="content1" colspan="3" >{{ToTime}}</td>
							</tr>
							<tr>
								<td class="titletd"><span>收货地址:</span></td>
								<td colspan="3" >
									{{ToProvince}}{{ToCity}}{{ToDistrict}}  {{To}}
								</td>
							</tr>
							<tr>
								<td class="titletd"><span>是否送货:</span></td>
								<td class="content1">
									{{if IsDelivery == "0"}}
										否
									{{/if}}									
									{{if IsDelivery == "1"}}
										是
									{{/if}}
								</td>		
								<td class="titletd"><span>是否卸货:</span></td>
								<td class="content1">
									{{if IsOffLoad == "0"}}
										否
									{{/if}}
									{{if IsOffLoad == "1"}}
										是
									{{/if}}									
								</td>										
							</tr>								
							<tr>
								<td class="titletd"><span>收货电话:</span></td>
								<td class="content2"  colspan="3" >{{ToContact}}</td>
							</tr>
						</table>
					</div>
				</div>

				<div class="third">
					<!--详细信息-->
					<div class="information">
						<table>
							<tr>
								<td class="titletd"><span>计费模式:</span></td>
								<td class="content1" >
									{{if ChargeMode == "1"}}
										重量
									{{else if ChargeMode == "2"}}
										体积
									{{else if ChargeMode == "3"}}
										数量
									{{/if}}
								</td>
								<td class="titletd"><span>价格单位:</span></td>
								<td class="content2" >
									{{if PriceUnit == "1"}}
										公斤
									{{/if}}
									{{if PriceUnit == "2"}}
										吨
									{{/if}}
									{{if PriceUnit == "3"}}
										立方米
									{{/if}}
									{{if PriceUnit == "4"}}
										升
									{{/if}}
									{{if PriceUnit == "5"}}
										个
									{{/if}}
									{{if PriceUnit == "6"}}
										托
									{{/if}}
									{{if PriceUnit == "7"}}
										台
									{{/if}}
									{{if PriceUnit == "8"}}
										箱
									{{/if}}
									{{if PriceUnit == "9"}}
										包
									{{/if}}
									{{if PriceUnit == "10"}}
										捆
									{{/if}}
									{{if PriceUnit == "11"}}
										辆
									{{/if}}
									{{if PriceUnit == "12"}}
										件
									{{/if}}
									{{if PriceUnit == "13"}}
										袋
									{{/if}}
									{{if PriceUnit == "14"}}
										架
									{{/if}}
									{{if PriceUnit == "15"}}
										盒
									{{/if}}		
									{{if PriceUnit == "16"}}
										桶
									{{/if}}	
									{{if PriceUnit == "17"}}
										其他
									{{/if}}										
								</td>
							</tr>
							<tr>
								<td class="titletd"><span>运输模式:</span></td>
								<td class="content2" >
									{{if TransportMode == "1"}}
										零担
									{{else if TransportMode == "2"}}
										整车
									{{/if}}
								</td>
								<td class="titletd"><span>货物分类:</span></td>
								<td class="content1" >
									{{if GoodsCategory == "1"}}
										普通货物
									{{/if}}
									{{if GoodsCategory == "3"}}
										危险品
									{{/if}}
									{{if GoodsCategory == "7"}}
										温控货物
									{{/if}}
								</td>
							</tr>
							<tr>
								<td class="titletd"><span>包装方式:</span></td>
								<td class="content1" >
									{{if PackageMode == "1"}}
										散箱
									{{else if PackageMode == "2"}}
										托盘或木箱
									{{else if PackageMode == "3"}}
										托盘、木箱或不规则形状
									{{/if}}
								</td>
								<td class="titletd"><span>运输方式:</span></td>
								<td class="content2" >
									{{if ShipMode == "1"}}
										市内
									{{else if ShipMode == "2"}}
										长途
									{{/if}}
								</td>
							</tr>
							<tr>
								<td class="titletd"><span>是否保价:</span></td>
								<td colspan="3">
									{{if IsInsurance == "1"}}
										是
									{{else}}
										否
									{{/if}}
								</td>
							</tr>
							<!--<tr>
								<td class="titletd" colspan=""><span>发货方标记名称:</span></td>
								<td colspan="3" >{{CustomerSymbolName}}</td>
							</tr>-->
						</table>
					</div>
				</div>
				<div class="four">
					<div class="information">
						<table>
							<tr>
								<td class="titletd"><span>重量补差:</span></td>
								<td class="content1" >{{WeightAddition}}公斤</td>
								<td class="titletd"><span>体积补差:</span></td>
								<td class="content1" >{{VolumeAddition}}立方米</td>
							</tr>
							<tr>
								<td class="titletd">合计</td>
								<td class="content1" colspan="3" ></td>
							</tr>
							<tr>
								<td class="titletd"><span>总重量:</span></td>
								<td class="content1" >{{Weight}}公斤</td>
								<td class="titletd"><span>总体积:</span></td>
								<td class="content1" >{{Volume}}公斤</td>
							</tr>
							<tr>
								<td class="titletd"><span>总数量:</span></td>
								<td class="content1" colspan="3" >{{Qty}}</td>
							</tr>
						</table>
					</div>
				</div>
			</li>	
		</script>
		
		<div style="height: 30px;background-image: url(img/013.png);repeat-x;"></div>
		<input class="Type required" type="hidden" value="1">
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
						<div class="tijiao" style="background-color: rgb(235,102,43);" onclick="NoZero()">提 交 报 价</div>
					</td>
				</tr>
			</table>
		</div>
	</body>
	<script>
		seajs.use('/assets/NSF/js/NSF.System.Data.js', OrderDetail);
	</script>
</html>