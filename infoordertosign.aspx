<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<meta name="viewport" content="inital-scale=1.0,user-scalable=no;">
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<META HTTP-EQUIV="expires" CONTENT="0">
		<title>待签收订单详情</title>
		<link href="css/a01-a0102.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/assets/js/jquery-1.11.1.min.js"></script>
		<script language="javascript" src="/js/index.js" ></script>
		<script language="javascript" src="/assets/js/sea.js" ></script>
	</head>
	<style>
		li{
			list-style-type:none;
		}
		body{
			width:100%;
		}
		a{
			text-decoration: none;
		}
	.recipt{
		width:70%;
		height: 300px;
		position: fixed;top:30%;left:8%;
		z-index: 10;
		border: 1px solid rgb(211,211,211);
		border-radius: 2px;
		box-shadow: 2px 2px 2px rgb(102,102,102);
		background-color: rgb(245,245,245);
		padding: 5%;
		display:none;
	}
	.recipt p{
		height:40px;
		line-height: 40px;
		font-size: 40px;
		background-color: rgb(245,245,245);
		border-bottom: 1px solid rgb(204,204,204);
		padding-bottom: 20px;
	}
	.recipt input{
		float: left;
		width: 200px;
		height: 100px;
		background-color: rgb(16,128,194);
		border:0;
		border-radius: 2px;
		color: white;
		margin-right: 10px;
		font-size: 40px;
	}
	.sign{
		width:98%;
		margin: 0 auto;
		background-color: white;
		margin-top: 10px;
		padding-top: 10px;
	}
	.sign table{
		width:100%;
		font-size: 35px;
		border-bottom: 1px solid rgb(189,189,189);
		margin-top: 10px;
		padding-bottom: 10px;
	}
	.sign table tr td{
		text-align: left;
	}
	.sign table tr td input{
		width:250px;
		height:60px;
		line-height: 60px;
		font-size: 45px;
		background-color: white;
		border: 1px solid rgb(189,189,189);
	}
	.signbtn{
		width: 98%;
		text-align: center;
		height: 100px;
		line-height: 100px;
		border-radius: 2px;
		margin-left: 1%;
		font-size: 45px;
		border: 1px solid rgb(235,102,43);
		background-color: rgb(235,102,43);
		color: white;
		font-weight: bold;
		font-family: "微软雅黑";
		margin-top: 40px;
		margin-bottom: 40px;
	}
	.quxiao{
		width: 48% !important;
		margin: 20px 0 0 0;
		padding: 0;
		height: 20px;
		background-color: rgb(102,102,102) !important;
		float: left;
		border-radius: 4px;
	}
	.queren{
		width: 48% !important;
		float: right;
		height: 20px;
		margin: 20px 20px 0 0;
		padding: 0;
		background-color: rgb(235,102,43) !important;
		border-radius: 4px;
	}
	.sign span{
		color: rgb(153,153,153);
	}
	</style>
	<body code="Signing">
		<input type="hidden" id="OpenId" value="<%=GetUrlPara( "OpenId", false )%>">
		<div class="recipt" id="recipt">	
			<p style="font-weight: bold;">
				<span style="font-weight: bold;background-color: rgb(245,245,245);color: rgb(235,102,43)">|</span>
				 签收订单
			</p>
			<p style="border: 0;margin-top: 40px;margin-bottom: 30px;padding-left: 20px;">
				是否确定签收订单
			</p>
			<input type="button" class="quxiao" value="取 消" onclick="Close('recipt')">
			<a><input type="button" onclick="OrderSignEdit()" class="queren" value="确 认"></a>
		</div>
		
		<!--<div id="header">待签收订单详情</div>-->
		<div id="main">
			<ul  name="orderDetail"></ul>
			<ul  name="orderGoods"></ul>
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
		<!--物品详情-->
		<script id="orderGoods" type="text/html">
			<li>
				<!--物品描述-->
				<div class="description">
					<table>
						<tr>
							<td class="titletd"><span>物品名称:</span></td>
							<td class="content2" id="Name" >{{Name}}</td>
							<td class="titletd"><span>总数量:</span></td>
							<td class="content2" name="Qty">{{Qty}}</td>
						</tr>
						<tr>
							<td class="titletd"><span>总重量:</span></td>
							<td class="content1" id="Weight">{{Weight}}</td>
							<td class="titletd"><span>总体积:</span></td>
							<td class="content2" id="Volume">{{Volume}}</td>
						</tr>
						<tr>
							<td class="titletd"><span style="color: rgb(230,104,46);">实签数量:</span></td>
							<td class="content1">
								<input type="hidden" name="ListID" value={{ListID}}>
								<input style="height: 40px; float: left; font-size: 35px; width: 80%; padding:0px 10px;" onblur="this.value=this.value.replace(/\D/g,'')" onchange="this.value=this.value.replace(/\D/g,'')" type="text" name="ReceiptQty" class="itactamounts" value={{Qty}}>
							</td>
							<td class="titletd"><span style="color: rgb(230,104,46);">异常数量:</span></td>
							<td class="content2">
								<input style="height: 40px; float: left; font-size: 35px; width: 80%; padding:0px 10px;" onchange="this.value=this.value.replace(/\D/g,'')" type="text" name="ExceptionQty" value="0">
							</td>
						</tr>
					</table>	
				</div>
			</li>
		</script>
		<div style="height: 30px;background-image: url(img/013.png);repeat-x;"></div>
		<div class="signbtn" style="background-color: rgb(235,102,43);" onclick="Show('recipt')">签    收</div>
	 
	</body>
	<script>
		seajs.use('/assets/NSF/js/NSF.System.Data.js', OrderDetail);
	</script>
</html>
