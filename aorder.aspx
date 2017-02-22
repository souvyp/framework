<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<META HTTP-EQUIV="expires" CONTENT="0">
		<meta name="viewport" content="inital-scale=1.0,user-scalable=no;">		
		<title>待接收订单详情</title>
		<link href="css/a01-a0102.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="assets/js/jquery-1.11.1.min.js"></script>
		<script language="javascript" src="js/index.js" ></script>
		<script language="javascript" src="assets/js/sea.js" ></script>
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
		    height: 100px;	
			margin: 0 auto;
			margin-bottom: 20px;
		}
		.recbtn{
			width:46%;
			height: 100px;
			line-height: 100px;
			border-radius: 4px;
			background-color: rgb(235,102,43);
			border: 0;
			font-size: 45px;
			color: white;
			font-weight: bold;
			margin-left: 2%;
			float: left;
			text-align: center;
		}
		.comfbtn{
			width:46%;
			height: 100px;
			line-height: 100px;
			background-color: rgb(102,102,102);
			border-radius: 4px;
			border:0;
			font-size: 45px;
			color: white;
			font-weight: bold;
			margin-left: 3%;
			float: left;
			text-align: center;
		}
		.quxiao{
			width: 48% !important;
			margin: 20px 0 0 0;
			padding: 0;
			height: 80px;
			line-height: 80px;
			background-color: rgb(102,102,102) !important;
			float: left;
			border-radius: 4px;
			text-align: center;
			color: white;
			font-size: 35px;
		}
		.queren{
			width: 48% !important;
			float: right;
			height: 80px;
			line-height: 80px;
			margin: 20px 20px 0 0;
			padding: 0;
			background-color: rgb(235,102,43) !important;
			border-radius: 4px;
			text-align: center;
			color: white;
			font-size: 35px;
		}
		li{
			list-style-type: none;
		}
	</style>
	<body code="aorder">
		 
		<input type="hidden" id="OpenId" value="<%=GetUrlPara( "OpenId", false )%>">
		<div class="deny" id="refuse">	
			<p style="font-weight: bold;">
				<span style="font-weight: bold;background-color: rgb(245,245,245);color: rgb(235,102,43)">|</span>
				 拒绝原因
			</p>
			<p style="border: 0;">请您输入拒绝接单的原因。</p>
			<textarea id="Description"></textarea>
			<div class="quxiao" onclick="Close('refuse')">取消</div>
			<div class="queren" onclick="OrderAccept(0, 1)">确认</div>
		</div>
		<div id="main">
			<ul  name="orderDetail"></ul>
			<ul  name="orderGoods"></ul>
			<div class="btn2">
	          <div class="comfbtn" onclick="Show('refuse')">拒绝</div>
		      <div class="recbtn" onclick="OrderAccept(1, 1)">接收</div>
	      	</div>
		</div>
		<!--订单详情-->
		<script id="orderDetail" type="text/html">
			<li class="order">
				<input type="hidden" id="TotalCost" value="{{TotalCost}}">
				<div class="identifier">
					<table>
						<tr>
							<td class="titletd"><span>订单编号:</span></td>
							<td class="content1" colspan="3" >{{Code}}</td>
						</tr>
						<tr>
							<td class="titletd"><span>合同编号:</span></td>
							<td class="content1" colspan="3" >{{PactCode}}</td>
						</tr>						
						<tr>
							<td class="titletd"><span>下单时间:</span></td>
							<td class="content2" colspan="" >{{CreateTime}}</td>
							<td class="content2" colspan="" ></td>
							<td class="content2" colspan="" ></td>
						</tr>
					</table>
				</div>
				<div class="defaultdiv">
					<!--详细信息-->
					<div class="information">
						<table>
							<tr>
								<td class="titletd"><span>发货方:</span></td>
								<td class="content1"  colspan="3" >{{Name}}</td>
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

			</li>	
		</script>
		<!--物品详情-->
		<script id="orderGoods" type="text/html">
			<li>
				<!--物品描述-->
				<div class="description">
					<table>
						<tr>
							<td class="titletd"><span>物品名称:</span></td>
							<td class="content2" id="Name" >{{Name}}</td>
							<td class="titletd"><span>数量:</span></td>
							<td class="content2" id="Qty">{{Qty}}</td>
						</tr>
						<tr>
							<td class="titletd"><span>重量:</span></td>
							<td class="content1" id="Weight">{{Weight}}</td>
							<td class="titletd"><span>体积:</span></td>
							<td class="content2" id="Volume">{{Volume}}</td>
						</tr>
					</table>	
				</div>
			</li>
		</script>
	</body>
	<script type="text/javascript">
		seajs.use('/assets/NSF/js/NSF.System.Data.js', OrderDetail);
	</script>
</html>
