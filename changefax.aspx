<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<META HTTP-EQUIV="expires" CONTENT="0">
		<meta name="viewport" content="inital-scale=1.0,user-scalable=no;">		
		<title>更改公司名称</title>
		<link href="css/h.css" rel="stylesheet" type="text/css"/>	
		<script language="javascript" src="/assets/js/jquery-1.11.1.min.js"></script>
		<script language="javascript" src="/js/index.js" ></script>
		<script language="javascript" src="/assets/js/sea.js" ></script>
	</head>
	<script type="text/javascript">
		var u = navigator.userAgent;
		var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
		var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
		if(isAndroid){
			var texts = document.getElementsByClassName("shuru");
			for(var i = 0;i < texts.length;i++){
				texts[i].style.width = "93%";
			}
		}
		if(isiOS){
			var texts = document.getElementsByClassName("shuru");
			for(var i = 0;i < texts.length;i++){
				texts[i].style.width = "90%";
			}
		}
	</script> 
	<body code="information">
		<input type="hidden" id="OpenId" value="<%=GetUrlPara( "OpenId", false )%>">
		<div id="logo" class="bslogo">
			<img src="img/logo.png">
		</div>
		<div id="main">
			<div class="inp">
				<input class="shuru ufax" type="text" placeholder="公司名称">
				<div class="subbtn1" onclick="FaxSave()">保存</div>
			</div>
		</div>
		<script type="text/javascript">
		seajs.use('/assets/NSF/js/NSF.System.Data.js', function() {
			 var _data = NSF.System.Json.ToJson(NSF.UrlVars.Get('data',location.href));
			 $('input.ufax').val(_data.fax);
		});
	</script>
	</body>
</html>