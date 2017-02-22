<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
		<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
		<META HTTP-EQUIV="expires" CONTENT="0">
		<meta name="viewport" content="inital-scale=1.0,user-scalable=no;">		
		<title>客户邀请列表</title>
		<link href="css/h.css" rel="stylesheet" type="text/css"/>
		<script language="javascript" src="/assets/js/jquery-1.11.1.min.js"></script>
		<script language="javascript" src="/js/index.js" ></script>
		<script language="javascript" src="/assets/js/sea.js" ></script>
	</head>
	<style>
		li{
			list-style-type: none;
		}
		tr{
			line-height: 50px;
		}
		.active{
			color: rgb(237,101,41);
			border-bottom: 10px solid rgb(237,101,41) !important;
		}
		.options{
			width: 100%;
			height: 120px;
			background-color: rgb(240,240,240);
			margin-top: 0px;
		}
		.options ul{
			margin: 0px;
			padding: 0px;
			list-style: none;
			width: 100%;
			height:120px;
		}
		.options ul li{
			float: left;
			height:120px;
			width: 49.5%;
			text-align: center;
			line-height: 120px;
			font-size: 45px;
			font-family: "微软雅黑";
			color: rgb(100,100,100);
			border-bottom:solid 10px #f0f0f0;
		}	
		.con { display:none;  }
 
		.font_c{
			font-size: 36px; text-align: center; font-family: '微软雅黑';
		}
		.width_w{
			width: 100%; height:210px; 
		}
		.padding_300{
			padding-top: 400px;
		}
		.hide{
			display: none;
		}
 	
	</style>
	<body code="invited">
		<div class="options">
			<ul class="navDiv">
				<li class="active"   role="#0" onclick="InvitedList($(this).attr('role'))">待审核客户</li>
				<li style="width: 1%";>|</li>
				<li class="" role="#1" onclick="InvitedList($(this).attr('role'))" >已审核客户</li>
				 
			</ul>
		</div>		
		<!--<div style="text-align: center; font-weight: normal;" id="header">客户邀请列表</div>-->
		<input type="hidden" id="OpenId" value="<%=GetUrlPara( "OpenId", false )%>">
		<div class="main">
			<div class="">
				<div id="main" class="invi_left" >
					<ul name="inviteWait" view-id='{ id:"acc_0003",cross:"false", model:"inviteWait", rowIdentClass:"inviteWait", paras:[]}'></ul>	
				</div>
				
		    </div> 
			<div class="">
				<div id="main" class="invi_right" >
					<ul name="invited" view-id='{ id:"acc_0005",cross:"false", model:"invited", rowIdentClass:"invited", paras:[]}'></ul>
				</div>
		    </div> 		    
		</div>		
 
	    
        
		<!--已完成订单-->
		<script id="inviteWait" type="text/html">
			<li>
				<div class="kuangkuang">
					<div class="infos">
						<table>
							<tr>
								<td class="titletd">客户ID：</td>
								<td class="content">{{ClientCode}}</td>
							</tr>
							<tr>
								<td class="titletd">客户名称：</td>
								<td class="content">{{OwnerCompanyName}}</td>
							</tr>
							<tr>
								<td class="titletd">联系人：</td>
								<td class="content">{{Contact}}</td>
							</tr>
							<tr>
								<td class="titletd">联系电话：</td>
								<td class="content">{{Phone}}</td>
							</tr>
						</table>
					</div>
					<div class="btns">
						<input type="hidden" id="id" value="{{id}}">
						<input class="refusebtn" type="button" onclick="OrderReceive(2)" value="拒  绝">
						<input class="reciptbtn" type="button" onclick="OrderReceive(1)" value="接  受">
					</div>	
				</div>
				<!--分割线-->
				<div style="height:30px;width:100%;background-image: url(img/013.png);repeat-x;"></div>
			</li>	
		</script>
		<!--已邀请列表-->
		<script id="invited" type="text/html">
			<li>
				<div class="kuangkuang">
					<div class="infos">
						<table>
							<tr>
								<td class="titletd">客户ID：</td>
								<td class="content">{{ClientCode}}</td>
							</tr>
							<tr>
								<td class="titletd">客户名称：</td>
								<td class="content">{{OwnerCompanyName}}</td>
							</tr>
							<tr>
								<td class="titletd">联系人：</td>
								<td class="content">{{Contact}}</td>
							</tr>
							<tr>
								<td class="titletd">联系电话：</td>
								<td class="content">{{Phone}}</td>
							</tr>
						</table>
					</div>
				 
				</div>
				<!--分割线-->
				<div style="height:30px;width:100%;background-image: url(img/013.png);repeat-x;"></div>
			</li>	
		</script>
	</body>
	<script type="text/javascript">
		/*$(".con").eq(0).show();
		$(".li1").eq(0).css({'color':'#eb662b' , 'border-bottom':'solid 10px #eb662b'} );
		$(".li1").click(function(){ 
			$(".li1").css({'color':'#858585', 'border-bottom':'solid 10px #f0f0f0'} );
			$(this).css({'color':'#eb662b' , 'border-bottom':'solid 10px #eb662b'} );
		    var num =$(".li1").index(this);
		    $(".con").hide();
		    $(".con").eq(num).show();
		    $(".con").eq(num)
		})		*/	
		seajs.use('/assets/NSF/js/NSF.System.Data.js', InvitedList);		
	</script>
</html>
