//获取地址栏ID函数
function GetQueryString(name){
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
	}
//售后技术支持工程师测试题查询列表
function Infotest(){
	var info = new NSF.System.Data.Grid();
	info.Pagination("first-ds-pag", $('div.list-item').find('div[name="first-ds-pag"]'));
	info.Initialize("/", "infotest", $("ul[name='infotest']").attr("view-id"), $("ul[name='infotest']"));
	
	var str = $(".score tr td").text();
	var strs = str.split("#");

	for(var i=0;i<strs.length;i++){
		
		var strss=strs[i].split("*");
		
		$("."+strss[3]+"links").attr("href","detailsinfo.html?ID="+strss[3]+"&str="+strss[0]);
		
		var Es=0,Is=0,Ss=0,Ns=0,Ts=0,Fs=0,Js=0,Ps=0;
		
		for(var j=0;j<strss[0].length;j++){
			if(strss[0].charAt(j)=="E"){
				Es++;
			}else if(strss[0].charAt(j)=="I"){
				Is++;
			}else if(strss[0].charAt(j)=="S"){
				Ss++;
			}else if(strss[0].charAt(j)=="N"){
				Ns++;
			}else if(strss[0].charAt(j)=="T"){
				Ts++;
			}else if(strss[0].charAt(j)=="F"){
				Fs++;
			}else if(strss[0].charAt(j)=="J"){
				Js++;
			}else if(strss[0].charAt(j)=="P"){
				Ps++;
			}
		}
	
		$(".Results"+strss[3]+" .Name").text(strss[1]);
		$(".Results"+strss[3]+" .CreateTime").text(strss[2]);
		$(".Results"+strss[3]+" .Es").text(Es);
		$(".Results"+strss[3]+" .Is").text(Is);
		$(".Results"+strss[3]+" .Ss").text(Ss);
		$(".Results"+strss[3]+" .Ns").text(Ns);
		$(".Results"+strss[3]+" .Ts").text(Ts);
		$(".Results"+strss[3]+" .Fs").text(Fs);
		$(".Results"+strss[3]+" .Js").text(Js);
		$(".Results"+strss[3]+" .Ps").text(Ps);
		
		if(Es<=Is){
			if(Ss<=Ns){
				if(Ts<=Fs){
					if(Js<=Ps){
						$(".Results"+strss[3]+" .charactor").text("INFP");
					}else{
						$(".Results"+strss[3]+" .charactor").text("INFJ");
					}
				}else{
					if(Js<=Ps){
						$(".Results"+strss[3]+" .charactor").text("INTP");
					}else{
						$(".Results"+strss[3]+" .charactor").text("INTJ");
					}
				}
			}else{
				if(Ts<=Fs){
						if(Js<=Ps){
							$(".Results"+strss[3]+" .charactor").text("ISFP");
						}else{
							$(".Results"+strss[3]+" .charactor").text("ISFJ");
						}
				}else{
						if(Js<=Ps){
							$(".Results"+strss[3]+" .charactor").text("ISTP");
						}else{
							$(".Results"+strss[3]+" .charactor").text("ISTJ");
						}
					}
				}
		}else{
			if(Ss<=Ns){
				if(Ts<=Fs){
					if(Js<=Ps){
						$(".Results"+strss[3]+" .charactor").text("ENFP");
					}else{
						$(".Results"+strss[3]+" .charactor").text("ENFJ");
					}
				}else{
					if(Js<=Ps){
						$(".Results"+strss[3]+" .charactor").text("ENTP");
					}else{
						$(".Results"+strss[3]+" .charactor").text("ENTJ");
					}
				}
			}else{
				if(Ts<=Fs){
					if(Js<=Ps){
						$(".Results"+strss[3]+" .charactor").text("ESFP");
					}else{
						$(".Results"+strss[3]+" .charactor").text("ESFJ");
					}
				}else{
					if(Js<=Ps){
						$(".Results"+strss[3]+" .charactor").text("ESTP");
					}else{
						$(".Results"+strss[3]+" .charactor").text("ESTJ");
					}
				}
			}
		}
	}
}
//售后技术支持工程师测试结果详情页
function detailinfo(){
	var info = new NSF.System.Data.Grid();
	
	var ID = GetQueryString("ID");
	var str = GetQueryString("str");
	
	$("ul[name='detailsinfo']").attr("view-id",'{id:"wx_0063",cross:"false", model:"detailsinfo", rowIdentClass:"detailsinfo", paras:[{"name":"id","value":"'+ID+'"},{"name":"rows","value":1000},{"name":"page","value":1}]}');
	
	info.Pagination("first-ds-pag", $('div.list-item').find('div[name="first-ds-pag"]'));
	info.Initialize("/", "detailsinfo", $("ul[name='detailsinfo']").attr("view-id"), $("ul[name='detailsinfo']"));

	var Es=0,Is=0,Ss=0,Ns=0,Ts=0,Fs=0,Js=0,Ps=0;
		
	for(var j=0;j<str.length;j++){
		if(str.charAt(j)=="E"){
			Es++;
		}else if(str.charAt(j)=="I"){
			Is++;
		}else if(str.charAt(j)=="S"){
			Ss++;
		}else if(str.charAt(j)=="N"){
			Ns++;
		}else if(str.charAt(j)=="T"){
			Ts++;
		}else if(str.charAt(j)=="F"){
			Fs++;
		}else if(str.charAt(j)=="J"){
			Js++;
		}else if(str.charAt(j)=="P"){
			Ps++;
		}
	}
	
	$(".Es").text(Es);
	$(".Is").text(Is);
	$(".Ss").text(Ss);
	$(".Ns").text(Ns);
	$(".Ts").text(Ts);
	$(".Fs").text(Fs);
	$(".Js").text(Js);
	$(".Ps").text(Ps);
}
//售后技术支持工程师测试题所需函数
function pagechange(code1,code2){
	$(".page"+code1).css("display","none");
	$(".page"+code2).css("display","block");
}

function submitanswer(){
	var answers = $(".test:checked");
//	直接存入答案
//	if(answers.length<93){
//		$(".Alert").css("display","block");
//	}else if(answers.length==93){
//		
//		var Es = $(".test[value='E']:checked").length;
//		var Is = $(".test[value='I']:checked").length;
//		var Ss = $(".test[value='S']:checked").length;
//		var Ns = $(".test[value='N']:checked").length;
//		var Ts = $(".test[value='T']:checked").length;
//		var Fs = $(".test[value='F']:checked").length;
//		var Js = $(".test[value='J']:checked").length;
//		var Ps = $(".test[value='P']:checked").length;
//		var name = $(".signature").val();
//		
//		if(name==""){
//			$(".Alert").children().eq(0).text("请输入姓名！");
//			$(".Alert").css("display","block");
//		}else{
//			
//		var pmls = [{}];
//	    pmls[0].namespace = 'protocol';
//	    pmls[0].cmd = 'data';
//	    pmls[0].version = 1;
//	    pmls[0].id = 'wx_0061';
//	    
//	    var today=new Date();
//	    var day=today.getDate();
//		var mouth=today.getMonth()+1;
//		var year=today.getFullYear();
//		var h=today.getHours();
//		var m=today.getMinutes();
//		var s=today.getSeconds();
//		
//		m=checkTime(m);
//		s=checkTime(s);
//		
//		var dates=year+"/"+mouth+"/"+day+" "+h+":"+m+":"+s;
//  	
//		var _paras = [{},{},{},{},{},{},{},{},{},{},{}];
//		_paras[0].name = 'name';
//		_paras[0].value = $(".signature").val();
//		_paras[1].name = 'createtime';
//		_paras[1].value = dates;
//		_paras[2].name = 'examtype';
//		_paras[2].value = 1;
//		_paras[3].name = 'item1';
//		_paras[3].value = Es;
//		_paras[4].name = 'item2';
//		_paras[4].value = Is;
//		_paras[5].name = 'item3';
//		_paras[5].value = Ss;
//		_paras[6].name = 'item4';
//		_paras[6].value = Ns;
//		_paras[7].name = 'item5';
//		_paras[7].value = Ts;
//		_paras[8].name = 'item6';
//		_paras[8].value = Fs;
//		_paras[9].name = 'item7';
//		_paras[9].value = Js;
//		_paras[10].name = 'item8';
//		_paras[10].value = Ps;	
	
//		pmls[0].paras = _paras;
		
//		NSF.System.Network.Ajax('/Portal.aspx',
//      NSF.System.Json.ToString(pmls),
//      'POST',
//      false,
//      function(result, data) {
//          if (data[0].result) {
//          	Result(data[0]);
//          } else {
//          	alert(data[0].msg);
//          }
//      });
   
//      $(".Alert").children().eq(0).text("提交完成！");
//      $(".Alert").css("display","block");
        
//		存入所有选项
        if(answers.length<93){
		$(".Alert").css("display","block");
		}else if(answers.length==93){
			
			var name = $(".signature").val();
		
			if(name==""){
				$(".Alert").children().eq(0).text("请输入姓名！");
				$(".Alert").css("display","block");
			}else{
				var opt1 = $("input[name=no1]:checked").attr("class").substring(6);
				var opt2 = $("input[name=no2]:checked").attr("class").substring(6);
				var opt3 = $("input[name=no3]:checked").attr("class").substring(6);
				var opt4 = $("input[name=no4]:checked").attr("class").substring(6);
				var opt5 = $("input[name=no5]:checked").attr("class").substring(6);
				var opt6 = $("input[name=no6]:checked").attr("class").substring(6);
				var opt7 = $("input[name=no7]:checked").attr("class").substring(6);
				var opt8 = $("input[name=no8]:checked").attr("class").substring(6);
				var opt9 = $("input[name=no9]:checked").attr("class").substring(6);
				var opt10 = $("input[name=no10]:checked").attr("class").substring(6);
				var opt11 = $("input[name=no11]:checked").attr("class").substring(6);
				var opt12 = $("input[name=no12]:checked").attr("class").substring(6);
				var opt13 = $("input[name=no13]:checked").attr("class").substring(6);
				var opt14 = $("input[name=no14]:checked").attr("class").substring(6);
				var opt15 = $("input[name=no15]:checked").attr("class").substring(6);
				var opt16 = $("input[name=no16]:checked").attr("class").substring(6);
				var opt17 = $("input[name=no17]:checked").attr("class").substring(6);
				var opt18 = $("input[name=no18]:checked").attr("class").substring(6);
				var opt19 = $("input[name=no19]:checked").attr("class").substring(6);
				var opt20 = $("input[name=no20]:checked").attr("class").substring(6);
				var opt21 = $("input[name=no21]:checked").attr("class").substring(6);
				var opt22 = $("input[name=no22]:checked").attr("class").substring(6);
				var opt23 = $("input[name=no23]:checked").attr("class").substring(6);
				var opt24 = $("input[name=no24]:checked").attr("class").substring(6);
				var opt25 = $("input[name=no25]:checked").attr("class").substring(6);
				var opt26 = $("input[name=no26]:checked").attr("class").substring(6);
				var opt27 = $("input[name=no27]:checked").attr("class").substring(6);
				var opt28 = $("input[name=no28]:checked").attr("class").substring(6);
				var opt29 = $("input[name=no29]:checked").attr("class").substring(6);
				var opt30 = $("input[name=no30]:checked").attr("class").substring(6);
				var opt31 = $("input[name=no31]:checked").attr("class").substring(6);
				var opt32 = $("input[name=no32]:checked").attr("class").substring(6);
				var opt33 = $("input[name=no33]:checked").attr("class").substring(6);
				var opt34 = $("input[name=no34]:checked").attr("class").substring(6);
				var opt35 = $("input[name=no35]:checked").attr("class").substring(6);
				var opt36 = $("input[name=no36]:checked").attr("class").substring(6);
				var opt37 = $("input[name=no37]:checked").attr("class").substring(6);
				var opt38 = $("input[name=no38]:checked").attr("class").substring(6);
				var opt39 = $("input[name=no39]:checked").attr("class").substring(6);
				var opt40 = $("input[name=no40]:checked").attr("class").substring(6);
				var opt41 = $("input[name=no41]:checked").attr("class").substring(6);
				var opt42 = $("input[name=no42]:checked").attr("class").substring(6);
				var opt43 = $("input[name=no43]:checked").attr("class").substring(6);
				var opt44 = $("input[name=no44]:checked").attr("class").substring(6);
				var opt45 = $("input[name=no45]:checked").attr("class").substring(6);
				var opt46 = $("input[name=no46]:checked").attr("class").substring(6);
				var opt47 = $("input[name=no47]:checked").attr("class").substring(6);
				var opt48 = $("input[name=no48]:checked").attr("class").substring(6);
				var opt49 = $("input[name=no49]:checked").attr("class").substring(6);
				var opt50 = $("input[name=no50]:checked").attr("class").substring(6);
				var opt51 = $("input[name=no51]:checked").attr("class").substring(6);
				var opt52 = $("input[name=no52]:checked").attr("class").substring(6);
				var opt53 = $("input[name=no53]:checked").attr("class").substring(6);
				var opt54 = $("input[name=no54]:checked").attr("class").substring(6);
				var opt55 = $("input[name=no55]:checked").attr("class").substring(6);
				var opt56 = $("input[name=no56]:checked").attr("class").substring(6);
				var opt57 = $("input[name=no57]:checked").attr("class").substring(6);
				var opt58 = $("input[name=no58]:checked").attr("class").substring(6);
				var opt59 = $("input[name=no59]:checked").attr("class").substring(6);
				var opt60 = $("input[name=no60]:checked").attr("class").substring(6);
				var opt61 = $("input[name=no61]:checked").attr("class").substring(6);
				var opt62 = $("input[name=no62]:checked").attr("class").substring(6);
				var opt63 = $("input[name=no63]:checked").attr("class").substring(6);
				var opt64 = $("input[name=no64]:checked").attr("class").substring(6);
				var opt65 = $("input[name=no65]:checked").attr("class").substring(6);
				var opt66 = $("input[name=no66]:checked").attr("class").substring(6);
				var opt67 = $("input[name=no67]:checked").attr("class").substring(6);
				var opt68 = $("input[name=no68]:checked").attr("class").substring(6);
				var opt69 = $("input[name=no69]:checked").attr("class").substring(6);
				var opt70 = $("input[name=no70]:checked").attr("class").substring(6);
				var opt71 = $("input[name=no71]:checked").attr("class").substring(6);
				var opt72 = $("input[name=no72]:checked").attr("class").substring(6);
				var opt73 = $("input[name=no73]:checked").attr("class").substring(6);
				var opt74 = $("input[name=no74]:checked").attr("class").substring(6);
				var opt75 = $("input[name=no75]:checked").attr("class").substring(6);
				var opt76 = $("input[name=no76]:checked").attr("class").substring(6);
				var opt77 = $("input[name=no77]:checked").attr("class").substring(6);
				var opt78 = $("input[name=no78]:checked").attr("class").substring(6);
				var opt79 = $("input[name=no79]:checked").attr("class").substring(6);
				var opt80 = $("input[name=no80]:checked").attr("class").substring(6);
				var opt81 = $("input[name=no81]:checked").attr("class").substring(6);
				var opt82 = $("input[name=no82]:checked").attr("class").substring(6);
				var opt83 = $("input[name=no83]:checked").attr("class").substring(6);
				var opt84 = $("input[name=no84]:checked").attr("class").substring(6);
				var opt85 = $("input[name=no85]:checked").attr("class").substring(6);
				var opt86 = $("input[name=no86]:checked").attr("class").substring(6);
				var opt87 = $("input[name=no87]:checked").attr("class").substring(6);
				var opt88 = $("input[name=no88]:checked").attr("class").substring(6);
				var opt89 = $("input[name=no89]:checked").attr("class").substring(6);
				var opt90 = $("input[name=no90]:checked").attr("class").substring(6);				
				var opt91 = $("input[name=no91]:checked").attr("class").substring(6);
				var opt92 = $("input[name=no92]:checked").attr("class").substring(6);
				var opt93 = $("input[name=no93]:checked").attr("class").substring(6);	
				
				var pmls = [{}];
			    pmls[0].namespace = 'protocol';
			    pmls[0].cmd = 'data';
			    pmls[0].version = 1;
			    pmls[0].id = 'wx_0059';
			    
			    var today=new Date();
			    var day=today.getDate();
				var mouth=today.getMonth()+1;
				var year=today.getFullYear();
				var h=today.getHours();
				var m=today.getMinutes();
				var s=today.getSeconds();
				
				m=checkTime(m);
				s=checkTime(s);
				
				var dates=year+"/"+mouth+"/"+day+" "+h+":"+m+":"+s;
		    	
				var _paras = [{},{},{},{},{},{},{},{},{},{},
							  {},{},{},{},{},{},{},{},{},{},
							  {},{},{},{},{},{},{},{},{},{},
							  {},{},{},{},{},{},{},{},{},{},
							  {},{},{},{},{},{},{},{},{},{},
							  {},{},{},{},{},{},{},{},{},{},
							  {},{},{},{},{},{},{},{},{},{},
							  {},{},{},{},{},{},{},{},{},{},
							  {},{},{},{},{},{},{},{},{},{},
							  {},{},{},{},{},{}];
				
				_paras[0].name = 'name';
				_paras[0].value = $(".signature").val();
				_paras[1].name = 'createtime';
				_paras[1].value = dates;
				_paras[2].name = 'examtype';
				_paras[2].value = 1;
				_paras[3].name = 'item1';
				_paras[3].value = opt1;
				_paras[4].name = 'item2';
				_paras[4].value = opt2;
				_paras[5].name = 'item3';
				_paras[5].value = opt3;
				_paras[6].name = 'item4';
				_paras[6].value = opt4;
				_paras[7].name = 'item5';
				_paras[7].value = opt5;
				_paras[8].name = 'item6';
				_paras[8].value = opt6;
				_paras[9].name = 'item7';
				_paras[9].value = opt7;
				_paras[10].name = 'item8';
				_paras[10].value = opt8;
				_paras[11].name = 'item9';
				_paras[11].value = opt9;
				_paras[12].name = 'item10';
				_paras[12].value = opt10;	
				_paras[13].name = 'item11';
				_paras[13].value = opt11;
				_paras[14].name = 'item12';
				_paras[14].value = opt12;
				_paras[15].name = 'item13';
				_paras[15].value = opt13;
				_paras[16].name = 'item14';
				_paras[16].value = opt14;
				_paras[17].name = 'item15';
				_paras[17].value = opt15;
				_paras[18].name = 'item16';
				_paras[18].value = opt16;
				_paras[19].name = 'item17';
				_paras[19].value = opt17;
				_paras[20].name = 'item18';
				_paras[20].value = opt18;
				_paras[21].name = 'item19';
				_paras[21].value = opt19;
				_paras[22].name = 'item20';
				_paras[22].value = opt20;
				_paras[23].name = 'item21';
				_paras[23].value = opt21;
				_paras[24].name = 'item22';
				_paras[24].value = opt22;
				_paras[25].name = 'item23';
				_paras[25].value = opt23;
				_paras[26].name = 'item24';
				_paras[26].value = opt24;
				_paras[27].name = 'item25';
				_paras[27].value = opt25;
				_paras[28].name = 'item26';
				_paras[28].value = opt26;
				_paras[29].name = 'item27';
				_paras[29].value = opt27;
				_paras[30].name = 'item28';
				_paras[30].value = opt28;
				_paras[31].name = 'item29';
				_paras[31].value = opt29;
				_paras[32].name = 'item30';
				_paras[32].value = opt30;
				_paras[33].name = 'item31';
				_paras[33].value = opt31;
				_paras[34].name = 'item32';
				_paras[34].value = opt32;
				_paras[35].name = 'item33';
				_paras[35].value = opt33;
				_paras[36].name = 'item34';
				_paras[36].value = opt34;
				_paras[37].name = 'item35';
				_paras[37].value = opt35;
				_paras[38].name = 'item36';
				_paras[38].value = opt36;
				_paras[39].name = 'item37';
				_paras[39].value = opt37;
				_paras[40].name = 'item38';
				_paras[40].value = opt38;
				_paras[41].name = 'item39';
				_paras[41].value = opt39;
				_paras[42].name = 'item40';
				_paras[42].value = opt40;
				_paras[43].name = 'item41';
				_paras[43].value = opt41;
				_paras[44].name = 'item42';
				_paras[44].value = opt42;
				_paras[45].name = 'item43';
				_paras[45].value = opt43;
				_paras[46].name = 'item44';
				_paras[46].value = opt44;
				_paras[47].name = 'item45';
				_paras[47].value = opt45;
				_paras[48].name = 'item46';
				_paras[48].value = opt46;
				_paras[49].name = 'item47';
				_paras[49].value = opt47;
				_paras[50].name = 'item48';
				_paras[50].value = opt48;
				_paras[51].name = 'item49';
				_paras[51].value = opt49;
				_paras[52].name = 'item50';
				_paras[52].value = opt50;
				_paras[53].name = 'item51';
				_paras[53].value = opt51;
				_paras[54].name = 'item52';
				_paras[54].value = opt52;
				_paras[55].name = 'item53';
				_paras[55].value = opt53;
				_paras[56].name = 'item54';
				_paras[56].value = opt54;
				_paras[57].name = 'item55';
				_paras[57].value = opt55;
				_paras[58].name = 'item56';
				_paras[58].value = opt56;
				_paras[59].name = 'item57';
				_paras[59].value = opt57;
				_paras[60].name = 'item58';
				_paras[60].value = opt58;
				_paras[61].name = 'item59';
				_paras[61].value = opt59;
				_paras[62].name = 'item60';
				_paras[62].value = opt60;	
				_paras[63].name = 'item61';
				_paras[63].value = opt61;
				_paras[64].name = 'item62';
				_paras[64].value = opt62;
				_paras[65].name = 'item63';
				_paras[65].value = opt63;
				_paras[66].name = 'item64';
				_paras[66].value = opt64;
				_paras[67].name = 'item65';
				_paras[67].value = opt65;
				_paras[68].name = 'item66';
				_paras[68].value = opt66;
				_paras[69].name = 'item67';
				_paras[69].value = opt67;
				_paras[70].name = 'item68';
				_paras[70].value = opt68;
				_paras[71].name = 'item69';
				_paras[71].value = opt69;
				_paras[72].name = 'item70';
				_paras[72].value = opt70;
				_paras[73].name = 'item71';
				_paras[73].value = opt71;
				_paras[74].name = 'item72';
				_paras[74].value = opt72;
				_paras[75].name = 'item73';
				_paras[75].value = opt73;
				_paras[76].name = 'item74';
				_paras[76].value = opt74;
				_paras[77].name = 'item75';
				_paras[77].value = opt75;
				_paras[78].name = 'item76';
				_paras[78].value = opt76;
				_paras[79].name = 'item77';
				_paras[79].value = opt77;
				_paras[80].name = 'item78';
				_paras[80].value = opt78;
				_paras[81].name = 'item79';
				_paras[81].value = opt79;
				_paras[82].name = 'item80';
				_paras[82].value = opt80;
				_paras[83].name = 'item81';
				_paras[83].value = opt81;
				_paras[84].name = 'item82';
				_paras[84].value = opt82;
				_paras[85].name = 'item83';
				_paras[85].value = opt83;
				_paras[86].name = 'item84';
				_paras[86].value = opt84;
				_paras[87].name = 'item85';
				_paras[87].value = opt85;
				_paras[88].name = 'item86';
				_paras[88].value = opt86;
				_paras[89].name = 'item87';
				_paras[89].value = opt87;
				_paras[90].name = 'item88';
				_paras[90].value = opt88;
				_paras[91].name = 'item89';
				_paras[91].value = opt89;
				_paras[92].name = 'item90';
				_paras[92].value = opt90;
				_paras[93].name = 'item91';
				_paras[93].value = opt91;
				_paras[94].name = 'item92';
				_paras[94].value = opt92;
				_paras[95].name = 'item93';
				_paras[95].value = opt93;				
		
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
		        
		        $(".Alert").children().eq(0).text("提交完成！");
		        $(".Alert").children().eq(1).remove();
        		$(".Alert").css("display","block");
        		$(".page11").css("display","none");
        		$(".signature").attr("readonly","readonly");
			}
		}
	}
	
function startTime(){
	
	var today=new Date();
	var h=today.getHours();
	var m=today.getMinutes();
	var s=today.getSeconds();
	
	// add a zero in front of numbers<10
	m=checkTime(m);
	s=checkTime(s);
	
	document.getElementById('clock').innerHTML = h+":"+m+":"+s;
	t=setTimeout('startTime()',500);
	
}

function checkTime(i)
{
	if (i<10) 
	  {i="0" + i}
	  return i
}
		

function shutAlert(){
	$(".Alert").css("display","none");
}
//receiving控制页面上一个DIV的函数
function refuse(){
	var den = document.getElementsByClassName("deny");
	den[0].style.display = "block";
}
function shutrefuse(){
	var den = document.getElementsByClassName("deny");
	den[0].style.display = "none";
}
//pricing页面上选择区域的函数
function chooses(type1,type2,hd1,hd2,no1,no2){
	var opt1 = document.getElementsByClassName(type1);
	var opt2 = document.getElementsByClassName(type2);
	var head1 = document.getElementsByClassName(hd1);
	var head2 = document.getElementsByClassName(hd2);
	var li1 = document.getElementsByClassName(no1);
	var li2 = document.getElementsByClassName(no2);

	opt1[0].style.display = "block";
	opt2[0].style.display = "none";
	head1[0].style.display = "block";
	head2[0].style.display = "none";
	
	li1[0].style.color = "rgb(237,101,41)";
	li2[0].style.color = "rgb(100,100,100)";
	
	li1[0].style.borderBottom = "10px solid rgb(237,101,41)"
	li2[0].style.borderBottom = "0"
}
//待接收订单查询
function order_to_recieve() {
	var vml =
 '[{"namespace":"protocol","cmd":"data","version":1,"id":"Dtms_0001","paras":[{"name":"OpenId","value":"123432433dsds"}]}]';
	
	NSF.System.Network.Ajax('/Portal.aspx',
		vml,
		'POST',
		false,
		function(result, data) {
			if(result) {
				
				for(var i = 0; i < data[0].rs[0].rows.length;i++){
					
					if(data[0].rs[0].rows[i].SrcClass == 2){
						var defaultdiv = $(".defaultdiv1");
						var clonediv = defaultdiv.clone();
						clonediv.removeClass("defaultdiv1");
						clonediv.addClass("copy"+i);
						
						$(".copydiv1").append(clonediv);
						$(".copy"+i+" a").attr("href","aorder.html?orderid="+data[0].rs[0].rows[i].id);
						
						$(".copy"+i+" #From").text(data[0].rs[0].rows[i].From);
						$(".copy"+i+" #To").text(data[0].rs[0].rows[i].To);
						$(".copy"+i+" #CustomerName").text(data[0].rs[0].rows[i].CustomerName);
						$(".copy"+i+" #EndUserName").text(data[0].rs[0].rows[i].EndUserName);
						$(".copy"+i+" #weight").text(data[0].rs[0].rows[i].Weight);
						$(".copy"+i+" #volume").text(data[0].rs[0].rows[i].Volume);
						$(".copy"+i+" #Qty").text(data[0].rs[0].rows[i].Qty);
						
					}else if(data[0].rs[0].rows[i].SrcClass == 3){
						var defaultdiv = $(".defaultdiv2");
						var clonediv = defaultdiv.clone();
						clonediv.removeClass("defaultdiv2");
						clonediv.addClass("copy"+i);
						
						$(".copydiv2").append(clonediv);
						$(".copy"+i+" a").attr("href","orders.html?orderid="+data[0].rs[0].rows[i].id);
						
						$(".copy"+i+" #From").text(data[0].rs[0].rows[i].From);
						$(".copy"+i+" #To").text(data[0].rs[0].rows[i].To);
						$(".copy"+i+" #CustomerName").text(data[0].rs[0].rows[i].CustomerName);
						$(".copy"+i+" #EndUserName").text(data[0].rs[0].rows[i].EndUserName);
						$(".copy"+i+" #Weight").text(data[0].rs[0].rows[i].Weight);
						$(".copy"+i+" #Volume").text(data[0].rs[0].rows[i].Volume);
						$(".copy"+i+" #Qty").text(data[0].rs[0].rows[i].Qty);
						
					}
				} 
			}
		})
}

//订单查询
function info_aorder(ID) {
	var vml =
 '[{"namespace":"protocol","cmd":"data","version":1,"id":"tms_0027","paras":[{"name":"id","value":"'+ID+'"}]}]';
	
	NSF.System.Network.Ajax('/Portal.aspx',
		vml,
		'POST',
		false,
		function(result, data) {
			if(result) { 
				//订单编号
				$("#Code").text(data[0].rs[0].rows[0].Code);
				//合同编号
				$("#Pactcode").text(data[0].rs[0].rows[0].PactCode);
				//下单时间
				$("#StatusTime").text(data[0].rs[0].rows[0].StatusTime);
				//发货人
				$("#SupplierName").text(data[0].rs[0].rows[0].SupplierName);
				//收货人
				$("#EndUserName").text(data[0].rs[0].rows[0].EndUserName);
				//提货时间
				$("#Fromtime").text(data[0].rs[0].rows[0].FromTime);
				//送货时间
				$("#ToTime").text(data[0].rs[0].rows[0].ToTime);
				//供货人电话
				$("#Fromcontact").text(data[0].rs[0].rows[0].FromContacte);
				//收货人电话
				$("#Tocontact").text(data[0].rs[0].rows[0].ToContact);
				//附加条件
				var pick = data[0].rs[0].rows[0].Pick;
				var delievery = data[0].rs[0].rows[0].delivery;
				var Onload = data[0].rs[0].rows[0].Onload;
				var offload = data[0].rs[0].rows[0].Offload;
				if(pick==1&&delievery==0&&Onload==0&&offload==0){
					$("#Additionalrequire").text("提货");
				}else if(pick==0&&delievery==1&&Onload==0&&offload==0){
					$("#Additionalrequire").text("送货");
				}else if(pick==0&&delievery==0&&Onload==1&&offload==0){
					$("#Additionalrequire").text("装货");
				}else if(pick==0&&delievery==0&&Onload==0&&offload==1){
					$("#Additionalrequire").text("卸货");
				}else if(pick==1&&delievery==1&&Onload==0&&offload==0){
					$("#Additionalrequire").text("提货&送货");
				}else if(pick==1&&delievery==0&&Onload==1&&offload==0){
					$("#Additionalrequire").text("提货&装货");
				}else if(pick==1&&delievery==0&&Onload==0&&offload==1){
					$("#Additionalrequire").text("提货&卸货");
				}else if(pick==0&&delievery==1&&Onload==1&&offload==0){
					$("#Additionalrequire").text("送货&装货");
				}else if(pick==0&&delievery==1&&Onload==0&&offload==1){
					$("#Additionalrequire").text("送货&卸货");
				}else if(pick==0&&delievery==0&&Onload==1&&offload==1){
					$("#Additionalrequire").text("装货&卸货");
				}else if(pick==1&&delievery==1&&Onload==1&&offload==0){
					$("#Additionalrequire").text("提货&送货&装货");
				}else if(pick==1&&delievery==1&&Onload==0&&offload==1){
					$("#Additionalrequire").text("提货&送货&卸货");
				}else if(pick==1&&delievery==0&&Onload==1&&offload==1){
					$("#Additionalrequire").text("提货&装货&卸货");
				}else if(pick==0&&delievery==1&&Onload==1&&offload==1){
					$("#Additionalrequire").text("送货&装货&卸货");
				}else if(pick==1&&delievery==1&&Onload==1&&offload==1){
					$("#Additionalrequire").text("提货&送货&装货&卸货");
				}else if(pick==0&&delievery==0&&Onload==0&&offload==0){
					$("#Additionalrequire").text("");
				}
				//发货地址
				$("#From").text(data[0].rs[0].rows[0].FromProvince+data[0].rs[0].rows[0].FromDistrict+data[0].rs[0].rows[0].FromCity);
				//收货地址
				$("#To").text(data[0].rs[0].rows[0].ToProvince+data[0].rs[0].rows[0].ToDistrict+data[0].rs[0].rows[0].ToCity);
				//运输模式
				if(data[0].rs[0].rows[0].TransportMode==1){
					$("#transportmode").text("零担");					
				}else if(data[0].rs[0].rows[0].TransportMode==2){
					$("#transportmode").text("整车");
				}else if(data[0].rs[0].rows[0].TransportMode==3){
					$("#transportmode").text("空运");
				}else if(data[0].rs[0].rows[0].TransportMode==4){
					$("#transportmode").text("快递");
				}else if(data[0].rs[0].rows[0].TransportMode==5){
					$("#transportmode").text("铁路");
				}else if(data[0].rs[0].rows[0].TransportMode==6){
					$("#transportmode").text("海运");
				}
				//货物分类
				if(data[0].rs[0].rows[0].GoodsCategory==1){
					$("#goodcatagory").text("普通货物");
				}else if(data[0].rs[0].rows[0].GoodsCategory==2){
					$("#goodcatagory").text("危险品");
				}else if(data[0].rs[0].rows[0].GoodsCategory==3){
					$("#goodcatagory").text("普通货物&危险品");
				}else if(data[0].rs[0].rows[0].GoodsCategory==4){
					$("#goodcatagory").text("温控货物");
				}else if(data[0].rs[0].rows[0].GoodsCategory==5){
					$("#goodcatagory").text("普通货物&温控货物");
				}else if(data[0].rs[0].rows[0].GoodsCategory==6){
					$("#goodcatagory").text("危险品&温控货物");
				}else if(data[0].rs[0].rows[0].GoodsCategory==7){
					$("#goodcatagory").text("普通货物&危险品&温控货物");
				}else if(data[0].rs[0].rows[0].GoodsCategory==0){
					$("#goodcatagory").text();
				}
				//包装方式
				if(data[0].rs[0].rows[0].PackageMode==1){
					$("#packagemode").text("散箱");
				}else if(data[0].rs[0].rows[0].PackageMode==2){
					$("#packagemode").text("托盘或木箱");
				}else if(data[0].rs[0].rows[0].PackageMode==3){
					$("#packagemode").text("托盘木箱或不规则状");
				}
				//运输方式
				if(data[0].rs[0].rows[0].ShipMode==1){
					$("#shipmode").text("市内");
				}else if(data[0].rs[0].rows[0].ShipMode==2){
					$("#shipmode").text("长途");
				}
				//是否保价
				if(data[0].rs[0].rows[0].IsInsurance==0){
					$("#insurance").text("否");
				}else if(data[0].rs[0].rows[0].IsInsurance==1){
					$("#insurance").text("是");
				}
				//客户标记
				$("#customersymbolid").text(data[0].rs[0].rows[0].CustomerSymbolID);
				//收费模式
				if(data[0].rs[0].rows[0].ChargeMode==1){
					$("#chargemode").text("体积");
				}else if(data[0].rs[0].rows[0].ChargeMode==2){
					$("#chargemode").text("数量");
				}else if(data[0].rs[0].rows[0].ChargeMode==3){
					$("#chargemode").text("立方");
				}else if(data[0].rs[0].rows[0].ChargeMode==4){
					$("#chargemode").text("其他");
				}
				$(".btn2 a").attr("href","recieveorderbycontract.html?orderid="+data[0].rs[0].rows[0].OrderID);
			}
		})
}
function info_goods(ID) {
	var vml =
 '[{"namespace":"protocol","cmd":"data","version":1,"id":"tms_0030","paras":[{"name":"did","value":"'+ID+'"}]}]';
	
	NSF.System.Network.Ajax('/Portal.aspx',
		vml,
		'POST',
		false,
		function(result, data) {
			if(result) {
			  	//物品名称
			  	$("#goodsname").text(data[0].rs[0].rows[0].Name);
				//总数量
				$("#Qty").text(data[0].rs[0].rows[0].Qty);
				//总重量
				$("#weight").text(data[0].rs[0].rows[0].weight);
				//总体积
				$("#volume").text(data[0].rs[0].rows[0].Volume);
				//计价单位
				$("#unitname").text(data[0].rs[0].rows[0].UnitName);
			}
		})	
}

//订单接收
function receive_aorder(){
	var vml =
 '[{"namespace":"protocol","cmd":"data","version":1,"id":"tms_0066","paras":[{"name":"OpenId","value":"123432433dsds"},{"name":"OrderID","value":"'+ID+'"},{"name":"Accept","value":"1"},{"name":"Description","value":""}]}]';
	
	NSF.System.Network.Ajax('/Portal.aspx',
		vml,
		'POST',
		false,
		function(result, data) {
			if(result) {
				
			}
		})	
}
//订单拒绝
function refuse_aorder(){
	var contents = $("textarea").val();
	var vml =
 '[{"namespace":"protocol","cmd":"data","version":1,"id":"tms_0066","paras":[{"name":"OpenId","value":"123432433dsds"},{"name":"OrderID","value":"'+ID+'"},{"name":"Accept","value":"0"},{"name":"Description","value":"'+contents+'"}]}]';
	
	NSF.System.Network.Ajax('/Portal.aspx',
		vml,
		'POST',
		false,
		function(result, data) {
			if(result) {
				
			}
		})	
		shutrefuse();
		
}
//合单接收
function receive_orders(){
	alert("合单接收");
		var vml =
 '[{"namespace":"protocol","cmd":"data","version":1,"id":"tms_0106","paras":[{"name":"OpenId","value":"123432433dsds"},{"name":"OrderID","value":"'+ID+'"},{"name":"Accept","value":"1"},{"name":"Description","value":""}]}]';
	
	NSF.System.Network.Ajax('/Portal.aspx',
		vml,
		'POST',
		false,
		function(result, data) {
			if(result) {
				
			}
		})
}
//合单拒绝
function refuse_orders(){
	alert("合单拒绝");
	var contents = $("textarea").val();
	var vml =
 '[{"namespace":"protocol","cmd":"data","version":1,"id":"tms_0106","paras":[{"name":"OpenId","value":"123432433dsds"},{"name":"OrderID","value":"'+ID+'"},{"name":"Accept","value":"0"},{"name":"Description","value":"'+contents+'"}]}]';
	
	NSF.System.Network.Ajax('/Portal.aspx',
		vml,
		'POST',
		false,
		function(result, data) {
			if(result) {
				
			}
		})	
		shutrefuse();
}
//合单查询（合单） 0027
function info_orders(ID) {
	var vml ='[{"namespace":"protocol","cmd":"data","version":1,"id":"tms_0027","paras":[{"name":"id","value":"'+ID+'"}]}]';
	
	NSF.System.Network.Ajax('/Portal.aspx',
		vml,
		'POST',
		false,
		function(result, data) {
			if(result) {
				//订单编号
				$("#code").text(data[0].rs[0].rows[0].Code);
				//合同编号
				$("#pactcode").text(data[0].rs[0].rows[0].PactCode);
				//下单时间
				$("#creattime").text(data[0].rs[0].rows[0].CreateTime);
				//送货人
				$("#SupplierName").text(data[0].rs[0].rows[0].Name);
			}
		})
}
//0105
function info_order_s(ID) {
	var vml ='[{"namespace":"protocol","cmd":"data","version":1,"id":"tms_0105","paras":[{"name":"did","value":"'+ID+'"}]}]';
	
	NSF.System.Network.Ajax('/Portal.aspx',
		vml,
		'POST',
		false,
		function(result, data) {
			if(result) {

				var qty = 0.0;
				var weight = 0.0;
				var volume = 0.0;
				
				for(var i = 0;i < data[0].rs[0].rows.length;i++){
					
					var div = $(".defaultdiv").clone();
					div.removeClass("defaultdiv");
					div.addClass("default"+i);
					
					$(".copydiv").append(div);
					//收货人
					$(".default"+i+" #EndUserName").text(data[0].rs[0].rows[i].endusername);
					//送货人
					$(".default"+i+" #SupplierName").text();
					//提货时间
					$(".default"+i+" #Fromtime").text(data[0].rs[0].rows[i].Fromtime);
					//送货时间
					$(".default"+i+" #ToTime").text(data[0].rs[0].rows[i].Totime);
					//收货人电话
					$(".default"+i+" #fromcontact").text();
					//送货人电话
					$(".default"+i+" #tocontact").text();
					//送货地址
					$(".default"+i+" #from").text(data[0].rs[0].rows[i].from);
					//收货地址
					$(".default"+i+" #to").text(data[0].rs[0].rows[i].to);
					//附加要求
					$(".default"+i+" #additionalrequire").text();
					
					//货物名称
					$(".default"+i+" #goodsname").text();
					//货物数量
					qty = parseFloat(qty) + parseFloat(data[0].rs[0].rows[i].amount);
					//货物重量
					weight = parseFloat(weight) + parseFloat(data[0].rs[0].rows[i].weight);
					//货物体积
					volume = parseFloat(volume) + parseFloat(data[0].rs[0].rows[i].volume);
				}
				
				$(".description #Qty").text(qty);
				$(".description #weight").text(weight);
				$(".description #volume").text(volume);
				
			}
			
		})
}

//按单报价查询 0002
function order_to_price_byorder() {
	var vml =
 '[{"namespace":"protocol","cmd":"data","version":1,"id":"Dtms_0002","paras":[{"name":"OpenId","value":"123432433dsds"}]}]';
	
	NSF.System.Network.Ajax('/Portal.aspx',
		vml,
		'POST',
		false,
		function(result, data) {
			if(result) {
				for(var i = 0; i < data[0].rs[0].rows.length;i++){
							
					if(data[0].rs[0].rows[i].SrcClass == 1){
						var defaultdiv = $(".andandefault1");
						var clonediv = defaultdiv.clone();
						clonediv.removeClass("andandefault1");
						clonediv.addClass("acopy"+i);
						
						$(".andancopy").append(clonediv);
						
						$(".acopy"+i+" #From").text(data[0].rs[0].rows[i].IFrom);
						$(".acopy"+i+" #To").text(data[0].rs[0].rows[i].ITo);
						$(".acopy"+i+" #CustomerName").text(data[0].rs[0].rows[i].CustomerName);
						$(".acopy"+i+" #EndUserName").text(data[0].rs[0].rows[i].EndUserName);
						$(".acopy"+i+" #Weight").text(data[0].rs[0].rows[i].TotalWeight);
						$(".acopy"+i+" #Volume").text(data[0].rs[0].rows[i].TotalVolume);
						$(".acopy"+i+" #Qty").text(data[0].rs[0].rows[i].TotalAmount);
						
						$(".acopy"+i+" a").attr("href","recieveorderbyorder.html?orderid="+data[0].rs[0].rows[i].id);
					}else if(data[0].rs[0].rows[i].SrcClass == 2){
						var defaultdiv = $(".andandefault2");
						var clonediv = defaultdiv.clone();
						clonediv.removeClass("andandefault2");
						clonediv.addClass("acopy"+i);
						
						$(".andancopy").append(clonediv);
						
						$(".acopy"+i+" #From").text(data[0].rs[0].rows[i].IFrom);
						$(".acopy"+i+" #To").text(data[0].rs[0].rows[i].ITo);
						$(".acopy"+i+" #CustomerName").text(data[0].rs[0].rows[i].CustomerName);
						$(".acopy"+i+" #EndUserName").text(data[0].rs[0].rows[i].EndUserName);
						$(".acopy"+i+" #Weight").text(data[0].rs[0].rows[i].TotalWeight);
						$(".acopy"+i+" #Volume").text(data[0].rs[0].rows[i].TotalVolume);
						$(".acopy"+i+" #Qty").text(data[0].rs[0].rows[i].TotalAmount);
						
						$(".acopy"+i+" a").attr("href","recieveorderbycontract.html?orderid="+data[0].rs[0].rows[i].id);
					}
				}
			}
		})
}

//补充报价查询 0003
function order_to_price_bycontract() {
	var vml =
 '[{"namespace":"protocol","cmd":"data","version":1,"id":"Dtms_0003","paras":[{"name":"OpenId","value":"123432433dsds"}]}]';
	
	NSF.System.Network.Ajax('/Portal.aspx',
		vml,
		'POST',
		false,
		function(result, data) {
			if(result) {
				for(var i = 0; i < data[0].rs[0].rows.length;i++){	
					
					if(data[0].rs[0].rows[i].SrcClass == 1){
						var defaultdiv = $(".buchongdefault1");
						var clonediv = defaultdiv.clone();
						clonediv.removeClass("buchongdefault1");
						clonediv.addClass("bcopy"+i);

						$(".buchongcopy").append(clonediv);
						
						$(".bcopy"+i+" #From").text(data[0].rs[0].rows[i].IFrom);
						$(".bcopy"+i+" #To").text(data[0].rs[0].rows[i].ITo);
						$(".bcopy"+i+" #SupplierName").text(data[0].rs[0].rows[i].CustomerName);
						$(".bcopy"+i+" #EndUserName").text(data[0].rs[0].rows[i].EndUserName);
						$(".bcopy"+i+" #weight").text(data[0].rs[0].rows[i].TotalWeight);
						$(".bcopy"+i+" #volume").text(data[0].rs[0].rows[i].TotalVolume);
						$(".bcopy"+i+" #amount").text(data[0].rs[0].rows[i].TotalAmount);
						
						$(".bcopy"+i+" a").attr("href","recieveorderbycontract.html?orderid="+data[0].rs[0].rows[i].id);
					}else if(data[0].rs[0].rows[i].SrcClass == 2){
						var defaultdiv = $(".buchongdefault2");
						var clonediv = defaultdiv.clone();
						clonediv.removeClass("buchongdefault2");
						clonediv.addClass("bcopy"+i);
						
						$(".buchongcopy").append(clonediv);
						
						$(".bcopy"+i+" #From").text(data[0].rs[0].rows[i].IFrom);
						$(".bcopy"+i+" #To").text(data[0].rs[0].rows[i].ITo);
						$(".bcopy"+i+" #SupplierName").text(data[0].rs[0].rows[i].CustomerName);
						$(".bcopy"+i+" #EndUserName").text(data[0].rs[0].rows[i].EndUserName);
						$(".bcopy"+i+" #weight").text(data[0].rs[0].rows[i].TotalWeight);
						$(".bcopy"+i+" #volume").text(data[0].rs[0].rows[i].TotalVolume);
						$(".bcopy"+i+" #amount").text(data[0].rs[0].rows[i].TotalAmount);
						
						$(".bcopy"+i+" a").attr("href","recieveorderbycontract.html?orderid="+data[0].rs[0].rows[i].id);
					}
				} 
			}
		})
}
//aorder页面的整合函数
function aorder(){
	var orderid = GetQueryString("orderid");
	info_aorder(orderid);
	info_goods(orderid);
}
//orders页面的整合函数
function orders(){
	var orderid = GetQueryString("orderid");
	$(".btn2 a").attr("href","recieveorderbyorder.html?orderid="+orderid);
	info_orders(orderid); //0027 合单信息
	info_order_s(orderid); //0105分别订单
}
//按单报价recieveorderbyorder.html
function recieve_order_byorder(){
	var vml =
 '[{"namespace":"protocol","cmd":"data","version":1,"id":"pml_0033","paras":[{"name":"id","value":"'+ID+'"}]}]';
	
	NSF.System.Network.Ajax('/Portal.aspx',
		vml,
		'POST',
		false,
		function(result, data) {
			if(result) {

			}
		})
};
//按合约报价recieveorderbyorder.html
function recieve_order_bycontract(){
	var ID = GetQueryString(orderid);
	alert(123);
	var vml =
 '[{"namespace":"protocol","cmd":"data","version":1,"id":"tms_0030","paras":[{"name":"did","value":"'+ID+'"}]}]';
	
	NSF.System.Network.Ajax('/Portal.aspx',
		vml,
		'POST',
		false,
		function(result, data) {
			if(result) {

			}
		})
};
//待签收订单列表
function signing(){
	var vml =
 '[{"namespace":"protocol","cmd":"data","version":1,"id":"Driver_grid_jplist_0008","paras":[{"name":"OpenId","value":"123432433dsds"}]}]';
	
	NSF.System.Network.Ajax('/Portal.aspx',
		vml,
		'POST',
		false,
		function(result, data) {
			if(result) {
				for(var i = 0;i < data[0].rs[0].rows.length;i++){
					
					var sign = $(".signdefault").clone();	
					sign.removeClass("signdefault");
					sign.addClass("sign"+i);
					$(".signcopy").append(sign);
					
					$(".sign"+i+" #From").text(data[0].rs[0].rows[i].from);
					$(".sign"+i+" #To").text(data[0].rs[0].rows[i].to);
					$(".sign"+i+" #CustomerName").text(data[0].rs[0].rows[i].CustomerName);
					$(".sign"+i+" #EndUserName").text(data[0].rs[0].rows[i].endusername);
					
					$(".sign"+i+" a").attr("href","infoordertosign.html?orderid="+data[0].rs[0].rows[i].id);
				}
			}
		})
};
//待签收订单详情（上半部分订单页）
function info_order_to_sign(){
	var ID = GetQueryString("orderid");
	var vml =
 '[{"namespace":"protocol","cmd":"data","version":1,"id":"tms_0027","paras":[{"name":"id","value":"'+ID+'"}]}]';
	NSF.System.Network.Ajax('/Portal.aspx',
		vml,
		'POST',
		false,
		function(result, data) {
			if(result) {
					$("#Code").text(data[0].rs[0].rows[0].Code);
					$("#Pactcode").text(data[0].rs[0].rows[0].PactCode);
					$("#Creattime").text(data[0].rs[0].rows[0].CreateTime);
					$("#SupplierName").text(data[0].rs[0].rows[0].SupplierName);
					$("#EndUserName").text(data[0].rs[0].rows[0].EndUserName);
					$("#Fromtime").text(data[0].rs[0].rows[0].FromTime);
					$("#ToTime").text(data[0].rs[0].rows[0].ToTime);
					$("#Fromcontact").text(data[0].rs[0].rows[0].FromContact);
					$("#Tocontact").text(data[0].rs[0].rows[0].ToContact);
					$("#Additionalrequire")
					$("#From").text(data[0].rs[0].rows[0].FromProvince+data[0].rs[0].rows[0].FromCity+data[0].rs[0].rows[0].FromDistrict);
					$("#To").text(data[0].rs[0].rows[0].ToProvince+data[0].rs[0].rows[0].ToCity+data[0].rs[0].rows[0].ToDistrict);
			}
		})
};

//待签收订单详情（下半部分签收项）
function info_sign(){
	var ID = GetQueryString("orderid");
	var vml =
 '[{"namespace":"protocol","cmd":"data","version":1,"id":"tms_0102","paras":[{"name":"did","value":"'+ID+'"}]}]';
	NSF.System.Network.Ajax('/Portal.aspx',
		vml,
		'POST',
		false,
		function(result, data) {
			if(result) {
				for(var i = 0;i < data[0].rs[0].rows.length;i++){
					var sign = $(".signdefault").clone();
					sign.removeClass("signdefault");
					sign.addClass("scopy"+i);
					$(".signcopy").append(sign);
					
					$(".scopy"+i+" #Name").text(data[0].rs[0].rows[i].Name);
					$(".scopy"+i+" #Qty").text(data[0].rs[0].rows[i].Qty);
					$(".scopy"+i+" #Weight").text(data[0].rs[0].rows[i].Weight);
					$(".scopy"+i+" #Volume").text(data[0].rs[0].rows[i].Volume);
				}
			}
		})
}
function recieve(){
	var listID = data[0].rs[0].rows[i].listID;
	var vml =
 '[{"namespace":"protocol","cmd":"data","version":1,"id":"tms_0068","paras":[{"name":"Operator","value":""},{"name":"OrderID","value":""},{"name":"Exception","value":""},{"name":"GoodsQty","value":""}]}]';
	NSF.System.Network.Ajax('/Portal.aspx',
		vml,
		'POST',
		false,
		function(result, data) {
			if(result) {
				for(var i = 0;i < data[0].rs[0].rows.length;i++){
					var sign = $(".signdefault").clone();
					sign.removeClass("signdefault");
					sign.addClass("scopy"+i);
					$(".signcopy").append(sign);
					
					$(".scopy"+i+" #Name").text(data[0].rs[0].rows[i].Name);
					$(".scopy"+i+" #Qty").text(data[0].rs[0].rows[i].Qty);
					$(".scopy"+i+" #Weight").text(data[0].rs[0].rows[i].Weight);
					$(".scopy"+i+" #Volume").text(data[0].rs[0].rows[i].Volume);
				}
			}
		})
}

