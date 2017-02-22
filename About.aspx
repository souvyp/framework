<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<META HTTP-EQUIV="expires" CONTENT="0">
		<meta name="viewport" content="inital-scale=1.0,user-scalable=no;">		
		<title>关于物流源</title>
		<link href="css/h.css" rel="stylesheet" type="text/css"/>	
		<script language="javascript" src="/assets/js/jquery-1.11.1.min.js"></script>
		<script language="javascript" src="/js/index.js" ></script>
		<script language="javascript" src="/assets/js/sea.js" ></script>
	</head>
	<style>
 
 
		.info img{
			width: 60%;
		}
	 
	</style>
	<body>
		<div id="main" >
			<ul name="information" view-id='{ id:"company_reading",cross:"false", model:"information", rowIdentClass:"information", paras:[]}'></ul>
		</div>
		<script id="information" type="text/html">
			 
				 
				<div style="height: 100px;width: 100%;"></div>
					<div class="info chuanzheng" style="margin-bottom: 210px;">
					<span><img src="/img/abu.png"</span>
						 
					</div>
					<div class="info chuanzheng">
					<span>版本：<span id="Fax">物流源V 0.53</span></span>
						 
					</div>
				 
					<div class="info youbian">
					<span>网址：<span id="Zip">www.wlyuan.com.cn</span></span>
						 
					</div>
				 
					<div class="info youxiang">
					<span>版权所有：<span id="Mail">上海南软信息科技有限公司</span></span>
						 
					</div>
				 
				 
			 
			 
		</script>
	</body>
	<script type="text/javascript">
		seajs.use('/assets/NSF/js/NSF.System.Data.js', Information);
	</script>
</html>