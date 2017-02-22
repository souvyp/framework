<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<META HTTP-EQUIV="expires" CONTENT="0">
		<meta name="viewport" content="initial-scale=1.0,user-scalable=no;">		
		<title>已完成订单详情</title>
		<link href="css/a01-a0102.css" rel="stylesheet" type="text/css">
		<script language="javascript" src="/assets/js/jquery-1.11.1.min.js"></script>
		<script language="javascript" src="/js/index.js" ></script>
		<script language="javascript" src="/assets/js/sea.js" ></script>
		<script language="javascript" src="/assets/js/droparea.js" ></script>
	</head>
	<style>
		.droparea {position:relative;text-align: center;}
		.multiple {position:relative;height: 20px;}
		.droparea div, .droparea input, .multiple div, .multiple input {position: absolute;top:0;width: 100%;height: 100%;}
		.droparea input, .multiple input {cursor: pointer;opacity: 0;}
		.droparea .instructions, .multiple .instructions {border: 2px dashed #ddd;background: transparent;}
		.droparea .instructions.over, .multiple .instructions.over {border: 2px dashed #000;background: transparent;}
		.droparea .progress, .multiple .progress {position:absolute;bottom: 0;width: 100%;height: 0;color: #fff;background: #6b0;}
		.multiple .progress {width: 0;height: 100%;}
		li{
			list-style-type:none;
		}
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
			margin: 0 auto;
		}
		.recbtn{
			width:46%;
			height: 100px;
			border-radius: 4px;
			background-color: rgb(235,102,43);
			border: 0;
			font-size: 45px;
			color: white;
			font-weight: bold;
			margin-left: 2%;
		}
		.comfbtn{
			width:46%;
			height: 100px;
			background-color: rgb(102,102,102);
			border-radius: 4px;
			border:0;
			font-size: 45px;
			color: white;
			font-weight: bold;
			margin-left: 3%;
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
		.sign{
		width:95%;
		background-color: white;
		margin-top: 10px;
		padding-top: 10px;
		padding-bottom: 20px;
		margin: 0 auto;
	}
	.sign table{
		width:100%;
		margin: 0 auto;
		font-size: 10px;
		margin-top: 10px;
		padding-bottom: 10px;
	}
	.sign table tr td{
		text-align: left;
	}
	.sign table tr td input{
		width:100%;
		height:90%;
		background-color: white;
		border: 1px solid rgb(189,189,189);
	}
	.signbtn{
		width: 100%;
		height: 100px;
		margin-left: 1%;
		line-height: 100px;
		font-size: 45px;
		border-radius: 4px;
		margin-top: 10px;
		border: 1px solid rgb(235,102,43);
		background-color: rgb(235,102,43);
		color: white;
		font-weight: bold;
		font-family: "微软雅黑";
	}
	.loadrecipt{
		width:98%;
		height: 150px;
		line-height: 150px;
		border-radius: 4px;
		margin: 20px auto;
		display:-webkit-box;
		display:-moz-box;
		display:box;
		-webkit-box-pack: center;
		-webkit-box-align: center; 
		-moz-box-pack: center; 
		-moz-box-align: center;
		background-color: rgb(245,245,245);
		border: 1px dashed rgb(192,192,192);
	}
	.loadrecipt img{
		height:70px;
		width:70px;
		background-color: rgb(245,245,245);
	}
	.loadrecipt span{
		margin: 0 auto;
		font-size: 45px;
		height: 70px;
		background-color: rgb(245,245,245);
	}
	</style>
	<body>
		<input type="hidden" id="OpenId" value="<%=GetUrlPara( "OpenId", false )%>">
		<div id="main">
			<ul  name="orderDetail"></ul>
			<ul  name="orderGoods"></ul>
		</div>
		<!--订单详情-->
		<script id="orderDetail" type="text/html">
			<li class="order">
				<input type="hidden" class="photo" id="ReceiptDocPath0" value="{{ReceiptDocPath0}}">
				<input type="hidden" class="photo" id="ReceiptDocPath1" value="{{ReceiptDocPath1}}">
				<input type="hidden" class="photo" id="ReceiptDocPath2" value="{{ReceiptDocPath2}}">
				<div class="identifier">
					<table>
						<tr>
							<td class="titletd"><span>订单编号:</span></td>
							<td colspan="3" >{{Code}}</td>
						</tr>
						<tr>
							<td class="titletd"><span>合同编号:</span></td>
							<td class="content1" >{{PactCode}}</td>
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
								<td class="content1"  colspan="3" >
									{{Name}}
									<input type="hidden" id="CustomerCompanyID" value="{{CustomerCompanyID}}">
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
							<td class="content2" id="Qty">{{Qty}}</td>
						</tr>
						<tr>
							<td class="titletd"><span>总重量:</span></td>
							<td class="content1" id="Weight">{{Weight}}</td>
							<td class="titletd"><span>总体积:</span></td>
							<td class="content2" id="Volume">{{Volume}}</td>
						</tr>
						<tr>
							<td class="titletd"><span >实签数量:</span></td>
							<td class="content1">{{ReceiptQty}}</td>
							<td class="titletd"><span >异常数量:</span></td>
							<td class="content2">{{ExceptionQty}}</td>
						</tr>
					</table>	
				</div>
			</li>
		</script>
		<!--显示照片-->
		<div class="sign">
			<table>
				<tr>
					<td>
						<div class="loadrecipt">
							<input type="file"  name="ReceiptDocPath0" oc="image"  class="droparea" data-post="/ImageUploader.aspx?filename=ReceiptDocPath0&mode=droparea&OpenId=123432433dsds" data-width="50" data-height="50" data-crop="true" f-options="{'code':'ReceiptDocPath0','type':'image','etype':'editable','len':'50'}" data-crop="true" data-file="/UploadFiles/20161020161626026MBST.jpg" />
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="loadrecipt">
							<input type="file" height="134" name="ReceiptDocPath1" oc="image"  class="droparea" data-post="/ImageUploader.aspx?filename=ReceiptDocPath1&mode=droparea&OpenId=123432433dsds" data-width="50" data-height="134" data-crop="true" f-options="{'code':'ReceiptDocPath1','type':'image','etype':'editable','len':'50'}" data-crop="true" />
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="loadrecipt">
							<input type="file"  name="ReceiptDocPath2" oc="image"  class="droparea" data-post="/ImageUploader.aspx?filename=ReceiptDocPath2&mode=droparea&OpenId=123432433dsds" data-width="50" data-height="50" data-crop="true" f-options="{'code':'ReceiptDocPath2','type':'image','etype':'editable','len':'50'}" data-crop="true"  />
						</div>
					</td>
				</tr>
			</table>
		</div>
	</body>
	<script type="text/javascript">
		seajs.use('/assets/NSF/js/NSF.System.Data.js', function() {
			OrderDetail();
			initImage();
			readImage();
		});
	</script>
</html>
