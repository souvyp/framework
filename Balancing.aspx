<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<META HTTP-EQUIV="expires" CONTENT="0">
		<meta name="viewport" content="inital-scale=1.0,user-scalable=no;">		
		<title>待收费订单列表</title>
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
		li{
			list-style-type: none;
		}
		#header{
			width:100%;
			height:120px;
			line-height: 120px;
			background-color:rgb(235,102,43);
			text-align:center;
			font-size: 45px;
			color:white;
			font-weight: bold;
			font-family: "微软雅黑";
		}
		.expenselist{
			width: 98%;
			background-color: white;
			margin-bottom: 10px;
			margin: 0 auto;
			padding-top: 25px;
			padding-bottom: 25px;
		}
		.expenselist table{
			width: 100%;
			background-color: white;
		}
		.expenselist table tr{
			height:60px;
			line-height: 60px;
		}
		.expenselist table tr td{
			font-size: 40px;
			color: rgb(92,92,92);
			background-color: white;
		}
		.expenselist table tr td span{
			background-color: white;
			font-size: 40px;
		}
		.titletd{
			width: 20%;
			font-size: 35px !important;
		}
		.content1{
			width: 30%;
			font-size: 40px !important;
		}
		.content2{
			width: 30%;
			font-size: 40px !important;
		}

	</style>
	<body>
		<!--<div id="header">待收费订单列表</div>-->
		<input type="hidden" id="OpenId" value="<%=GetUrlPara( "OpenId", false )%>">
		<div id="main">
			<ul name="WaitCharge" view-id='{ id:"Dtms_0014",cross:"false", model:"WaitCharge", rowIdentClass:"WaitCharge", paras:[]}'></ul>
		</div>

		<script id="WaitCharge" type="text/html">
			<li class="order">
				<a href="infoordertocharge.aspx?id={{customercompanyid}}&openId=<%=GetUrlPara( "OpenId", false )%>">
					<div class="expenselist">
						<table>
							<tr>
								<td class="titletd" style="color: #666;">发货方名称:</td>
								<td colspan="3" style="color: #333;">{{CompanyName}}</td>
							</tr>
							<tr>
								<td class="titletd" style="color: #666;">联系人:</td>
								<td class="content1" style="color: #333;">{{Contact}}</td>
								<td class="titletd" style="color: #666;">联系电话:</td>
								<td class="content2" style="color: #333;">{{Phone}}</td>
							</tr>
							<tr>
								<td class="titletd" style="color: #666;">所属行业:</td>
								<td class="content1" style="color: #333;">{{Industry}}</td>
								<td class="titletd" style="color: #666;">公司网址:</td>
								<td class="content2" style="color: #333;">{{Web}}</td>
							</tr>
							<tr>
								<td class="titletd" style="color: #666;">发货方ID:</td>
								<td class="content1" style="color: #333;">{{customercompanyid}}</td>
								<td class="titletd" style="color: #666;">待收运费:</td>
								<td class="content2"><span style="color: rgb(235,102,43)">￥{{TotalCost}}</span></td>
							</tr>
						</table>
					</div>
				</a>
				<div style="height: 30px;background-image: url(img/013.png);repeat-x;"></div>
			</li>
		</script>
	</body>
	<script type="text/javascript">
		seajs.use('/assets/NSF/js/NSF.System.Data.js', WaitCharge);
	</script>
</html>
