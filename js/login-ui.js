﻿/*
function SetUserStatus(username, userid, truename, cp)
{
	var _str = 'username: ' + username;
	_str += '\nuserid: ' + userid;
	_str += '\ntruename: ' + truename;
	_str += '\ncp: ' + cp;
	
	alert(_str);
	return;
}
*/
//登录
function _LoginComplete( result, data )
{
    if ( data[0].result )
    {
        location.href = "/GMS/Index.aspx";
    }
    else
    {
        $('.login_btn button').text('登录失败');
        if ( data[0].msg == "The username and password is unmatched!" )
        {
            //alert("您输入的账号密码不匹配或者授权已过期，请与管理员联系！");
            $('#myModal').modal('show');
            $( 'input[name="loginPassword"]' ).val( '' );
        }
        else
        {
            alert( data[0].msg );
        }
    }
    $( '.loginbtn' ).text( '登 录' );
    return;
}
//注册
function _RegisterComplete( result, data )
{

    if ( data[0].result )
    {
        if ( data[0].rs[0].rows[0].Company_Result == 0 )
        {
            location.href = '/Register_Result.aspx';
        }
        else
        {
			Login_Result(data[0]);
            //alert( '错误代码：' + data[0].rs[0].rows[0].Company_Result );
        }
    }
    else
    {
        alert( data[0].msg );
    }

    $( '.register' ).text( '注册' );
}


function _LogoutComplete( result, data )
{
    if ( data[0].result )
    {
        location.href = "/Login.aspx";
    }
    
    return;
}

$( function ()
{
    //用户登录
    $( '#loginForm' ).submit( function ()
    {
        if ( validateCode() )
        {
            var _user = $( "input[name='loginUsername']" ).val();
            var _pwd = $( "input[name='loginPassword']" ).val();

            DoLogin( _user, _pwd, _LoginComplete );
        }

        return false;
    } );
    //用户注册
    $( "#registerForm" ).submit( function ()
    {
        if ( validateCode1() )
        {
            var _user = $( "input[name='registerUsername']" ).val();
            var _pwd = $( "input[name='registerPassword']" ).val();
            var _cpwd = $( "input[name='registerCPassword']" ).val();
            var _truename = $( "input[name='registerTruename']" ).val();
            if ( _pwd != _cpwd )
            {
                alert( "两次输入的密码不一致，请重新输入!" );
            }
            else if ( _truename == "" )
            {
                alert( "昵称不能为空！" );
            }
            else
            {
                DoRegister( _user, _pwd, _truename, _RegisterComplete );
            }
        }

        return false;
    } );
    //修改密码
    $( '#ChangPassword' ).submit( function ()
    {
        var username = UserName;

        var _oldpwd = $( "input[name='oldPassword']" ).val();
        var _newpwd = $( "input[name='newPassword']" ).val();
        var _cnewPwd = $( "input[name='cnewPassword']" ).val();
        if ( _oldpwd == "" )
        {
            alert( "旧密码不能为空！" );
        }
        else if ( _newpwd == "" || _cnewPwd == "" )
        {
            alert( "新密码不能为空！" );
        }
        else if ( _newpwd != _cnewPwd )
        {
            alert( "新密码，两次输入不一致！！" );
        } else
        {
            DoChangePwd( username, _oldpwd, _newpwd, _ChangePwdComplete );

        }
        return false;
    } );
} );


function Login_Result( _ret )
{
    var _result = { "Customer_Result": "0", "Supplier_Result": "0", "Addr_Result": "0", "Car_Result": "0", "Driver_Result": "0", "EndUser_Result": "0", "Goods_Result": "0", "GoodsType_Result": "0", "Order_Result": "0", "Pwd_Result": "0", "Company_Result": "0", "User_Result": "0", "Cost_Result": "0", "Back_Result":"0","Flow_Result":"0","Schedule_Result":"","Close_Result":"" ,"Verify_Result":""};
    var _msg = {
        "-510001001": "序列号生成失败", "-510001002": "公司名是否重复", "-510001003": "新增公司失败",
        "-510002000": "只有管理员有权执行该操作", "-510002001": "没有找到对应公司或公司已被审核", "-510002002": "审核公司失败", "-510002003": "管理员账号是否已经存在", "-510002004": "添加管理员账号失败",
        "-510003001": "参数错误", "-510003002": "账号不存在", "-510003003": "账号密码与原始密码不匹配",
        "-510004001": "参数错误", "-510004002": "账号不存在", "-510004003": "只有系统管理员能重置公司管理员的密码", "-510004004": "公司管理员能重置其他用户的密码", "-510004005": "编辑密码失败",
        "-510005001": "不能添加公司管理员", "-510005002": "只有公司管理员才能添加用户", "-510005003": "用户是否已经存在", "-510005004": "新增用户失败",
        "-510006001": "当前用户没有关联公司", "-510006002": "当前用户没有修改公司资料的权限", "-510006003": "修改失败",
        "-510007001": "当前用户没有关联公司", "-510007002": "当前用户没有罗列公司用户的权限",
        "-510008001": "当前用户没有关联公司", "-510008002": "当前用户没有添加客户的权限", "-510008003": "客户公司编号是否有效", "-510008004": "序列号生成失败", "-510008005": "客户公司是否存在,添加失败", "-510008006": "客户公司是否存在,编辑失败", "-510008007": "手动录入的客户公司名称是否重复",
        "-510009001": "当前用户没有关联公司", "-510009002": "当前用户没有添加承运商的权限", "-510009003": "承运商公司编号是否有效", "-510009004": "客户公司是否存在,添加失败",
        "-510010001": "当前用户没有关联公司", "-510010002": "当前用户没有添加客户的权限", "-510010003": "司机是否存在,添加失败", "-510010004": "司机是否存在，编辑失败",
        "-510011001": "当前用户没有关联公司", "-510011002": "当前用户没有添加客户的权限", "-510011003": "车辆是否存在,添加失败", "-510011004": "车辆是否存在，编辑失败",
        "-510012001": "当前用户没有关联公司", "-510012002": "当前用户没有添加客户的权限", "-510012003": "司机是否存在，新增失败", "-510012004": "司机是否存在，编辑失败",
        "-510013001": "当前用户没有关联公司", "-510013002": "当前用户没有添加客户的权限", "-510013003": "收货人是否存在", "-510013004": "地址是否存在,添加失败", "-510013005": "地址是否存在,编辑失败",
        "-510014001": "当前用户没有关联公司", "-510014002": "当前用户没有添加客户的权限", "-510014003": "延伸客户是否存在", "-510014004": "客户是否存在", "-510014005": "来源订单是否存在", "-510014006": "编辑模式订单是否存在[只能编辑自己公司的订单]", "-510014007": "只能编辑状态为新单据的订单", "-510014008": "添加主单信息失败", "-510014009": "编辑主单信息失败", "-510014010": "承运商是否存在",
        "-510015001": "当前用户没有关联公司", "-510015002": "当前用户没有添加订单物品的权限", "-510015003": "物品是否存在", "-510015004": "订单是否存在", "-510015005": "物品添加失败", "-510015006": "物品编辑失败",
        "-510016001": "当前用户没有关联公司", "-510016002": "当前用户没有添加物品的权限", "-510016003": "物品类型是否存在", "-510016004": "添加物品失败", "-510016005": "编辑物品失败",
        "-510017001": "当前用户没有关联公司", "-510017002": "当前用户没有接受订单的权限", "-510017003": "订单是否存在", "-510017004": "订单是否已经被接受", "-510017005": "接受订单失败", "-510017006": "添加订单流程失败",
        "-510018001": "当前用户没有关联公司", "-510018002": "当前用户没有分配订单的权限", "-510018003": "订单是否存在", "-510018004": "订单是否已经被分配", "-510018005": "车辆是否存在", "-510018006": "司机是否存在", "-510018007": "分配订单失败", "-510018008": "添加订单流程失败",
        "-510019001": "当前用户没有关联公司", "-510019002": "当前用户没有签收订单的权限", "-510019003": "订单是否存在", "-510019004": "订单是否已经被签收", "-510019005": "签收订单失败", "-510019006": "添加订单流程失败", "-510019007": "更新实签数量，异常数量失败",
        "-510020001": "当前用户没有关联公司", "-510020002": "当前用户没有提交订单回单的权限", "-510020003": "订单是否存在", "-510020004": "订单是否已经回单", "-510020005": "回单路径不能为空", "-510020006": "订单回单编辑失败", "-510020007": "添加订单流程失败",
        "-510021001": "当前用户没有关联公司", "-510021002": "当前用户没有添加客户的权限", "-510021003": "收件人公司编号是否有效", "-510021004": "序列号生成失败", "-510021005": "收件人添加失败", "-510021006": "收件人修改失败", "-510021007": "客户是否存在", "-510021008": "收件人名称已存在",
        "-510022001": "当前用户没有关联公司", "-510022002": "当前用户没有发送订单的权限", "-510022003": "订单是否存在", "-510022004": "订单是否已经被发送", "-510022005": "承运商是否存在", "-510022006": "发送订单失败", "-510022007": "添加订单流程失败", "-510022008": "指定承运商失败",
        "-510023001": "当前用户没有关联公司", "-510023002": "当前用户没有操作承运商的权限", "-510023003": "承运商公司编号是否有效", "-510023004": "接受失败", "-510023005": "拒绝失败", "-510023006": "",
        "-510024001": "只有管理员有权执行该操作", "-510024002": "公司编号是否有效", "-510024003": "启用或禁用失败",
        "-510025001": "当前用户没有关联公司", "-510025003": "当前用户没有拆单的权限", "-510025003": "来源订单不存在", "-510025004": "拆单后原始订单保留，原始订单状态修改为待签收失败", "-510025005": "复制原单失败", "-510025006": "写订单状态变更记录失败", "-510025007": "写订单状态变更记录失败",
        "-510026001": "当前用户没有关联公司", "-510026002": "当前用户没有添加订单费用的权限", "-510026003": "订单是否存在", "-510026004": "费用类型是否存在", "-510026005": "更新或添加失败",
        "-510028001": "当前用户没有关联公司", "-510028002": "当前用户没有启用或禁用客户的权限", "-510028003": "客户编号是否有效", "-510028004": "启用或禁用失败",
        "-510029001": "当前用户没有关联公司", "-510029002": "当前用户没有启用或禁用承运商的权限", "-510029003": "承运商编号是否有效", "-510029004": "启用或禁用失败",
        "-510030001": "当前用户没有关联公司", "-510030002": "当前用户没有启用或禁用最终用户的权限", "-510030003": "最终用户编号是否有效", "-510030004": "启用或禁用失败",
        "-510031001": "订单号是否存在", "-510031002": "下单公司是否是承运商的客户", "-510031003": "获取承运商的公司管理员", "-510031004": "下单失败", "-510031005": "订单的附属表(TMS_OrderCost)", "-510031006": "订单附属表(TMS_OrderGoods)",
        "-510032001": "当前用户没有关联公司", "-510032002": "当前用户没有添加承运商的权限", "-510032003": "当前承运商是否存在", "-510032004": "线下承运商是否重名", "-510032005": "承运商编辑失败", "-510032006": "承运商新增失败",
        "-510033001": "当前用户没有关联公司", "-510033002": "当前用户没有打回订单的权限", "-510033003": "订单不存在", "-510033004": "已经委托供应商承运的单子暂时不能打回", "-510033005": "已审核(待分配)", "-510033006": "已分配(待签收)", "-510033007": "已签收(待回单)", "-510033008": "打回订单失败", "-510033009": "添加流程失败",
        "-510034001": "当前用户没有关联公司", "-510034002": "当前用户没有关闭订单的权限", "-510034003": "订单不存在", "-510034004": "关闭订单失败", "-510034005": "添加流程失败",
        "-510035001": "当前用户没有关联公司", "-510035002": "当前用户没有添加订单备注的权限", "-510035003": "源订单不存在", "-510035004": "添加备注失败",
        "-510036001": "当前用户没有关联公司", "-510036002": "当前用户没有发送订单的权限", "-510036003": "原始订单是否存在，是否处于待调度状态(只有运输订单允许调度)", "-510036004": "自营", "-510036005": "自营,车辆不存在", "-510036006": "自营,司机不存在", "-510036007": "自营,分配订单失败", "-510036008": "自营,添加订单流程失败", "-510036009": "承运商,车辆不存在", "-510036010": "承运商,司机不存在", "-510036011": "承运商,分配订单失败", "-510036012": "承运商,添加订单流程失败",
        "-510036001": "当前用户没有关联公司", "-510036002": "当前用户没有发送订单的权限", "-510036003": "原始订单是否存在，是否处于待调度状态(只有运输订单允许调度)", "-510036004": "自营", "-510036005": "自营,车辆不存在", "-510036006": "自营,司机不存在", "-510036007": "自营,分配订单失败", "-510036008": "自营,添加订单流程失败", "-510036009": "承运商,车辆不存在", "-510036010": "承运商,司机不存在", "-510036011": "承运商,分配订单失败", "-510036012": "承运商,添加订单流程失败",
        "-520001001": "当前用户没有关联公司", "-520001002": "当前用户没有添加客户的权限", "-520001003": "按单报价", "-520001004": "按合约报价(同一合约可以多次报价)", "-520001005": "补充报价", "-520001006": "客户不存在","-520001007":"原报价单是否存在，仅草稿模式允许编辑","-520001008":"新增报价单失败","-520001009":"编辑报价单失败",
        "-520011001": "当前用户没有关联公司", "-520011002": "当前用户没有关闭报价单的权限", "-520011003": "报价单是否存在", "-520011004": "只有报价单创建者(所在公司)可以关闭", "-520011005": "只有草稿、已发布但未审批的报价单可以关闭", "-520011006": "关闭报价单失败",
        "-520012001": "当前用户没有关联公司", "-520012002": "当前用户没有发布报价单的权限", "-520012003": "报价单是否存在", "-520012004": "只有报价单创建者(所在公司)可以发送", "-520012005": "只有草稿可以发布", "-520012006": "发送报价单失败",
        "-520013001": "当前用户没有关联公司", "-520013002": "当前用户没有发布报价单的权限", "-520013003": "报价单是否存在", "-520013004": "只有报价单接收者(所在公司)可以审核", "-520013005": "只有已发布的报价单可以审核", "-520013006": "拒绝时必须写描述",
    };
    for ( var key in _result ) 
    {
        if ( typeof ( _ret.rs[0].rows[0][key] ) != 'undefined' )
        {
            if ( _ret.rs[0].rows[0][key] == 0 )
            {
                alert( '成功！' );
                setInterval( function ()
                {
                    if ( $( 'body' ).attr( 'code' ) == 'UpdatePwd' )
                    {
                        Exit();
                    }
                    else if ( location.href.split( '.aspx' )[0].split( '/' )[3] == 'splitSingle' )
                    {
                        location.href = '/OrderSend.aspx';
                    }
                    else
                    {
                        location.href = $( 'body' ).attr( 'code' ) + '.aspx'; 
                    }
                }, 2000 );
            }
            else
            {
                if ( typeof _msg[_ret.rs[0].rows[0][key]] == 'undefined' )
                {
                    alert( '错误代码：' + _ret.rs[0].rows[0][key] + ',错误信息：异常错误' );
                }
                else
                {
                    alert( '错误代码：' + _ret.rs[0].rows[0][key] + ',错误信息：' + _msg[_ret.rs[0].rows[0][key]] );
                }
            }
        }
		else
		{
			if( $( 'body' ).attr( 'code' ) == 'Unit' )
			{
				alert('保存成功！');
				setInterval(location.href = $( 'body' ).attr( 'code' ) + '.aspx',5000);
			}
		}
    }
}