<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<META HTTP-EQUIV="expires" CONTENT="0">
		<meta name="viewport" content="inital-scale=1.0,user-scalable=no;">		
		<title>绑定账号</title>
		<link href="css/h.css" rel="stylesheet" type="text/css"/>
		<script language="javascript" src="/assets/js/jquery-1.11.1.min.js"></script>
		<script language="javascript" src="/js/index.js" ></script>
		<script language="javascript" src="/assets/js/sea.js" ></script>
	</head>
	<body code="binding">
		<div id="main">
			<%
			if (OTMS.WxUserWrapper.VerifyUserStatus(false))
			{
			%>
			<style>
			a{
				color: blue;
				font-size: 55px;
			}
			p{
				margin: 0 auto;
				width: 40%;
				margin-top: 25px;
			}
			</style>
				<div id="logo" class="bslogo">
					<img src="img/logo.png">
				</div>
				
				<h1>您已绑定成功！</h1>
				<p><a href="Receiving.aspx?OpenID=<%=GetUrlPara( "OpenId", false )%>" target="_self">1、待接收订单</a></p>
				<p><a href="Pricing.aspx?OpenID=<%=GetUrlPara( "OpenId", false )%>" target="_self">2、待报价订单</a></p>
				<p><a href="Signing.aspx?OpenID=<%=GetUrlPara( "OpenId", false )%>" target="_self">3、待签收订单</a></p>
				<p><a href="Receipt.aspx?OpenID=<%=GetUrlPara( "OpenId", false )%>" target="_self">4、待回单订单</a></p>
			<%
			}
			else
			{
			%>
				<h1>欢迎登录物流源平台</h1>
				<div id="logo">
					<img src="img/logo.png">
				</div>
				
				<div class="inp">
					<div class="inp1"> 
						<img src="img/inp1bg.png">
						<input type="hidden" id="OpenId" value="<%=GetUrlPara( "OpenId", false )%>">
						<input id="zhanghao" type="text" placeholder="物流源帐号">
					</div>
					<div class="inp2">
						<img src="img/inp2bg.png">
						<input id="mima" type="password" placeholder="密码">
					</div>
					<div class="subbtn" style="text-align: center;" onclick="AccountBind()">绑定</div>
				</div>
			<%
			}
			%>
		</div>
	</body>
	<script type="text/javascript">
		seajs.use('/assets/NSF/js/NSF.System.Data.js');
	</script>
</html>