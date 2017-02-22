<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!DOCTYPE html>
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<head>
		<meta charset="UTF-8">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<META HTTP-EQUIV="expires" CONTENT="0">
		<title>扫码签收</title>
		<link href="/css/h.css" rel="stylesheet" type="text/css"/>
		<script language="javascript" src="/assets/js/jquery-1.11.1.min.js"></script>
		<script language="javascript" src="/js/index.js" ></script>
		<script language="javascript" src="/assets/js/sea.js" ></script>
		<script language="javascript" src="/assets/js/droparea.js" ></script>
		<script language="JavaScript" src="/assets/NSF/js/NSF.0.0.4.min.js"></script>
		<style>
		.droparea {position:relative;text-align: center;}
		.multiple {position:relative;height: 20px;}
		.droparea div, .droparea input, .multiple div, .multiple input {position: absolute;top:0;width: 100%;height: 100%;}
		.droparea input, .multiple input {cursor: pointer;opacity: 0;}
		.droparea .instructions, .multiple .instructions {border: 2px dashed #ddd;background: transparent;}
		.droparea .instructions.over, .multiple .instructions.over {border: 2px dashed #000;background: transparent;}
		.droparea .progress, .multiple .progress {position:absolute;bottom: 0;width: 100%;height: 0;color: #fff;background: #6b0;}
		.multiple .progress {width: 0;height: 100%;}
		a{
			color: blue;
			font-size: 55px;
		}
		p{
			margin: 0 auto;
			width: 40%;
			margin-top: 25px;
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
		#telephonenumber{
			height: 75px;
			width: 495px;
			font-size: 40px;
			border: 0;
			padding: 0;
			margin: 0 !important;
			-webkit-appearance:none;
		}
		.subbtn{
			text-align: center;
		}
		</style>
	</head>
		<body>
		<!--<div id="header">扫码签收</div>-->
		<input type="hidden" id="OpenId" value="<%=GetUrlPara( "OpenId", false )%>">
		<div id="main">
			<div class="inp">
				<h1 style="color:#EB6529">签收成功！</h1>
			</div>
		</div>
	</body>
</html>