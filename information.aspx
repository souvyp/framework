<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<META HTTP-EQUIV="expires" CONTENT="0">
		<meta name="viewport" content="inital-scale=1.0,user-scalable=no;">		
		<title>我的资料</title>
		<link href="css/h.css" rel="stylesheet" type="text/css"/>	
		<script language="javascript" src="/assets/js/jquery-1.11.1.min.js"></script>
		<script language="javascript" src="/js/index.js" ></script>
		<script language="javascript" src="/assets/js/sea.js" ></script>
	</head>
	<style>
		*{
			background-color: rgb(250,250,250);
		}
		ul{
			list-style: none;
		}
		li{
			list-style-type: none;
		}
		#Name{
			background-color: white;
		}
		#Phone{
			background-color: white;
		}
	</style>
	<body>
		<input type="hidden" id="OpenId" value="<%=GetUrlPara( "OpenId", false )%>">
		<div id="main" >
			<ul name="information" view-id='{ id:"company_reading",cross:"false", model:"information", rowIdentClass:"information", paras:[]}'></ul>
		</div>
		<script id="information" type="text/html">
			<li >
				<a href="javascript:void(0)" onclick="InfoChange(0)"  target="_self">
					<div class="user">
						<div class="img_h04">
							{{if Logo == ''}}
								<img src='/img/headpic.png' class="photos">
							{{else}}
								<img src={{Logo}} class="photos">
							{{/if}}
						</div>
						
						<div class="ul_h04">
							<ul>
								<li>用户名称：<span id="Name">{{Contact}}</span></li>
								<li>用户电话：<span id="Phone">{{Phone}}</span></li>
							</ul>
						</div>
						
						<div class="a_h04">
							<img src="img/right.png" class="rightbtn rightbtn1" style="margin-top: 85px;">
						</div>
					</div>
				</a>
				<div style="height: 100px;width: 100%;"></div>
				<a onclick="InfoChange(1)"  target="_self">
					<div class="info chuanzheng">
					<span>公司名称：<span id="Fax">{{Fax}}</span></span>
						<img src="img/right.png" class="rightbtn">
					</div>
				</a>
				<a onclick="InfoChange(2)"  target="_self">
					<div class="info youbian">
					<span>公司编号：<span id="Zip">{{Zip}}</span></span>
						<img src="img/right.png" class="rightbtn">
					</div>
				</a>
				<a onclick="InfoChange(3)" target="_self">
					<div class="info youxiang">
					<span>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：<span id="Mail">{{Mail}}</span></span>
						<img src="img/right.png" class="rightbtn">
					</div>
				</a>
				<a onclick="InfoChange(4)" target="_self">
					<div class="info dizhi">
					<span>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址：<span id="Address">{{Address}}</span></span>
						<img src="img/right.png" class="rightbtn">
					</div>
				</a>
				<a onclick="InfoChange(5)"  target="_self">
					<div class="info kaihuhang">
					<span style="letter-spacing:10px">开户行：<span id="Bank">{{Bank}}</span></span>
						<img src="img/right.png" class="rightbtn">
					</div>
				</a>
				<a onclick="InfoChange(6)" >
					<div class="info zhanghao">
					<span>银行帐号：<span id="BankAccount">{{BankAccount}}</span></span>
						<img src="img/right.png" class="rightbtn">
					</div>
				</a>
			</li>	
		</script>
	</body>
	<script type="text/javascript">
		seajs.use('/assets/NSF/js/NSF.System.Data.js', Information);
	</script>
</html>