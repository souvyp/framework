<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<META HTTP-EQUIV="expires" CONTENT="0">
		<meta name="viewport" content="inital-scale=1.0,user-scalable=no;">		
		<title>待补充订单详情</title>
		<link href="css/a01-a0102.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/assets/js/jquery-1.11.1.min.js"></script>
		<script language="javascript" src="/js/index.js" ></script>
		<script language="javascript" src="/assets/js/sea.js" ></script>
	</head>
	<style>
	.append{
		display: none;
	}
	.continue{
		display: none;
	}
	body{
		margin: 0;
		padding: 0;
	}
	.accord{
		font-size: 10px;
		background-color: white;
		margin-top: 10px;
		width: 98%;
		margin: 0 auto;
	}
	.accord p{
		background-color: white;
	}
	.accord table{
		width: 100%;
		font-size: 35px;
	}
	.accord table tr td{
		text-align: center;
	}
	.accord table input{
		border:0;
		border-radius: 2px;
		color:white;
		font-family: "微软雅黑";
		font-weight: bold;
	}
	.td1{
		width:30%;
	}
	.td2{
		width:30%;
	}
	.td3{
		width:40%;
	}
	.unit{
		height: 48px;
		border: 1px solid grey;
		width: 96%;
		position: relative;
	}
	.unit p{
		height: 48px;
		line-height: 48px;
		position: absolute;top:0;right: 1%;
	}
	.append{
		width: 98%;
		padding: 1%;
	}	
	.append input{
		height:48px;
		width: 90%;
		position: absolute;top: 0;left: 0;
		border: 0;
	}
	.append select{
		height: 50px;
		width: 95%;
		font-size: 35px;
	}
	.append textarea{
		width: 98%;
		font-size: 35px;
	}
	.append table{
		width: 98%;
	}
	.append table td{
		text-align: left;
		font-size: 35px;
		height: 35px;
		line-height: 35px;
		vertical-align: middle;
	}
	.continue{
		width: 96%;
		margin-left: 2%;
		border: 2px dashed blue;
		height: 150px;
		margin-top: 20px;
	}
	.continuemark{
		height: 50px;
		line-height: 50px;
		margin-top: 50px;
		position: relative;
		margin-left: 45%;
	}
	.continuemark span{
		font-size: 35px;
	}
	.continuemark img{
		position: absolute;top: 6px;
	}
	.buchong{
		background-color: rgb(16,128,194);
		height:100px;
		width: 98%;
		line-height: 100px;
		font-size: 45px;
		margin-bottom: 30px;
		margin-top: 20px;
		color:white;
	}
	.tijiao{
		background-color: rgb(235,102,43);
		height: 100px;
		width: 98%;
		line-height: 100px;
		font-size: 45px;
		margin-bottom: 30px;
		margin-top: 20px;
		color:white;
	}

	li{
		list-style-type: none;
	}
	.appendcopys{
		width: 98%;
		padding: 1%;
	}	
	.appendcopys input{
		height:48px;
		width: 90%;
		position: absolute;top: 0;left: 0;
		border: 0;
	}
	.appendcopys select{
		height: 50px;
		width: 95%;
		font-size: 35px;
	}
	.appendcopys textarea{
		width: 98%;
		font-size: 35px;
	}
	.appendcopys table{
		width: 98%;
	}
	.appendcopys table td{
		text-align: left;
		font-size: 35px;
		height: 35px;
		line-height: 35px;
		vertical-align: middle;
	}
	li{
		list-style-type: none;
	}
	</style>
	<body code="Pricing">
		<div id="header">待补充订单详情</div>
		<input type="hidden" id="OpenId" value="<%=GetUrlPara( "OpenId", false )%>">
		<div id="main">
			<ul  name="orderDetail"></ul>
			<ul  name="Cost" ></ul>
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
								<input type="hidden" class="OrderID required" value="{{OrderID}}">
								<input type="hidden" class="Type required" value="3">
							</td>
						</tr>
						<tr>
							<td class="titletd"><span>合同编号:</span></td>
							<td class="content1" >
								{{PactCode}}
								<input type="hidden" class="PactCode required" value="{{PactCode}}">
							</td>
							<td class="titletd"><span>下单时间:</span></td>
							<td class="content2" >{{CreateTime}}</td>
						</tr>
					</table>
				</div>
				<div class="defaultdiv">
					<!--详细信息-->
					<div class="information">
						<table>
							<tr>
								<td class="titletd"><span>发货方:</span></td>
								<td class="content1" >
									{{Name}}
									<input type="hidden" class="Name required" value="{{Name}}">
									<input type="hidden" class="CustomerID required" value="{{CustomerID}}">
								</td>
								<td class="titletd"><span>收货方:</span></td>
								<td class="content2" >{{EndUserName}}</td>
							</tr>
							<tr>
								<td class="titletd"><span>送货时间:</span></td>
								<td class="content2" >{{FromTime}}</td>
								<td class="titletd"><span>提货时间:</span></td>
								<td class="content1" >{{ToTime}}</td>
							</tr>
							<tr>
								<td class="titletd"><span>发货电话:</span></td>
								<td class="content1" >{{FromContact}}</td>
								<td class="titletd"><span>收货电话:</span></td>
								<td class="content2" >{{ToContact}}</td>
							</tr>
							<tr>
								<td class="titletd"><span>附加要求:</span></td>
								<td colspan="3">
									{{if IsPick == "1"}}
										提货 
									{{/if}}
									{{if IsDelivery == "1"}}
										送货
									{{/if}}
									{{if IsOnLoad == "1"}}
										装货
									{{/if}}
									{{if IsOffLoad == "1"}}
										卸货
									{{/if}}
								</td>
							</tr>
							<tr>
								<td class="titletd"><span>发货地址:</span></td>
								<td colspan="3" >{{From}}</td>
							</tr>
							<tr>
								<td class="titletd"><span>收货地址:</span></td>
								<td colspan="3" >{{To}}</td>
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
								<td class="content2" >{{EndUserName}}</td>
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
		
		<!--订单费用-->
		<script id="Cost" type="text/html">
			<li>
				<div class="accord">
					<table>
						<tr>
							<td colspan="4"><p><img src="img/redpoint.png">根据你的合约报价匹配出如下价格:</p></td>
						</tr>
						<tr>
							<td class="titletd"><span>零担费:</span></td>
							<td class="content1"><span>{{LessLoad}}</span></td>
							<td class="titletd"><span>整车费:</span></td>
							<td class="content2"><span>{{FullLoad}}</span></td>
						</tr>
						<tr>
							<td class="titletd"><span>提货费:</span></td>
							<td class="content2"><span>{{Pick}}</span></td>
							<td class="titletd"><span>送货费:</span></td>
							<td class="content1"><span>{{Delivery}}</span></td>
						</tr>
						<tr>
							<td class="titletd"><span>装货费:</span></td>
							<td class="content2"><span>{{OnLoad}}</span></td>
							<td class="titletd"><span>卸货费:</span></td>
							<td class="content1"><span>{{OffLoad}}</span></td>
						</tr>
						<tr>
							<td class="titletd"><span>附加费:</span></td>
							<td class="content2"><span>{{Addition}}</span></td>
							<td class="titletd"><span>保险费:</span></td>
							<td class="content1"><span>{{InsuranceCost}}</span></td><br />
						</tr>
						<tr>
							<td class="titletd"><span>税费:</span></td>
							<td class="content2"><span>{{Tax}}</span></td>
							<td class="titletd"><span>合计:</span></td>
							<td colspan=""><p style="color: #FF0000;"><span>{{TotalAmounts}}</span></p></td>
						</tr>
					</table>
				</div>
			</li>
		</script>
		
		<div style="height: 30px;background-image: url(img/013.png);repeat-x;"></div>
				
		<div class="AdditionCost append" >
			<table class="addition">
				<tr>
					<td class="td1">补充报价:</td>
					<td class="td2">
						<select class="AdditionType">
							<option value="1">上楼费</option>
							<option value="2">下楼费</option>
							<option value="3">左楼费</option>
							<option value="4">右楼费</option>
						</select>
					</td>
					<td class="td3">
						<div class="unit"><input type="text" value="" class="AdditionPrice"><p>元</p></div>
					</td>
				</tr>
				<tr>
					<td class="td1">说明：</td>
					<td class="td2" colspan="2">
						<textarea class="Description"></textarea>
					</td>
				</tr>
			</table>
		</div>
				
		<div class="appendcopy"></div>
		
		<div class="continue">
		<div class="continuemark"><img src="img/addition.png"><span><a href="javascript:void(0)" onclick="Continue()">继续补充报价</a></span></div>
		</div>

		<div class="accord">
			<table>	
				<tr>
					<td colspan="2">
						<div class="buchong" onclick="Addition()">补充报价</div>
					</td>
					<td colspan="2">
						<div class="tijiao" onclick="back()" >返回</div>
					</td>
				</tr>
			</table>
		</div>
		
	</body >
	
	<script>
		seajs.use('/assets/NSF/js/NSF.System.Data.js', function() {
			OrderDetail();
			Cost();
		});


		function Continue() {
			var _table = $('.addition:first').clone();
			$('div.AdditionCost').append(_table);
		}

		
		function Addition(){
			$(".AdditionCost").show();
			$('.continue').show();
		}
	</script>
</html>
