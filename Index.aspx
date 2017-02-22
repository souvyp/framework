<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Libs/Environment.aspx.cs" Inherits="OTMS.Environment" %>
<!doctype html>
<html>
	<head>		
		<meta name="viewport" content="inital-scale=1.0,user-scalable=no;">		
		<title></title>
		<script language="javascript" src="/assets/js/jquery-1.11.1.min.js"></script>
 		<script language="javascript" src="/assets/NSF/js/NSF.0.0.4.min.js"></script>
	</head>
	<style>
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
	<body>	
		<div class="hide body_x">
	 		<div class="font_c width_w padding_300">
	 			<img src="/img/tixing.png">
	 			<br /><br />
	 			 您已经接收了此订单！
	 		</div>
	 		<div class="font_c">
	 			<a class="index_a" href="">
	 				去查看订单>>
	 			</a>
	 		</div>	
		</div>

	</body>
	
	<script type="text/javascript">
	$(document).ready(function(){  
		//获取网页的地址　　　　
	   	var orderId = NSF.UrlVars.Get('id', location.href); 
	   	var openid = NSF.UrlVars.Get('openid', location.href); 
	   	var conbined = NSF.UrlVars.Get('conbined', location.href); 
 
 	    var pmls = [{}];
   
	    pmls[0].namespace = 'protocol';
	    pmls[0].cmd = 'data';
	    pmls[0].version = 1;
	    pmls[0].id = 'Dtms_0107';
	
	    var _paras = [{}];
	    _paras[0].name = 'id';
	    _paras[0].value = orderId;
 
	    pmls[0].paras = _paras;
	
   		NSF.System.Network.Ajax('/Portal.aspx',
        	NSF.System.Json.ToString(pmls),
	        'POST',
	        false,
	        function(result, data) {
	            if (data[0].result) {
	            	//var orderId = data[0].rs[0].rows[0].orderid; 
	            	var s = data[0].rs[0].rows[0].statu;
	            	var _TotalCost = data[0].rs[0].rows[0].TotalCost;
	            	var _BePrice = data[0].rs[0].rows[0].BePrice;
	            	var _customercompanyid = data[0].rs[0].rows[0].customercompanyid;
	            	 
 					//$('.index_a').attr('href','pricingbyorder.aspx?openid='+ openid +'&id='+ orderId +'&conbined='+ conbined+'');
				    if(conbined == 0){
		            	if(s == 1){		//待接收
		            		location.href = 'aorder.aspx?openid='+ openid +'&id='+ orderId;
		            	}else if(s == 2){		//待签收
		            		$('.body_x').removeClass('hide');
		            		if (_TotalCost == '0.00' && _BePrice == '0') {
		            			$('.index_a').attr('href','pricingbyorder.aspx?openid='+ openid +'&id='+ orderId);
		            		} else {
			            		$('.index_a').attr('href','infoordertosign.aspx?openid='+ openid +'&id='+ orderId);
		            		}
		            	}else if(s == 4){		//待回单
		            		$('.body_x').removeClass('hide');
		            		if (_TotalCost == '0.00' && _BePrice == '0') {
		            			$('.index_a').attr('href','pricingbyorder.aspx?openid='+ openid +'&id='+ orderId);
		            		} else {
			            		$('.index_a').attr('href','ordertoreceipt.aspx?openid='+ openid +'&id='+ orderId);
		            		}
		            	}else if(s == 8){		//待收费
		            		$('.body_x').removeClass('hide');
		            		if (_TotalCost == '0.00' && _BePrice == '0') {
		            			$('.index_a').attr('href','pricingbyorder.aspx?openid='+ openid +'&id='+ orderId);
		            		} else {
			            		$('.index_a').attr('href','infoordertocharge.aspx?openid='+ openid +'&id='+ _customercompanyid);
		            		}
		            	}else if(s > 8){
		            		$('.body_x').removeClass('hide');
		            		$('.index_a').attr('href','Completed_edit.aspx?openid='+ openid +'&id='+ orderId);
		            	}			    	
				    }else{
				    	if (s == 1) {
							location.href = 'orders.aspx?openid=' + openid + '&id=' + orderId;
				    	} else {
							$('.body_x').removeClass('hide');
							if (_TotalCost == '0.00' && _BePrice == '0') {
								$('.index_a').attr('href','DocCombined.aspx?openid='+ openid +'&id='+ orderId);
		            		} else {
			            		$('.index_a').attr('href','CombinedOrder.aspx?openid='+ openid +'&id='+ orderId);
		            		}
				    	}
				    }	            
	            }
	        });	
	});
	
			
	
	</script>
</html>