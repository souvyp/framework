function CompletedList() {		//已完成订单列表
	var _openId = $('input#OpenId').val();
	var _order = new NSF.System.Data.Grid();
	_order.Pagination("first-ds-pag", $('div.list-item').find('div[name="first-ds-pag"]'));
	_order.Initialize("/", "finished", $("ul[name='finished']").attr("view-id"), $("ul[name='finished']"));
	var _srcclass;
    $('.combined').each(function() {		//判断是否是合单
    	_srcclass = $(this).val();
    	if (_srcclass == "1") {
    		$(this).parent().attr('href', 'Combined_edit.aspx?OpenId='+ _openId +'&id=' + $(this).prev().val() );
    		$(this).before('<div class="uniorder">' +
    		'<img src="img/uniorder.png" style="position: absolute;right: 1%;top:1%"></div>');
    	} else {
    		$(this).parent().attr('href', 'Completed_edit.aspx?OpenId='+ _openId +'&id=' + $(this).prev().val() );
    	}
    });
}

function RefusedList() {		//已拒绝订单列表
	var _openId = $('input#OpenId').val();
	var _order = new NSF.System.Data.Grid();
	_order.Pagination("first-ds-pag", $('div.list-item').find('div[name="first-ds-pag"]'));
	_order.Initialize("/", "refused", $("ul[name='refused']").attr("view-id"), $("ul[name='refused']"));
	var _srcclass;
    $('.srcclass').each(function() {		//判断是否是合单
    	_srcclass = $(this).val();
    	if (_srcclass == "3") {
    		$(this).parent().attr('href', 'Combined_edit.aspx?OpenId='+ _openId +'&id=' + $(this).prev().val() );
    		$(this).before('<div class="uniorder">' +
    		'<img src="img/uniorder.png" style="position: absolute;right: 1%;top:1%"></div>');
    	} else {
    		$(this).parent().attr('href', 'Completed_edit.aspx?OpenId='+ _openId +'&id=' + $(this).prev().val() );
    	}
    });
}

function BeRefusedList() {			//被拒绝订单列表
	var _openId = $('input#OpenId').val();
	var _order = new NSF.System.Data.Grid();
	_order.Pagination("first-ds-pag", $('div.list-item').find('div[name="first-ds-pag"]'));
	_order.Initialize("/", "berefused", $("ul[name='berefused']").attr("view-id"), $("ul[name='berefused']"));
	var _srcclass;
    $('.combined').each(function() {		//判断是否是合单
    	_srcclass = $(this).val();
    	if (_srcclass == "1") {
    		$(this).parent().attr('href', 'Combined_edit.aspx?OpenId='+ _openId +'&id=' + $(this).prev().val() );
    		$(this).before('<div class="uniorder">' +
    		'<img src="img/uniorder.png" style="position: absolute;right: 1%;top:1%"></div>');
    	} else {
    		$(this).parent().attr('href', 'Completed_edit.aspx?OpenId='+ _openId +'&id=' + $(this).prev().val() );
    	}
    });
}

function LoadPricingList(urlBj) {			//按单报价、补充报价单列表
	var _openId = $('input#OpenId').val();
	if (typeof urlBj == "object") {
        if (location.href.indexOf("#") != -1){
            urlBj = '#' + location.href.split("#")[1];
        } else {
            urlBj = '#' + $(".navDiv").find("li:first").attr("role").split('#')[1];
        }
    }
    if (urlBj == '') {
        location.href= location.href + '#0';
        var urlBj = window.location.hash;
    }
    $('.navDiv li').removeClass('active');
    $('.order').remove();
    if (urlBj) {
        $('.navDiv li[role="' + urlBj + '"]').addClass('active');
    } else {
        $('.navDiv li[role="#0"]').addClass('active');
    }

    var _order = new NSF.System.Data.Grid();
	_order.Pagination("first-ds-pag", $('div.list-item').find('div[name="first-ds-pag"]'));
	
	var _srcclass;
    location.href = location.href.split('#')[0] + urlBj;
    if (urlBj == '#0') {					//已完成订单

        _order.Initialize("/", "Pricing", $("ul[name='Pricing']").attr("view-id"), $("ul[name='Pricing']"));
        $('.srcClass').each(function() {		//判断是否是合单
        	_srcclass = $(this).val();
        	if (_srcclass == "3") {
        		$(this).parent().attr('href', 'DocCombined.aspx?OpenId='+ _openId +'&id=' + $(this).prev().val() );
        		$(this).before('<div class="uniorder">' +
        		'<img src="img/uniorder.png" style="position: absolute;right: 1%;top:1%"></div>');
        	} else {
        		$(this).parent().attr('href', 'Pricingbyorder.aspx?OpenId='+ _openId +'&id=' + $(this).prev().val() );
        	}
        });
    }

    if (urlBj == '#1') {					//已拒绝订单
        _order.Initialize("/", "Addition", $("ul[name='Addition']").attr("view-id"), $("ul[name='Addition']"));
        $('.combined').each(function() {		//判断是否是被拼车订单
        	_srcclass = $(this).val();
        	$(this).parent().attr('href', 'pricingbycontract.aspx?OpenId='+ _openId +'&id=' + $(this).prev().val() );
        	if (_srcclass == "1") {
        		$(this).before('<div class="uniorder">' +
        		'<img src="img/uniorder.png" style="position: absolute;right: 1%;top:1%"></div>');
        	}
        });
    }
}

function Cost() {			//补充报价显示列表
	var grid = new NSF.System.Data.Grid();
	var _orderid = NSF.UrlVars.Get('id', location.href);
	
	$("ul[name='Cost']").attr("view-id",'{ id:"pml_0034",cross:"false", model:"Cost", rowIdentClass:"Cost", paras:[{"name":"did","value":"'+_orderid+'"},{"name":"rows","value":1000},{"name":"page","value":1}]}');
	
	grid.Pagination("first-ds-pag", $('div.list-item').find('div[name="first-ds-pag"]'));
	grid.Initialize("/", "Cost", $("ul[name='Cost']").attr("view-id"), $("ul[name='Cost']"));
}

function OrderDetail() {			//普通单详情
	var _orderid = NSF.UrlVars.Get('id', location.href);

	$("ul[name='orderDetail']").attr("view-id",'{ id:"tms_0028",cross:"false", model:"orderDetail", rowIdentClass:"orderDetail", paras:[{"name":"id","value":"'+ _orderid +'"}]}');
	$("ul[name='orderGoods']").attr("view-id",'{ id:"tms_0102",cross:"false", model:"orderGoods", orderGoods:"orderDetail", paras:[{"name":"did","value":"'+ _orderid +'"}]}');

	var _order = new NSF.System.Data.Grid();
    _order.Pagination("first-ds-pag", $('div.list-item').find('div[name="first-ds-pag"]'));
    _order.Initialize("/", "orderDetail", $("ul[name='orderDetail']").attr("view-id"), $("ul[name='orderDetail']"));
    _order.Initialize("/", "orderGoods", $("ul[name='orderGoods']").attr("view-id"), $("ul[name='orderGoods']"));
}

function CombinedDetail() {			//合单详情
	var _orderid = NSF.UrlVars.Get('id', location.href);
	//拼车单详情
	$("ul[name='CombinedDetail']").attr("view-id",'{ id:"tms_0027",cross:"false", model:"CombinedDetail", rowIdentClass:"CombinedDetail", paras:[{"name":"id","value":"'+ _orderid +'"}]}');
	//普通单详情
	$("ul[name='orderDetail']").attr("view-id",'{ id:"tms_0105",cross:"false", model:"orderDetail", rowIdentClass:"orderDetail", paras:[{"name":"did","value":"'+ _orderid +'"}]}');

	var _order = new NSF.System.Data.Grid();
    _order.Pagination("first-ds-pag", $('div.list-item').find('div[name="first-ds-pag"]'));
    _order.Initialize("/", "CombinedDetail", $("ul[name='CombinedDetail']").attr("view-id"), $("ul[name='CombinedDetail']"));
    _order.Initialize("/", "orderDetail", $("ul[name='orderDetail']").attr("view-id"), $("ul[name='orderDetail']"));
}

function AccountBind() {			//账号绑定
    var pmls = [{}];
    pmls[0].namespace = 'protocol';
    pmls[0].cmd = 'data';
    pmls[0].version = 1;
    pmls[0].id = 'acc_0001';

    var _paras = [{}, {}];
    _paras[0].name = 'Account';
    _paras[0].value = $('input#zhanghao').val();
    _paras[1].name = 'Password';
    _paras[1].value = $('input#mima').val();

    pmls[0].paras = _paras;

    NSF.System.Network.Ajax('/Portal.aspx',
        NSF.System.Json.ToString(pmls),
        'POST',
        false,
        function(result, data) {
            if (data[0].result) {
            	Result(data[0]);
            } else {
            	alert(data[0].msg);
            }
        });
}

function Result( _ret, msg ) {		//显示错误代码
    var _result = {
        "Customer_Result": "0",
        "Supplier_Result": "0",
        "Addr_Result": "0",
        "Car_Result": "0",
        "Driver_Result": "0",
        "EndUser_Result": "0",
        "Goods_Result": "0",
        "GoodsType_Result": "0",
        "Order_Result": "0",
        "Pwd_Result": "0",
        "Company_Result": "0",
        "User_Result": "0",
        "Cost_Result": "0",
        "Back_Result": "0",
        "Flow_Result": "0",
        "Schedule_Result": "",
        "Combine_Result":"",
        "Bind_Result":"",
        "Price_Result":"",
        };
    var _msg = {
        "-510001001": "序列号生成失败",
        "-510001002": "公司名是否重复",
        "-510001003": "新增公司失败",
        "-510002000": "只有管理员有权执行该操作",
        "-510002001": "没有找到对应公司或公司已被审核",
        "-510002002": "审核公司失败",
        "-510002003": "管理员账号是否已经存在",
        "-510002004": "添加管理员账号失败",
        "-510003001": "参数错误",
        "-510003002": "账号不存在",
        "-510003003": "账号密码与原始密码不匹配",
        "-510004001": "参数错误",
        "-510004002": "账号不存在",
        "-510004003": "只有系统管理员能重置公司管理员的密码",
        "-510004004": "公司管理员能重置其他用户的密码",
        "-510004005": "编辑密码失败",
        "-510005001": "不能添加公司管理员",
        "-510005002": "只有公司管理员才能添加用户",
        "-510005003": "用户是否已经存在",
        "-510005004": "新增用户失败",
        "-510005005": "请选择角色",
        "-510006001": "当前用户没有关联公司",
        "-510006002": "当前用户没有修改公司资料的权限",
        "-510006003": "修改失败",
        "-510007001": "当前用户没有关联公司",
        "-510007002": "当前用户没有罗列公司用户的权限",
        "-510008001": "当前用户没有关联公司",
        "-510008002": "当前用户没有添加客户的权限",
        "-510008003": "客户公司编号是否有效",
        "-510008004": "序列号生成失败",
        "-510008005": "客户公司是否存在,添加失败",
        "-510008006": "客户公司是否存在,编辑失败",
        "-510008007": "手动录入的客户公司名称是否重复",
        "-510009001": "当前用户没有关联公司",
        "-510009002": "当前用户没有添加承运商的权限",
        "-510009003": "承运商公司编号是否有效",
        "-510009004": "客户公司是否存在,添加失败",
        "-510009005": "承运商公司不存在(存在编辑, 不存在添加，被拒绝后允许再次添加)",
        "-510009006": "添加事件通知(被邀请成为供应商)失败",
        "-510009007": "序列号生成失败",
        "-510009008": "不能添加自己的公司为承运商",
        "-510010001": "当前用户没有关联公司",
        "-510010002": "当前用户没有添加客户的权限",
        "-510010003": "司机不存在,添加失败",
        "-510010004": "司机是否存在，编辑失败",
        "-510010005": "司机不能重名，姓名相同的司机，应该在姓名中添加标识符，例如：李明(湖南)、李明(山东)等",
        "-510011001": "当前用户没有关联公司",
        "-510011002": "当前用户没有添加客户的权限",
        "-510011003": "车辆不存在,添加失败",
        "-510011004": "车辆是否存在，编辑失败",
        "-510012001": "当前用户没有关联公司",
        "-510012002": "当前用户没有添加客户的权限",
        "-510012003": "司机不存在，新增失败",
        "-510012004": "司机是否存在，编辑失败",
        "-510013001": "当前用户没有关联公司",
        "-510013002": "当前用户没有添加客户的权限",
        "-510013003": "收货人不存在",
        "-510013004": "地址是否存在,添加失败",
        "-510013005": "地址是否存在,编辑失败",
        "-510014001": "当前用户没有关联公司",
        "-510014002": "当前用户没有添加客户的权限",
        "-510014003": "收货人不存在",
        "-510014004": "客户是否存在",
        "-510014005": "来源订单是否存在",
        "-510014006": "编辑模式订单是否存在[只能编辑自己公司的订单]",
        "-510014007": "只能编辑状态为新单据的订单",
        "-510014008": "添加主单信息失败",
        "-510014009": "编辑主单信息失败",
        "-510014010": "承运商是否存在",
        "-510014011": "追加物品信息失败",
        "-510014012": "客户没有填",
        "-510014013": "拆单模式按原单据生成编号失败",
        "-510014014": "修改货物总价值失败",
        "-510014015": "需要投保时货物总价值必须填写",
        "-510015001": "当前用户没有关联公司",
        "-510015002": "当前用户没有添加订单物品的权限",
        "-510015003": "订单不存在",
        "-510015004": "物品不存在",
        "-510015005": "物品添加失败",
        "-510015006": "物品编辑失败",
        "-510015007": "物品不能重复添加",
        "-510016001": "当前用户没有关联公司",
        "-510016002": "当前用户没有添加物品的权限",
        "-510016003": "物品类型是否存在",
        "-510016004": "添加物品失败",
        "-510016005": "编辑物品失败",
        "-510017001": "当前用户没有关联公司",
        "-510017002": "当前用户没有接受订单的权限",
        "-510017003": "订单不存在",
        "-510017004": "被拼车订单已经被接受",
        "-510017005": "接受订单[直接变为已调度]",
        "-510017006": "添加订单流程失败",
        "-510017007": "拒绝订单失败",
        "-510017008": "添加订单流程失败",
        "-510017009": "添加事件通知(订单被拒绝)",
        "-510017010": "添加事件通知(10 订单已接收)",
        "-510018001": "当前用户没有关联公司",
        "-510018002": "当前用户没有分配订单的权限",
        "-510018003": "订单是否存在",
        "-510018004": "订单是否已经被分配",
        "-510018005": "车辆是否存在",
        "-510018006": "司机是否存在",
        "-510018007": "分配订单失败",
        "-510018008": "添加订单流程失败",
        "-510019001": "当前用户没有关联公司",
        "-510019002": "当前用户没有签收订单的权限",
        "-510019003": "订单是否存在",
        "-510019004": "订单是否已经被签收",
        "-510019005": "签收订单失败",
        "-510019006": "添加订单流程失败",
        "-510019007": "更新实签数量，异常数量失败",
        "-510020001": "当前用户没有关联公司",
        "-510020002": "当前用户没有提交订单回单的权限",
        "-510020003": "订单是否存在",
        "-510020004": "订单是否已经回单",
        "-510020005": "回单路径不能为空",
        "-510020006": "订单回单编辑失败",
        "-510020007": "添加订单流程失败",
        "-510020008": "添加已回单事件通知失败",
        "-510020009": "添加上传回单照片事件通知失败",
        "-510021001": "当前用户没有关联公司",
        "-510021002": "当前用户没有添加客户的权限",
        "-510021003": "收件人公司编号是否有效",
        "-510021004": "序列号生成失败",
        "-510021005": "收件人添加失败",
        "-510021006": "收件人修改失败",
        "-510021007": "客户是否存在",
        "-510021008": "收件人名称已存在",
        "-510022001": "当前用户没有关联公司",
        "-510022002": "当前用户没有发送订单的权限",
        "-510022003": "订单是否存在",
        "-510022004": "订单是否已经被发送",
        "-510022005": "承运商是否存在",
        "-510022006": "发送订单失败",
        "-510022007": "添加订单流程失败",
        "-510022008": "指定承运商失败",
        "-510023001": "当前用户没有关联公司",
        "-510023002": "当前用户没有操作承运商的权限",
        "-510023003": "承运商公司编号是否有效",
        "-510023004": "接受失败",
        "-510023005": "拒绝失败",
        "-510023006": "",
        "-510024001": "只有管理员有权执行该操作",
        "-510024002": "公司编号是否有效",
        "-510024003": "启用或禁用失败",
        "-510025001": "当前用户没有关联公司",
        "-510025003": "当前用户没有拆单的权限",
        "-510025003": "来源订单不存在",
        "-510025004": "拆单后原始订单保留，原始订单状态修改为待签收失败",
        "-510025005": "复制原单失败",
        "-510025006": "写订单状态变更记录失败",
        "-510025007": "写订单状态变更记录失败",
        "-510025008": "复制原单物品信息失败",
        "-510026001": "当前用户没有关联公司",
        "-510026002": "当前用户没有添加订单费用的权限",
        "-510026003": "订单是否存在",
        "-510026004": "费用类型是否存在",
        "-510026005": "更新或添加失败",
        "-510028001": "当前用户没有关联公司",
        "-510028002": "当前用户没有启用或禁用客户的权限",
        "-510028003": "客户编号是否有效",
        "-510028004": "启用或禁用失败",
        "-510029001": "当前用户没有关联公司",
        "-510029002": "当前用户没有启用或禁用承运商的权限",
        "-510029003": "承运商编号是否有效",
        "-510029004": "启用或禁用失败",
        "-510030001": "当前用户没有关联公司",
        "-510030002": "当前用户没有启用或禁用最终用户的权限",
        "-510030003": "最终用户编号是否有效",
        "-510030004": "启用或禁用失败",
        "-510031001": "订单号是否存在",
        "-510031002": "下单公司是否是承运商的客户",
        "-510031003": "获取承运商的公司管理员",
        "-510031004": "下单失败",
        "-510031005": "订单的附属表(TMS_OrderCost)",
        "-510031006": "物品信息不能为空",
        "-510032001": "当前用户没有关联公司",
        "-510032002": "当前用户没有添加承运商的权限",
        "-510032003": "当前承运商是否存在",
        "-510032004": "线下承运商是否重名",
        "-510032005": "承运商编辑失败",
        "-510032006": "承运商新增失败",
        "-510033001": "当前用户没有关联公司",
        "-510033002": "当前用户没有打回订单的权限",
        "-510033003": "订单不存在",
        "-510033004": "已经委托供应商承运的单子暂时不能打回",
        "-510033005": "已审核(待分配)",
        "-510033006": "已分配(待签收)",
        "-510033007": "已签收(待回单)",
        "-510033008": "打回订单失败",
        "-510033009": "添加流程失败",
        "-510034001": "当前用户没有关联公司",
        "-510034002": "当前用户没有关闭订单的权限",
        "-510034003": "订单不存在",
        "-510034004": "关闭订单失败",
        "-510034005": "添加流程失败",
        "-510034006": "添加客户关闭委托订单事件通知失败",
        "-510034007": "添加承运商关闭订单事件通知失败",
        "-510035001": "当前用户没有关联公司",
        "-510035002": "当前用户没有添加订单备注的权限",
        "-510035003": "源订单不存在",
        "-510035004": "添加备注失败",
        
        "-510036001": "当前用户没有关联公司",
        "-510036002": "当前用户没有发送订单的权限",
        "-510036003": "原始订单是否存在，是否处于待调度状态(只有运输订单允许调度)",
        "-510036004": "自营",
        "-510036005": "自营,车辆不存在",
        "-510036006": "自营,司机不存在",
        "-510036007": "自营,分配订单失败",
        "-510036008": "自营,添加订单流程失败",
        "-510036009": "检查体积补差、重量补差、数量补差值是否正确",
        "-510036010": "承运商,司机不存在",
        "-510036011": "承运商,分配订单失败",
        "-510036012": "承运商,添加订单流程失败",
        
        "-510037001": "当前用户没有关联公司",
        "-510037002": "当前用户没有发送订单的权限",
        "-510037003": "订单不存在[仅运输订单能发送]",
        "-510037004": "订单已经被发送",
        "-510037005": "在线承运商不存在",
        "-510037006": "线上承运商",
        "-510037007": "添加事件通知(有待接收订单)",
        "-510038002": "当前用户没有关联公司",
        "-510038003": "当前用户没有添加客户的权限",
        "-510039004": "获取当前客户以及影响报价的其他因素失败",
        "-510039005": "委托给承运商的订单，应该使用承运商的报价，主客倒置了一下",
        "-510039006": "计算与当前订单编号配对的承运商客户订单失败",
        "-510039007": "被合单的订单不能单独计算价格",
        "-510040001": "当前用户没有关联公司",
        "-510040002": "请选择需要合单的订单",
        "-510040003": "当前用户没有添加客户的权限",
        "-510040004": "客户默认为自己公司",
        "-510040005": "编辑模式订单是否存在[只能编辑自己公司的订单]",
        "-510040006": "只能编辑状态为新单据的订单",
        "-510040007": "承应商不存在",
        "-510040008": "添加主单信息失败",
        "-510040009": "编辑主单信息失败",
        "-510040010": "现有被合单标记",
        "-510040011": "删除现有拼车记录",
        "-510040012": "添加拼车记录",
        "-510040013": "被合单订单做标记",
        "-510043001": "当前用户没有关联公司",
        "-510043002": "当前用户没有接受单据的权限",
        "-510043003": "单据不存在",
        "-510043004": "修改单据状态失败",
        "-510043005": "添加订单流程失败",
        "-510043006": "获取承运商端的操作者[默认为管理员]",
        "-510043007": "单据被拒绝失败",
        "-510043008": "添加订单流程失败",
        "-510043009": "添加事件通知(13 订单被拒绝)",
        "-510043010": "添加事件通知(14 单据已接收)",
        "-510043011": "更新被合单订单列表的总体积、总重量、总数量失败",
        "-510044001": "当前用户没有关联公司",
        "-510044002": "当前用户没有关闭订单的权限",
        "-510044003": "拼车不存在(只有未经审核的拼车单才能关闭)",
        "-510044004": "关闭订单失败",
        "-510044005": "释放被拼车订单失败",
        "-510045001": "当前用户没有关联公司",
        "-510045002": "没有选择拼车单",
        "-510045003": "当前用户没有添加客户的权限",
        "-510045004": "订单不存在",
        "-510045005": "只待发送的单据能追加",
        "-510045006": "添加拼车记录失败",
        "-510045007": "被合单订单做标记",
        "-510046001": "当前用户没有关联公司",
        "-510046002": "没有选择拼车单",
        "-510046003": "当前用户没有添加客户的权限",
        "-510046004": "订单不存在",
        "-510046005": "只待发送的单据能删除",
        "-510046006": "删除拼车记录失败",
        "-510046007": "源被合单订单清除标记",
        "-510047001": "当前用户没有关联公司",
        "-510047002": "当前用户没有关闭订单的权限",
        "-510047003": "拼车不存在(只有新单据的拼车单才能发送)",
        "-510047004": "发送订单失败",
        "-510049001": "当前用户没有关联公司",
        "-510049002": "当前用户没有修改公司资料的权限",
        "-510049003": "序列号生成失败",
        "-510049004": "获取线下承运商编号失败",
        "-510049005": "参数无效",
        "-510049006": "公司名已存在",
        "-510049007": "添加公司失败",
        "-510050001": "当前用户没有关联公司",
        "-510050002": "当前用户没有修改公司资料的权限",
        "-510050003": "当前是否为线下承运商",
        "-510006001": "当前用户没有关联公司",
        "-510006002": "当前用户没有修改公司资料的权限",
        "-510006003": "当前用户没有修改公司资料的权限",
        "-510006004": "当前用户没有修改线下承运商资料的权限",
        "-510006005": "判断线下承运商公司名是否重复",
        "-510006006": "修改公司信息失败",
        "-510052001": "当前用户没有关联公司",
        "-510052002": "当前用户没有签收订单的权限",
        "-510052003": "订单是否存在",
        "-510052004": "订单是否已经被签收",
        "-510052005": "签收订单失败",
        "-510052006": "添加订单流程失败",
        "-510052007": "更新实签数量、异常数量失败",
        "-510052008": "添加事件通知失败",
        "-510055001": "当前用户没有关联公司",
        "-510055002": "当前用户没有发送订单的权限",
        "-510055003": "当前订单不存在",
        "-510055004": "订单无法被撤回",
        "-510055005": "获取承运商公司的管理员账号失败",
        "-510055006": "修改订单相应字段失败",
        "-510055007": "添加订单流程失败",
        "-510055008": "添加事件通知失败",
        "-510059001": "当前用户没有关联公司",     //个人中心，配置信息(sp_pub_user_EditOrderCfg)
        "-510059002": "当前用户没有修改公司资料的权限",
        "-510059003": "修改配置信息失败",
        "-510059004": "添加配置失败",
        "-510025101": "当前用户没有关联公司",             //待调度拆单，[sp_prv_order_TransportPlan_V2]
        "-510025102": "当前用户没有拆单的权限",
        "-510025103": " 运输订单PrevOrderID是否存在，获取SrcOrderID等订单参数",
        "-510025104": "未拆单不许提交,应直接转入调度",
        "-510025105": "必须拆单，请根据线路或数量拆单",
        "-510025106": "拆单后关闭源订单并置为无效状态失败",
        "-510025107": "写订单状态变更记录失败",
        "-510014900": "来源订单是否存在(只有客户订单允许创建计划)",                       //下单时直接做计划，[sp_prv_order_AutoPlan]
        "-510014901": "复制原单失败",
        "-510014902": "写订单状态变更记录失败",
        "-510014903": "复制原单的物品信息失败",
        "-510014904": "原订单保留，便于和客户结算，原始订单状态修改为待签收失败",
        "-510014905": "写订单状态变更记录失败",
        "-510061001": "只有个体司机账号才可",		//账号绑定
        "-510061002": "每个账号只能绑定一次",
        "-510061003": "账号密码错误",
    };
    for (var key in _result) {
    	var _code = $('body').attr('code');
        if (typeof(_ret.rs[0].rows[0][key]) != 'undefined') {
            if (_ret.rs[0].rows[0][key] == 0) {
                alert('成功！');
                if (_code == "aorder") {
                	var _openId = $('input#OpenId').val();
                    var _cost = $('input#TotalCost').val();
                    if (_cost != '') {
                        location.href = 'Pricingbyorder.aspx?OpenId='+ _openId +'&id=' + _ret.rs[0].rows[0].SupplierOrderID;
                    } else {
                        location.href = 'DocCompact.aspx?OpenId='+ _openId +'&id=' + _ret.rs[0].rows[0].SupplierOrderID;
                    }
                }else if (_code == "orders") {
                	var _openId = $('input#OpenId').val();
    				var _orderid = NSF.UrlVars.Get('id', location.href);
                    location.href = 'DocCombined.aspx?OpenId='+ _openId +'&id=' + _orderid;
                }else if (_code == "Signing") {
                    location.href = 'ordertoreceipt.aspx?id='+ NSF.UrlVars.Get('id', location.href)+'&OpenId='+ $('input#OpenId').val() +'';
                }else if (_code == "Pricing") {
                    location.href = 'infoordertosign.aspx?id='+ NSF.UrlVars.Get('id', location.href)+'&OpenId='+ $('input#OpenId').val() +'';
                }else if (_code == "Receipt") {
                    location.href = 'infoordertocharge.aspx?id='+ $('input#CustomerCompanyID').val() +'&OpenId='+ $('input#OpenId').val() +'';
                }else if (_code == "SignOrderDetail") {
                    location.href = 'SignOrderDetailResult.aspx?OpenId='+ $('input#OpenId').val();
                }else if (_code == "DocCombined") {
                    location.href = 'CombinedOrder.aspx?id='+ NSF.UrlVars.Get('id', location.href) +'&OpenId='+ $('input#OpenId').val();
                }else {
	                location.href = $('body').attr('code') + '.aspx?OpenId='+ $('input#OpenId').val() +'';
                }

            } else {
                if (typeof _msg[_ret.rs[0].rows[0][key]] == 'undefined') {
                    alert('错误信息：异常错误');
                }else {
                    if( typeof msg != "undefined" ){
                        msg = _msg[_ret.rs[0].rows[0][key]];
                    }else{
                        alert('错误信息：' + _msg[_ret.rs[0].rows[0][key]]);
                    }
                }
            }
        }
    }
}

function Information() {			//我的资料详情
	var _info = new NSF.System.Data.Grid();
    _info.Pagination("first-ds-pag", $('div.list-item').find('div[name="first-ds-pag"]'));
    _info.Initialize("/", "information", $("ul[name='information']").attr("view-id"), $("ul[name='information']"));
}

function InfoChange(flag) {			//传值进入编辑页
	var _data;
	var _openId = $('input#OpenId').val();
	if ( flag == "0") {				//用户信息
		_data = '{"name":"' + $('#Name').text() + '", "phone":"' + $('#Phone').text() + '"}';
		location.href = "changepersonalinfo.aspx?OpenId="+ _openId +"&data=" + escape(_data);
	} else if ( flag == "1") {		//传真
		_data = '{"fax":"' + $('#Fax').text() + '"}';
		location.href = "changefax.aspx?OpenId="+ _openId +"&data=" + escape(_data);
	} else if ( flag == "2") {		//邮编
		_data = '{"zip":"' + $('#Zip').text() + '"}';
		location.href = "changecode.aspx?OpenId="+ _openId +"&data=" + escape(_data);
	} else if ( flag == "3") {		//邮箱
		_data = '{"mail":"' + $('#Mail').text() + '"}';
		location.href = "changeemail.aspx?OpenId="+ _openId +"&data=" + escape(_data);
	} else if ( flag == "4") {		//地址
		_data = '{"address":"' + $('#Address').text() + '"}';
		location.href = "changeaddress.aspx?OpenId="+ _openId +"&data=" + escape(_data);
	} else if ( flag == "5") {		//开户行
		_data = '{"bank":"' + $('#Bank').text() + '"}';
		location.href = "changebank.aspx?OpenId="+ _openId +"&data=" + escape(_data);
	} else if ( flag == "6") {		//银行账号
		_data = '{"bankaccount":"' + $('#BankAccount').text() + '"}';
		location.href = "changebankaccount.aspx?OpenId="+ _openId +"&data=" + escape(_data);
	}
}

function InforSave() {				//个人信息编辑
    var pmls = [{}];
    pmls[0].namespace = 'protocol';
    pmls[0].cmd = 'data';
    pmls[0].version = 1;
    pmls[0].id = 'acc_0002';

    var _paras = [{}, {}];
    _paras[0].name = 'Contact';
    _paras[0].value = $('input.uname').val();
    _paras[1].name = 'Phone';
    _paras[1].value = $('input.uphone').val();

    pmls[0].paras = _paras;

    NSF.System.Network.Ajax('/Portal.aspx',
        NSF.System.Json.ToString(pmls),
        'POST',
        false,
        function(result, data) {
            if (data[0].result) {
            	Result(data[0]);
            } else {
            	alert(data[0].msg);
            }
        });
}
function FaxSave() {
    var pmls = [{}];
    pmls[0].namespace = 'protocol';
    pmls[0].cmd = 'data';
    pmls[0].version = 1;
    pmls[0].id = 'acc_0002';

    var _paras = [{}];
    _paras[0].name = 'Fax';
    _paras[0].value = $('input.ufax').val();

    pmls[0].paras = _paras;

    NSF.System.Network.Ajax('/Portal.aspx',
        NSF.System.Json.ToString(pmls),
        'POST',
        false,
        function(result, data) {
            if (data[0].result) {
            	Result(data[0]);
            } else {
            	alert(data[0].msg);
            }
        });
}
function ZipSave() {
    var pmls = [{}];
    pmls[0].namespace = 'protocol';
    pmls[0].cmd = 'data';
    pmls[0].version = 1;
    pmls[0].id = 'acc_0002';

    var _paras = [{}];
    _paras[0].name = 'Zip';
    _paras[0].value = $('input.uzip').val();

    pmls[0].paras = _paras;

    NSF.System.Network.Ajax('/Portal.aspx',
        NSF.System.Json.ToString(pmls),
        'POST',
        false,
        function(result, data) {
            if (data[0].result) {
            	Result(data[0]);
            } else {
            	alert(data[0].msg);
            }
        });
}
function MailSave() {
	var pmls = [{}];
	pmls[0].namespace = 'protocol';
	pmls[0].cmd = 'data';
	pmls[0].version = 1;
	pmls[0].id = 'acc_0002';

	var _paras = [{}];
	_paras[0].name = 'Mail';
	_paras[0].value = $('input.umail').val();

	pmls[0].paras = _paras;

	NSF.System.Network.Ajax('/Portal.aspx',
	    NSF.System.Json.ToString(pmls),
	    'POST',
	    false,
	    function(result, data) {
	        if (data[0].result) {
	        	Result(data[0]);
	        } else {
	        	alert(data[0].msg);
	        }
	    });
}
function AddressSave() {
    var pmls = [{}];
    pmls[0].namespace = 'protocol';
    pmls[0].cmd = 'data';
    pmls[0].version = 1;
    pmls[0].id = 'acc_0002';

    var _paras = [{}];
    _paras[0].name = 'Address';
    _paras[0].value = $('input.uaddress').val();

    pmls[0].paras = _paras;

    NSF.System.Network.Ajax('/Portal.aspx',
        NSF.System.Json.ToString(pmls),
        'POST',
        false,
        function(result, data) {
            if (data[0].result) {
            	Result(data[0]);
            } else {
            	alert(data[0].msg);
            }
        });
}
function BankSave() {
    var pmls = [{}];
    pmls[0].namespace = 'protocol';
    pmls[0].cmd = 'data';
    pmls[0].version = 1;
    pmls[0].id = 'acc_0002';

    var _paras = [{}];
    _paras[0].name = 'Bank';
    _paras[0].value = $('input.ubank').val();

    pmls[0].paras = _paras;

    NSF.System.Network.Ajax('/Portal.aspx',
        NSF.System.Json.ToString(pmls),
        'POST',
        false,
        function(result, data) {
            if (data[0].result) {
            	Result(data[0]);
            } else {
            	alert(data[0].msg);
            }
        });
}
function BankAccountSave() {
    var pmls = [{}];
    pmls[0].namespace = 'protocol';
    pmls[0].cmd = 'data';
    pmls[0].version = 1;
    pmls[0].id = 'acc_0002';

    var _paras = [{}];
    _paras[0].name = 'BankAccount';
    _paras[0].value = $('input.ubankaccount').val();

    pmls[0].paras = _paras;

    NSF.System.Network.Ajax('/Portal.aspx',
        NSF.System.Json.ToString(pmls),
        'POST',
        false,
        function(result, data) {
            if (data[0].result) {
            	Result(data[0]);
            } else {
            	alert(data[0].msg);
            }
        });
}

function InvitedList(urlBj) {           //待审核客户、已审核客户列表
    var _openId = $('input#OpenId').val();
    if (typeof urlBj == "object") {
        if (location.href.indexOf("#") != -1){
            urlBj = '#' + location.href.split("#")[1];
        } else {
            urlBj = '#' + $(".navDiv").find("li:first").attr("role").split('#')[1];
        }
    }
    if (urlBj == '') {
        location.href= location.href + '#0';
        var urlBj = window.location.hash;
    }
    $('.navDiv li').removeClass('active');
    $('.order').remove();
    if (urlBj) {
        $('.navDiv li[role="' + urlBj + '"]').addClass('active');
    } else {
        $('.navDiv li[role="#0"]').addClass('active');
    }

    var _order = new NSF.System.Data.Grid();
    _order.Pagination("first-ds-pag", $('div.list-item').find('div[name="first-ds-pag"]'));
    
    var _srcclass;
    location.href = location.href.split('#')[0] + urlBj;
    if (urlBj == '#0') {                    //待审核客户
        _order.Initialize("/", "inviteWait", $("ul[name='inviteWait']").attr("view-id"), $("ul[name='inviteWait']"));
        $('.invited').addClass('con');
        $('.inviteWait').removeClass('con');
    }

    if (urlBj == '#1') {                    //已审核客户
        _order.Initialize("/", "invited", $("ul[name='invited']").attr("view-id"), $("ul[name='invited']"));
        $('.inviteWait').addClass('con');
        $('.invited').removeClass('con');
    }

    show_li();
}

function show_li(){
    var con1 = $('.invi_left').children('li').hasClass('invited_1');
    var con2 = $('.invi_right').children('li').hasClass('invited_2');
    if(con1 == false){
        //$('.invi_left').html('<div class="font_c width_w padding_300"><img src="/img/tixing.png"><br /><br />您暂时没有待审核客户！</div>');
                    
    }
    if(con2 == false){
        //$('.invi_left').html('<div class="font_c width_w padding_300"><img src="/img/tixing.png"><br /><br />您暂时没有已审核客户！</div>');
                    
    }           
}

function OrderReceive(OP) {			//同意或拒绝客户邀请
    var pmls = [{}];
    pmls[0].namespace = 'protocol';
    pmls[0].cmd = 'data';
    pmls[0].version = 1;
    pmls[0].id = 'acc_0004';

    var _paras = [{}, {}];
    _paras[0].name = 'SupplierID';
    _paras[0].value = $('input#id').val();
    _paras[1].name = 'Op';
    _paras[1].value = OP;

    pmls[0].paras = _paras;

    NSF.System.Network.Ajax('/Portal.aspx',
        NSF.System.Json.ToString(pmls),
        'POST',
        false,
        function(result, data) {
            if (data[0].result) {
            	Result(data[0]);
            } else {
            	alert(data[0].msg);
            }
        });
}

function WaitCharge() {				//待收费列表
	var _order = new NSF.System.Data.Grid();
	_order.Pagination("first-ds-pag", $('div.list-item').find('div[name="first-ds-pag"]'));
    _order.Initialize("/", "WaitCharge", $("ul[name='WaitCharge']").attr("view-id"), $("ul[name='WaitCharge']"));
}

function WaitChargeDetail() {		//待接收费用详情
	var _orderid = NSF.UrlVars.Get('id', location.href);

	$("ul[name='WaitCharge']").attr("view-id",'{ id:"Dtms_0015",cross:"false", model:"WaitCharge", rowIdentClass:"WaitCharge", paras:[{"name":"CustomerCompanyID","value":"'+ _orderid +'"}]}');
	$("ul[name='WaitChargeDetail']").attr("view-id",'{ id:"Dtms_0011",cross:"false", model:"WaitChargeDetail", rowIdentClass:"WaitChargeDetail", paras:[{"name":"CustomerCompanyID","value":"'+ _orderid +'"}]}');

	var _order = new NSF.System.Data.Grid();
    _order.Pagination("first-ds-pag", $('div.list-item').find('div[name="first-ds-pag"]'));
    _order.Initialize("/", "WaitCharge", $("ul[name='WaitCharge']").attr("view-id"), $("ul[name='WaitCharge']"));
    _order.Initialize("/", "WaitChargeDetail", $("ul[name='WaitChargeDetail']").attr("view-id"), $("ul[name='WaitChargeDetail']"));
}

function Receipt() {			//待回单列表
	var _openId = $('input#OpenId').val();

	var _order = new NSF.System.Data.Grid();
	_order.Pagination("first-ds-pag", $('div.list-item').find('div[name="first-ds-pag"]'));
	
	var _srcclass;
    _order.Initialize("/", "Receipt", $("ul[name='Receipt']").attr("view-id"), $("ul[name='Receipt']"));
    $('.combined').each(function() {		//否为被拼车订单
    	_srcclass = $(this).val();
		$(this).parent().attr('href', 'ordertoreceipt.aspx?id=' + $(this).prev().val() + '&openId=' + _openId );
    	if (_srcclass == "1") {
    		$(this).before('<div class="uniorder">' +
    		'<img src="img/uniorder.png" style="position: absolute;right: 1%;top:1%"></div>');
    	}
    });
}

function Signing() {			//待签收列表
	var _openId = $('input#OpenId').val();

	var _order = new NSF.System.Data.Grid();
	_order.Pagination("first-ds-pag", $('div.list-item').find('div[name="first-ds-pag"]'));
	
	var _srcclass;
    _order.Initialize("/", "Signing", $("ul[name='Signing']").attr("view-id"), $("ul[name='Signing']"));
    $('.combined').each(function() {		//判断是否是合单
    	_srcclass = $(this).val();
		$(this).parent().attr('href', 'infoordertosign.aspx?id=' + $(this).prev().val() +'&openId=' + _openId );    	
    	/*if (_srcclass == "1") {
    		$(this).before('<div class="uniorder">' +
    		'<img src="img/uniorder.png" style="position: absolute;right: 1%;top:1%"></div>');
    	} */
    });
}

function OrderSignEdit() {			//签收订单
    $('.recipt').hide();
    var stat = 0;
    var GoodsQty = '';
    $('div.description').each(function(index) {
        var OrderID = $(this).find('input[name="ListID"]').val();
		//物品数量
        var Qty = $(this).find('td[name="Qty"]').text();         
        //实签数量
        var ReceiptQty = $(this).find('input[name="ReceiptQty"]').val(); 
        //异常数量
        var ExceptionQty = $(this).find('input[name="ExceptionQty"]').val();

        var _pattern = /^[0-9]+$/;
        GoodsQty += '' + OrderID + '=' + ReceiptQty + ',' + ExceptionQty + '';

        if ($('tr[nrowid="TMS_OrderGoods"]').length - 1 > index) {
            GoodsQty += ';';
        }
        if (ReceiptQty == 0 && ExceptionQty == 0 || ReceiptQty == '' && ExceptionQty == '') {
            stat = 1;
            return false;
        }
        if(!_pattern.test( ReceiptQty ) || !_pattern.test( ExceptionQty ) ){
            stat = 2;
            return false;
        }

        if (Qty*1 != ReceiptQty*1 + ExceptionQty*1) {
            stat = 3;
            return false;
        }        
    });
    if (stat == 1) {
        alert('请输入签收或异常数量！');
    }else if (stat == 2) {
        alert('实签数量或异常数量格式不正确，请输入整数！');
    }else if (stat == 3) {
        alert('实签数量和异常数量总和要与物品总数一致！');
    }else {
        $('input[name="GoodsQty"]').val(GoodsQty);
        var pmls = [{}];
        pmls[0].namespace = 'protocol';
        pmls[0].cmd = 'data';
        pmls[0].version = 1;
        pmls[0].id = 'tms_0068';

        var _paras = [{}, {}, {}];
        _paras[0].name = 'OpenID';
        _paras[0].value = NSF.UrlVars.Get("openid", location.href);
        _paras[1].name = 'OrderID';
        _paras[1].value = NSF.UrlVars.Get("id", location.href);
        _paras[2].name = 'GoodsQty';
        _paras[2].value = GoodsQty;
       
        pmls[0].paras = _paras;

        NSF.System.Network.Ajax('/Portal.aspx',
            NSF.System.Json.ToString(pmls),
            'POST',
            false,
            function(result, data) {
            if (data[0].result) Result(data[0]);
        });
    }
}

function Close(id) {			//关闭弹出框
	$('#'+id).hide();
}

function Show(id) {			//打开弹出框
	$('#'+id).show();
}

function OrderReceiptEdit(that) {		//订单回单 that:1 纸质回单
    $('.recipt').hide();
    //var dID = $('input[name="HdID"]').val();
    var _id = NSF.UrlVars.Get( 'id', location.href );
    var pmls = [{}];
    pmls[0].namespace = 'protocol';
    pmls[0].cmd = 'data';
    pmls[0].version = 1;
    pmls[0].id = 'tms_0069';

    var _paras = [{}, {}, {}, {}, {}, {}];
    _paras[0].name = 'OrderID';
    _paras[1].name = 'ReceiptDocPath0';
    _paras[2].name = 'ReceiptDocPath1';
    _paras[3].name = 'ReceiptDocPath2';
    _paras[4].name = 'IsPaperReceived';
    _paras[5].name = 'OpenID';

    _paras[0].value = _id;
    _paras[1].value = $('input[name="ReceiptDocPath0"]').eq(1).val();
    _paras[2].value = $('input[name="ReceiptDocPath1"]').eq(1).val();
    _paras[3].value = $('input[name="ReceiptDocPath2"]').eq(1).val();
    _paras[4].value = that;
    _paras[5].value = $('input#OpenId').val();
    /*if(that != undefined && that != '1')
    {
    	_paras[0].value = dID;
    	_paras[1].value = $(that).parent().parent().find('.receiptdoc').text();
    	_paras[2].value = $(that).parent().parent().find('.receiptDoc1').text();
    	_paras[3].value = $(that).parent().parent().find('.receiptDoc2').text();
    }
    else
    {
    	_paras[0].value = NSF.UrlVars.Get("id", location.href);
    	_paras[1].value = $('input[name="ReceiptDocPath0"]').eq(1).val();
    	_paras[2].value = $('input[name="ReceiptDocPath1"]').eq(1).val();
    	_paras[3].value = $('input[name="ReceiptDocPath2"]').eq(1).val();
    	_paras[5].value = $('input[name="OpenId"]').val();
    }  
	
	if( _id != ''  && that != '1')
	{
    	_paras[4].value = 0;
    }
	else
	{
		_paras[4].value = 1;
	}*/
    pmls[0].paras = _paras;

    NSF.System.Network.Ajax('/Portal.aspx',
        NSF.System.Json.ToString(pmls),
        'POST',
        false,
        function(result, data) {
		    if (data[0].result) {
		        Result(data[0]);
		    } else {
		        alert(data[0].msg);
		    }
    });
}

/***上传图片，获取图片,satrt***/
function readImage() {
	$('input.photo').each(function(index) {
    	if ($(this).attr("id") == $('input.droparea').eq(index).attr('name')) {
    	 	$('input.droparea').eq(index).attr('data-file', $(this).val());
    	}
    });
    $('input[type="file"]').each( function(i) {
        initDroparea($('input[name="ReceiptDocPath'+ i +'"]'),true);
    });
}
function initImage() {
	$('input.droparea').each( function(i) {
		var that = $(this)[0];
		var _option = $(this).attr('f-options');
        initInputImage(that, _option);
    });
}
function initInputImage(that , _option){
	var imageInput=$(that);
	imageInput.attr('data-width',$(that).width());
	imageInput.attr('data-height',$(that).height());

	initDroparea(imageInput);
}
function initDroparea(_droparea,dataFile) {
	var w = _droparea.data('width');
	var h = _droparea.data('height');
	var hpx = h + 'px';
	if(!dataFile){
		_droparea.droparea({
			'instructions': '拖动文件到此处<br />或点击此处',
			'over': '将文件放在此处',
			'nosupport': 'No support for the File API in this web browser',
			'noimage': '不支持的文件类型!',
			'uploaded': '上传完成',
			'maxsize': '10',
			'init': function(result) {
			},
			'start': function (area) {
				area.find('.error').remove();
			},
			'error': function(result, input, area) {
				$('<div class="error">').html(result.error).prependTo(area);
				return 0;
			},
			'complete': function ( result, file, input, area ) {
				_droparea = input;
				if ((/image/i).test(file.type)) {
					initImages(area,result.path + result.filename);
				} else alert('不支持的文件类型!');
			}
		});
	}
	var img=_droparea.attr('data-file');
	if (img) {
		var area=_droparea.parents('.droparea');
		initImages(area, img);
		area.find('.instructions').css('z-index', '-1');
	} else {
		var area = _droparea.parents('.droparea');
		area.find('.instructions').css('text-align', 'center');
		area.find('.instructions').html('<a style="display:block;">点击上传</a>');
		area.find('.instructions').find('a').css('line-height', hpx);
		initImages(area, '');
	}

	function initImages(area, img) {
		area.find('img').remove();
		_DoDropAreaImageDelete( area.find("input:eq(0)").attr("name") );
		$('<img>', {
		'src': img,
		'name' : _droparea.attr('name') + '_image'
		}).css({
		"maxHeight": "100%",
		"maxWidth": "90%"
		}).appendTo(area);
		var attFile=area.find('input[type="hidden"][name="'+_droparea.attr('name')+'"]');
		if(attFile.length==0){
			attFile=$('<input type="hidden" name="'+_droparea.attr('name')+'" />');
			attFile.appendTo(area);
		}
		attFile.val(img);
		area.css('text-align', 'center');
	
		setTimeout(function () {
		var mt = (area.height() - area.find('img').height()) / 2;
		area.find('img').css('margin-top', mt + 'px');
		}, 500);
	}
}
function _DoDropAreaImageDelete(name) {
	var _droparea = $('input.droparea[name="' + name + '"]');
	if (_droparea && _droparea.length > 0) {
		_droparea = _droparea.parent();
		if (_droparea.length > 0) {
			try {
			_droparea.find('input[name="' + name + '"]').val('');
			_droparea.find('img[name="' + name + '_image"]').remove();
			$('button[name="'+ name +'_delbtn"]').remove();
			$('button[name="'+ name +'_searchbtn"]').remove();
			_droparea.find('div.uploaded').remove();
			} catch (e) {}
		}
	}
	return;
}
/***上传图片，获取图片,end***/

function Receiving() {		//待接收订单列表
	var _order = new NSF.System.Data.Grid();
	var _openId = $('input#OpenId').val();
	_order.Pagination("first-ds-pag", $('div.list-item').find('div[name="first-ds-pag"]'));

	var _srcclass;
	_order.Initialize("/", "Receiving", $("ul[name='Receiving']").attr("view-id"), $("ul[name='Receiving']"));
        $('.srcclass').each(function() {		//判断是否是合单
        	_srcclass = $(this).val();
        	if (_srcclass == "3") {
        		$(this).parent().attr('href', 'orders.aspx?OpenId='+ _openId +'&id=' + $(this).prev().val() );
        		$(this).before('<div class="uniorder">' +
        		'<img src="img/uniorder.png" style="position: absolute;right: 1%;top:1%"></div>');
        	} else {
        		$(this).parent().attr('href', 'aorder.aspx?OpenId='+ _openId +'&id=' + $(this).prev().val() );
        	}
        });
    if ($("ul[name='Receiving'] li").length == 0) {
        $('#nodata').show();
    }
}

function OrderAccept(Accept, order) {			//接收订单 order:1:普通单 2：拼车单
    var _y = 1;
    var _openId = $('input#OpenId').val();
    var _orderid = NSF.UrlVars.Get('id', location.href);
    if (Accept == 0) {
    	$('body').attr('code', 'Receiving');
        if ($('textarea#Description').val() == '') {
            _y = 0;
            alert('拒绝原因不能为空！');
        } else {
            _y = 1;
        }
    }
    if (_y == 1) {
        var pmls = [{}];
        pmls[0].namespace = 'protocol';
        pmls[0].cmd = 'data';
        pmls[0].version = 1;

        if (order == '1') {
        	pmls[0].id = 'Dtms_0066';
        }else {
        	pmls[0].id = 'Dtms_0106';
        }

        var _paras = [{}, {}, {}];
        _paras[0].name = 'OrderID';
        _paras[0].value = _orderid;
        _paras[1].name = 'Accept';
        _paras[1].value = Accept;
        _paras[2].name = 'Description';
        _paras[2].value = $('textarea#Description').val();
        pmls[0].paras = _paras;

        NSF.System.Network.Ajax('/Portal.aspx',
            NSF.System.Json.ToString(pmls),
            'POST',
            false,
            function(result, data) {
                if (data[0].result) {
                    Result(data[0]);
                } else {
                    alert(data[0].msg);
                }
            });
    }
}

function DocByOrder() {		//保存发送报价信息
	var pmls = [{}];
    pmls[0].namespace = 'protocol';
    pmls[0].cmd = 'data';
    pmls[0].version = 1;
    pmls[0].id = 'pml_0007';

    var _paras = [];
    $('input.required').each(function() {
    	var _para = {};
    	_para.name = $(this).attr('class').split(' ')[0];
    	_para.value = $(this).val();

    	_paras.push(_para);
    });

    pmls[0].paras = _paras;


    NSF.System.Network.Ajax('/Portal.aspx',
        NSF.System.Json.ToString(pmls),
        'POST',
        false,
        function(result, data) {
            if (data[0].result) {
                Result(data[0]);
            } else {
                alert(data[0].msg);
            }
        });
}

function AdditionCost() {		//补充报价提交
    /*<Add>
    <Pr>
        <AdditionType>1</AdditionType>
        <Amount>4</Amount>
        <Description>钢筋</Description>
    </Pr>
    <Pr>
        <AdditionType>2</AdditionType>
        <Amount>5</Amount>
        <Description>钢2筋</Description>
    </Pr>
</Add>
*/
	var pmls = [{}];
    pmls[0].namespace = 'protocol';
    pmls[0].cmd = 'data';
    pmls[0].version = 1;
    pmls[0].id = 'pml_0009';

    var _AddpriceLst = '<Add>';
    $('tr.AdditionPrice').each(function() {
        var _addType = $(this).find('select.AdditionType').val();
        var _price = $(this).find('input.AdditionPrice').val();
        var _descript = $(this).find('textarea.Description').val();
        _AddpriceLst += '<Pr><AdditionType>'+ _addType +'</AdditionType><Amount>'+ _price +'</Amount><Description>'+ _descript +'</Description></Pr>';    
    });
    _AddpriceLst += '</Add>';
    var _paras = [{}];
    _paras[0].name = 'AddpriceLst';
    _paras[0].value = _AddpriceLst;
    

    $('input.required').each(function() {
        var _para = {};
        _para.name = $(this).attr('class').split(' ')[0];
        _para.value = $(this).val();

        _paras.push(_para);
    });

    pmls[0].paras = _paras;


    NSF.System.Network.Ajax('/Portal.aspx',
	        NSF.System.Json.ToString(pmls),
	        'POST',
	        false,
	        function(result, data) {
	            if (data[0].result) {
	                Result(data[0]);
	            } else {
	                alert(data[0].msg);
	            }
	        });
}

function NoZero() {     //必填一项价格
    var flag = false;
    $('div.quoteprice').find("input").each(function(){
        var num = $(this).val();
        if(num*1 != 0 && num != undefined && num != ""){
            flag = true;
        }
    });

    if( flag ){
       DocByOrder();
    }else{
        alert("价格至少填写一项！");
    }
}

function back() {       //返回到列表页
    location.href = $('body').attr('code') + '.aspx?OpenId=' + $('input#OpenId').val(); 
}

function OrderDetail1() {            //扫码签收
    var _orderid = NSF.UrlVars.Get('orderid', location.href);

    $("ul[name='orderDetail']").attr("view-id",'{ id:"Dtms_0108",cross:"false", model:"orderDetail", rowIdentClass:"orderDetail", paras:[{"name":"id","value":"'+ _orderid +'"}]}');
    $("ul[name='orderGoods']").attr("view-id",'{ id:"tms_0102",cross:"false", model:"orderGoods", orderGoods:"orderDetail", paras:[{"name":"did","value":"'+ _orderid +'"}]}');

    var _order = new NSF.System.Data.Grid();
    _order.Pagination("first-ds-pag", $('div.list-item').find('div[name="first-ds-pag"]'));
    _order.Initialize("/", "orderDetail", $("ul[name='orderDetail']").attr("view-id"), $("ul[name='orderDetail']"));
    _order.Initialize("/", "orderGoods", $("ul[name='orderGoods']").attr("view-id"), $("ul[name='orderGoods']"));
}