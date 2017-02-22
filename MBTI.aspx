<!DOCTYPE html>
<html>
	<head>
		<meta charset="{CHARSET}">
		<title></title>
		<script type="text/javascript" src="assets/js/jquery-3.1.0.js" ></script>
		<script type="text/javascript" src="js/data.js"></script>
		<script type="text/javascript" src="assets/NSF/js/NSF.0.0.4.min.js"></script>
		<link href="css/Techs_WM.css" rel="stylesheet" type="text/css"/>	
	</head>
	<body onload="startTime()">
		<div class="header">
			<div class="title0"></div>
			<div id="clock"></div>
			<h1>售后技术支持工程师测试题</h1>
			<div class="signatures"><span>测试人：</span><input class="signature" type="text" placeholder="姓名"></div>
		</div>
		
		<div class="page page1">
			<div class="title1">一、哪一个答案最能贴切的描绘你一般的感受或行为</div>
			<div class="pagecode">Page1</div>
			<table>
				<tr>
					<td colspan="2">1、当你要外出一整天，你会 </td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no1" value="J">A、计划你要做什么和在什么时候做</td>
					<td><input type="radio" class="test B2" name="no1" value="P">B、说去就去</td>
				</tr>
				
				<tr>
					<td colspan="2">2、你认为自己是一个</td>
				<tr>
					<td><input type="radio" class="test A1" name="no2" value="P">A、较为随兴所至的人</td>
					<td><input type="radio" class="test B2" name="no2" value="J">B、较为有条理的人</td>
				</tr>
				<tr>
					<td colspan="2">3、假如你是一位老师，你会选教？</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no3" value="S">A、以事实为主的课 </td>
					<td><input type="radio" class="test B2" name="no3" value="N">B、涉及理论的课程</td>
				</tr>
				
				<tr>
					<td colspan="2">4、你通常</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no4" value="E">A、与人容易混熟 </td>
					<td><input type="radio" class="test B2" name="no4" value="I">B、比较沉静或矜持</td>
				</tr>
				
				<tr>
					<td colspan="2">5、一般来说，你和哪些人比较合得来？</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no5" value="S">A、富于想象力的人</td>
					<td><input type="radio" class="test B2" name="no5" value="N">B、现实的人</td>
				</tr>
				
				<tr>
					<td colspan="2">6、一般来说，你是否经常让</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no6" value="F">A、你的情感支配你的理智</td>
					<td><input type="radio" class="test B2" name="no6" value="T">B、你的理智主宰你的情感</td>
				</tr>
				
				<tr>
					<td colspan="2">7、处理许多事情上，你会喜欢</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no7" value="P">A、凭兴所至行事</td>
					<td><input type="radio" class="test B2" name="no7" value="J">B、按照计划行事</td>
				</tr>
				
				<tr>
					<td colspan="2">8、你是否</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no8" value="E">A、容易让人了解</td>
					<td><input type="radio" class="test B2" name="no8" value="I">B、难于让人了解</td>
				</tr>
				
				<tr>
					<td colspan="2">9、按照程序表做事</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no9" value="J">A、合你心意</td>
					<td><input type="radio" class="test B2" name="no9" value="P">B、令你感到束缚</td>
				</tr>
				
				<tr>
					<td colspan="2">10、当你有一份特别的任务，你会喜欢</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no10" value="J">A、开始前小心组织计划</td>
					<td><input type="radio" class="test B2" name="no10" value="P">B、边做边找须做什么</td>
				</tr>
			</table>
			<div class="btns">
				<div class="forwardbtn" onclick="pagechange(1,2)">下一页</div>
			</div>
		</div>

		<div class="page page2">
			<div class="title1">一、哪一个答案最能贴切的描绘你一般的感受或行为</div>
			<div class="pagecode">Page2</div>
			<table>
				<tr>
					<td colspan="2">11、在大多数情况下，你会选择</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no11" value="J">A、顺其自然</td>
					<td><input type="radio" class="test B2" name="no11" value="J">B、按程序表做事</td>
				</tr>
				
				<tr>
					<td colspan="2">12、大多数人会说你是一个</td>
				<tr>
					<td><input type="radio" class="test A1" name="no12" value="I">A、重视自我隐私的人</td>
					<td><input type="radio" class="test B2" name="no12" value="E">B、非常坦率开放的人</td>
				</tr>
				
				<tr>
					<td colspan="2">13、你宁愿被人认为是一个</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no13" value="S">A、实事求是的人 </td>
					<td><input type="radio" class="test B2" name="no13" value="N">B、机灵的人</td>
				</tr>
				
				<tr>
					<td colspan="2">14、在一大群人当中，通常是</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no14" value="E">A、你介绍大家认识</td>
					<td><input type="radio" class="test B2" name="no14" value="I">B、别人介绍你</td>
				</tr>
				
				<tr>
					<td colspan="2">15、你会跟哪些人做朋友？</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no15" value="N">A、常提出新注意的</td>
					<td><input type="radio" class="test B2" name="no15" value="S">B、脚踏实地的</td>
				</tr>
				
				<tr>
					<td colspan="2">16、你倾向</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no16" value="F">A、重视感情多于逻辑</td>
					<td><input type="radio" class="test B2" name="no16" value="T">B、重视逻辑多于感情</td>
				</tr>
				
				<tr>
					<td colspan="2">17、你比较喜欢</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no17" value="P">A、坐观事情发展才作计划</td>
					<td><input type="radio" class="test B2" name="no17" value="J">B、很早就作计划</td>
				</tr>
				
				<tr>
					<td colspan="2">18、你喜欢花很多的时间</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no18" value="I">A、一个人独处</td>
					<td><input type="radio" class="test B2" name="no18" value="E">B、合别人在一起</td>
				</tr>
				
				<tr>
					<td colspan="2">19、与很多人一起会</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no19" value="E">A、令你活力培增</td>
					<td><input type="radio" class="test B2" name="no19" value="I">B、常常令你心力憔悴</td>
				</tr>
				
				<tr>
					<td colspan="2">20、你比较喜欢</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no20" value="J">A、很早便把约会、社交聚集等事情安排妥当</td>
					<td><input type="radio" class="test B2" name="no20" value="P">B、无拘无束，看当时有什么好玩就做什么</td>
				</tr>
			</table>
			<div class="btns">
				<div class="backbtn" onclick="pagechange(2,1)">上一页</div>
				<div class="forwardbtn" onclick="pagechange(2,3)">下一页</div>
			</div>
		</div>

		<div class="page page3">
			<div class="title1">一、哪一个答案最能贴切的描绘你一般的感受或行为</div>
			<div class="pagecode">Page3</div>
			<table>
				<tr>
					<td colspan="2">21、计划一个旅程时，你较喜欢 </td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no21" value="P">A、大部分的时间都是跟当天的感觉行事</td>
					<td><input type="radio" class="test B2" name="no21" value="J">B、事先知道大部分的日子会做什么</td>
				</tr>
				
				<tr>
					<td colspan="2">22、在社交聚会中</td>
				<tr>
					<td><input type="radio" class="test A1" name="no22" value="I">A、有时感到郁闷</td>
					<td><input type="radio" class="test B2" name="no22" value="E">B、常常乐在其中</td>
				</tr>
				
				<tr>
					<td colspan="2">23、你通常</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no23" value="E">A、和别人容易混熟 </td>
					<td><input type="radio" class="test B2" name="no23" value="I">B、趋向自处一隅</td>
				</tr>
				
				<tr>
					<td colspan="2">24、哪些人会更吸引你？</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no24" value="N">A、一个思想敏捷及非常聪颖的人</td>
					<td><input type="radio" class="test B2" name="no24" value="S">B、实事求是，具丰富常识的人</td>
				</tr>
				
				<tr>
					<td colspan="2">25、在日常工作中，你会</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no25" value="P">A、颇为喜欢处理迫使你分秒必争的突发</td>
					<td><input type="radio" class="test B2" name="no25" value="J">B、通常预先计划，以免要在压力下工作</td>
				</tr>
				
				<tr>
					<td colspan="2">26、你认为别人一般</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no26" value="I">A、要花很长时间才认识你</td>
					<td><input type="radio" class="test B2" name="no26" value="E">B、用很短的时间便认识你</td>
				</tr>
			</table>
			<div class="btns">
				<div class="backbtn" onclick="pagechange(3,2)">上一页</div>
				<div class="forwardbtn" onclick="pagechange(3,4)">下一页</div>
			</div>
		</div>
			
		<div class="page page4">
			<div class="title1">二、在下列每一对词语中，哪一个词语更合你心意？</div>
			<div class="pagecode">Page4</div>
			<table>
				<tr>
					<td><input type="radio" class="test A1" name="no27" value="I">A、注重隐私</td>
					<td><input type="radio" class="test B2" name="no27" value="E">B、坦率开放</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no28" value="J">A、预先安排的</td>
					<td><input type="radio" class="test B2" name="no28" value="P">B、无计划的</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no29" value="N">A、抽象</td>
					<td><input type="radio" class="test B2" name="no29" value="S">B、具体</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no30" value="F">A、温柔 </td>
					<td><input type="radio" class="test B2" name="no30" value="T">B、坚定</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no31" value="T">A、思考</td>
					<td><input type="radio" class="test B2" name="no31" value="F">B、感受</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no32" value="S">A、事实</td>
					<td><input type="radio" class="test B2" name="no32" value="N">B、意念</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no33" value="P">A、冲动 </td>
					<td><input type="radio" class="test B2" name="no33" value="J">B、决定</td>
				</tr>
				
				<tr>
					<td><input type="radio" class="test A1" name="no34" value="E">A、热衷  </td>
					<td><input type="radio" class="test B2" name="no34" value="I">B、文静</td>
				</tr>
				
				<tr>
					<td><input type="radio" class="test A1" name="no35" value="I">A、文静 </td>
					<td><input type="radio" class="test B2" name="no35" value="E">B、外向</td>
				</tr>
				
				<tr>
					<td><input type="radio" class="test A1" name="no36" value="J">A、有系统</td>
					<td><input type="radio" class="test B2" name="no36" value="P">B、随意</td>
				</tr>
			</table>
			<div class="btns">
				<div class="backbtn" onclick="pagechange(4,3)">上一页</div>
				<div class="forwardbtn" onclick="pagechange(4,5)">下一页</div>
			</div>
		</div>
				
		<div class="page page5">
			<div class="title1">二、在下列每一对词语中，哪一个词语更合你心意？</div>
			<div class="pagecode">Page5</div>
			<table>
				<tr>
					<td><input type="radio" class="test A1" name="no37" value="N">A、理论</td>
					<td><input type="radio" class="test B2" name="no37" value="S">B、肯定</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no38" value="F">A、敏感</td>
					<td><input type="radio" class="test B2" name="no38" value="T">B、公正</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no39" value="T">A、令人信服</td>
					<td><input type="radio" class="test B2" name="no39" value="F">B、感人的</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no40" value="S">A、声明</td>
					<td><input type="radio" class="test B2" name="no40" value="N">B、概念</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no41" value="P">A、不受约束</td>
					<td><input type="radio" class="test B2" name="no41" value="J">B、预先安排</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no42" value="I">A、矜持</td>
					<td><input type="radio" class="test B2" name="no42" value="E">B、健谈</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no43" value="J">A、有条不紊 </td>
					<td><input type="radio" class="test B2" name="no43" value="P">B、不拘小节</td>
				</tr>
				
				<tr>
					<td><input type="radio" class="test A1" name="no44" value="N">A、意念  </td>
					<td><input type="radio" class="test B2" name="no44" value="S">B、实况</td>
				</tr>
				
				<tr>
					<td><input type="radio" class="test A1" name="no45" value="F">A、同情怜悯 </td>
					<td><input type="radio" class="test B2" name="no45" value="T">B、远见</td>
				</tr>
				
				<tr>
					<td><input type="radio" class="test A1" name="no46" value="T">A、利益 </td>
					<td><input type="radio" class="test B2" name="no46" value="F">B、祝福</td>
				</tr>
			</table>
			<div class="btns">
				<div class="backbtn" onclick="pagechange(5,4)">上一页</div>
				<div class="forwardbtn" onclick="pagechange(5,6)">下一页</div>
			</div>
		</div>
		
		<div class="page page6">
			<div class="title1">二、在下列每一对词语中，哪一个词语更合你心意？</div>
			<div class="pagecode">Page6</div>
			<table>
				<tr>
					<td><input type="radio" class="test A1" name="no47" value="S">A、务实的</td>
					<td><input type="radio" class="test B2" name="no47" value="N">B、理论的</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no48" value="I">A、朋友不多</td>
					<td><input type="radio" class="test B2" name="no48" value="E">B、朋友众多</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no49" value="J">A、有系统</td>
					<td><input type="radio" class="test B2" name="no49" value="P">B、即兴</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no50" value="N">A、富想象的</td>
					<td><input type="radio" class="test B2" name="no50" value="S">B、以事论事</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no51" value="F">A、亲切的</td>
					<td><input type="radio" class="test B2" name="no51" value="T">B、客观的</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no52" value="T">A、客观的</td>
					<td><input type="radio" class="test B2" name="no52" value="F">B、热情的</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no53" value="S">A、建造 </td>
					<td><input type="radio" class="test B2" name="no53" value="N">B、发明</td>
				</tr>
				
				<tr>
					<td><input type="radio" class="test A1" name="no54" value="I">A、文静   </td>
					<td><input type="radio" class="test B2" name="no54" value="E">B、爱合群</td>
				</tr>
				
				<tr>
					<td><input type="radio" class="test A1" name="no55" value="N">A、理论 </td>
					<td><input type="radio" class="test B2" name="no55" value="S">B、事实</td>
				</tr>
				
				<tr>
					<td><input type="radio" class="test A1" name="no56" value="F">A、富同情</td>
					<td><input type="radio" class="test B2" name="no56" value="T">B、合逻辑</td>
				</tr>
			</table>
			<div class="btns">
				<div class="backbtn" onclick="pagechange(6,5)">上一页</div>
				<div class="forwardbtn" onclick="pagechange(6,7)">下一页</div>
			</div>
		</div>

		<div class="page page7">
			<div class="title1">二、在下列每一对词语中，哪一个词语更合你心意？</div>
			<div class="pagecode">Page7</div>
			<table>
				<tr>
					<td><input type="radio" class="test A1" name="no57" value="T">A、具分析力</td>
					<td><input type="radio" class="test B2" name="no57" value="F">B、多愁善感</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no58" value="S">A、合情合理</td>
					<td><input type="radio" class="test B2" name="no58" value="N">B、令人着迷</td>
				</tr>
			</table>
			<div class="btns">
				<div class="backbtn" onclick="pagechange(7,6)">上一页</div>
				<div class="forwardbtn" onclick="pagechange(7,8)">下一页</div>
			</div>
		</div>
	
		<div class="page page8">
			<div class="title1">三、哪一个答案最能贴切地描绘你一般的感受或行为</div>
			<div class="pagecode">Page8</div>
			<table>
				<tr>
					<td colspan="2">59、当你要在一个星期内完成一个大项目，你在开始的时候会 </td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no59" value="S">A、把要做的不同工作依次列出</td>
					<td><input type="radio" class="test B2" name="no59" value="N">B、马上动工</td>
				</tr>
				
				<tr>
					<td colspan="2">60、在社交场合中，你经常会感到</td>
				<tr>
					<td><input type="radio" class="test A1" name="no60" value="J">A、与某些人很难打开话匣儿和保持对话</td>
					<td><input type="radio" class="test B2" name="no60" value="P">B、与多数人都能从容地长谈</td>
				</tr>
				
				<tr>
					<td colspan="2">61、要做许多人也做的事，你比较喜欢</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no61" value="I">A、按照一般认可的方法去做</td>
					<td><input type="radio" class="test B2" name="no61" value="E">B、构想一个自己的想法</td>
				</tr>
				
				<tr>
					<td colspan="2">62、你刚认识的朋友能否说出你的兴趣？</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no62" value="S">A、马上可以</td>
					<td><input type="radio" class="test B2" name="no62" value="N">B、要待他们真正了解你之后才可以</td>
				</tr>
				
				<tr>
					<td colspan="2">63、你通常较喜欢的科目是</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no63" value="E">A、讲授概念和原则的</td>
					<td><input type="radio" class="test B2" name="no63" value="I">B、讲授事实和数据的</td>
				</tr>
				
				<tr>
					<td colspan="2">64、哪个是较高的赞誉，或称许为？</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no64" value="N">A、一贯感性的人</td>
					<td><input type="radio" class="test B2" name="no64" value="S">B、一贯理性的人</td>
				</tr>
				
				<tr>
					<td colspan="2">65、你认为按照程序表做事</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no65" value="F">A、有时是需要的，但一般来说你不大喜欢这样做，或是</td>
					<td><input type="radio" class="test B2" name="no65" value="T">B、大多数情况下是有帮助而且是你喜欢做的</td>
				</tr>
				
				<tr>
					<td colspan="2">66、和一群人在一起，你通常会选</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no66" value="S">A、跟你很熟悉的个别人谈话</td>
					<td><input type="radio" class="test B2" name="no66" value="S">B、参与大伙的谈话</td>
				</tr>
				
				<tr>
					<td colspan="2">67、在社交聚会上，你会</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no67" value="I">A、是说话很多的一个</td>
					<td><input type="radio" class="test B2" name="no67" value="E">B、让别人多说话</td>
				</tr>

			</table>
			<div class="btns">
				<div class="backbtn" onclick="pagechange(8,7)">上一页</div>
				<div class="forwardbtn" onclick="pagechange(8,9)">下一页</div>
			</div>
		</div>
	
		<div class="page page9">
			<div class="title1">三、哪一个答案最能贴切地描绘你一般的感受或行为</div>
			<div class="pagecode">Page9</div>
			<table>
				<tr>
					<td colspan="2">68、把周末期间要完成的事列成清单，这个主意会</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no68" value="E">A、合你意</td>
					<td><input type="radio" class="test B2" name="no68" value="I">B、使你提不起劲</td>
				</tr>
				<tr>
					<td colspan="2">69、哪个是较高的赞誉，或称许为 </td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no69" value="T">A、能干的</td>
					<td><input type="radio" class="test B2" name="no69" value="F">B、富有同情心</td>
				</tr>
				<tr>
					<td colspan="2">70、你通常喜欢</td>
				<tr>
					<td><input type="radio" class="test A1" name="no70" value="J">A、事先安排你的社交约会</td>
					<td><input type="radio" class="test B2" name="no70" value="P">B、随兴之所至做事</td>
				</tr>
				<tr>
					<td colspan="2">71、总的说来，要做一个大型作业时，你会选</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no71" value="P">A、边做边想该做什么</td>
					<td><input type="radio" class="test B2" name="no71" value="J">B、首先把工作按步细分</td>
				</tr>
				<tr>
					<td colspan="2">72、你能否滔滔不绝地与人聊天</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no72" value="I">A、只限于跟你有共同兴趣的人</td>
					<td><input type="radio" class="test B2" name="no72" value="E">B、几乎跟任何人都可以</td>
				</tr>
				<tr>
					<td colspan="2">73、你会</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no73" value="S">A、跟随一些证明有效的方法，或是</td>
					<td><input type="radio" class="test B2" name="no73" value="N">B、分析还有什么毛病，及针对尚未解决的难题</td>
				</tr>
				<tr>
					<td colspan="2">74、为乐趣而阅读时，你会</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no74" value="N">A、喜欢奇特或创新的表达方式</td>
					<td><input type="radio" class="test B2" name="no74" value="S">B、一喜欢作者直话直说</td>
				</tr>
				<tr>
					<td colspan="2">75、你宁愿替哪一类上司（或者老师）工作？</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no75" value="T">A、天性淳良，但常常前后不一的</td>
					<td><input type="radio" class="test B2" name="no75" value="N">B、言词尖锐但永远合乎逻辑的</td>
				</tr>
				<tr>
					<td colspan="2">76、你做事多数是</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no76" value="P">A、按当天心情去做</td>
					<td><input type="radio" class="test B2" name="no76" value="J">B、照拟好的程序表去做</td>
				</tr>
				<tr>
					<td colspan="2">77、你是否</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no77" value="E">A、可以和任何人按需求从容地交谈，或是</td>
					<td><input type="radio" class="test B2" name="no77" value="I">B、只是对某些人或在某种情况下才可以畅所欲言</td>
				</tr>
				<tr>
					<td colspan="2">78、要作决定时，你认为比较重要的是</td>
				</tr>
				<tr>
					<td><input type="radio" class="test A1" name="no78" value="T">A、据事实衡量</td>
					<td><input type="radio" class="test B2" name="no78" value="F">B、考虑他人的感受和意见</td>
				</tr>
			</table>
			<div class="btns">
				<div class="backbtn" onclick="pagechange(9,8)">上一页</div>
				<div class="forwardbtn" onclick="pagechange(9,10)">下一页</div>
			</div>
		</div>
		
		<div class="page page10">
			<div class="title1">四、在下列每一对词语中，哪一个词语更合你心意？</div>
			<div class="pagecode">Page10</div>
			<table>
				<tr>
					<td><input type="radio" class="test A1" name="no79" value="N">A、想象的</td>
					<td><input type="radio" class="test B2" name="no79" value="S">B、真实的</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no80" value="F">A、仁慈慷慨的</td>
					<td><input type="radio" class="test B2" name="no80" value="T">B、意志坚定的</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no81" value="T">A、公正的</td>
					<td><input type="radio" class="test B2" name="no81" value="F">B、有关怀心</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no82" value="S">A、制作</td>
					<td><input type="radio" class="test B2" name="no82" value="N">B、设计</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no83" value="N">A、可能性</td>
					<td><input type="radio" class="test B2" name="no83" value="S">B、必然性</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no84" value="F">A、温柔</td>
					<td><input type="radio" class="test B2" name="no84" value="T">B、力量</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no85" value="T">A、实际</td>
					<td><input type="radio" class="test B2" name="no85" value="F">B、多愁善感</td>
				</tr>
				
				<tr>
					<td><input type="radio" class="test A1" name="no86" value="S">A、制造</td>
					<td><input type="radio" class="test B2" name="no86" value="N">B、创造</td>
				</tr>
				
				<tr>
					<td><input type="radio" class="test A1" name="no87" value="N">A、新颖的</td>
					<td><input type="radio" class="test B2" name="no87" value="S">B、已知的</td>
				</tr>
				
				<tr>
					<td><input type="radio" class="test A1" name="no88" value="F">A、同情</td>
					<td><input type="radio" class="test B2" name="no88" value="T">B、分析</td>
				</tr>
			</table>
			<div class="btns">
				<div class="backbtn" onclick="pagechange(10,9)">上一页</div>
				<div class="forwardbtn" onclick="pagechange(10,11)">下一页</div>
			</div>
		</div>
		
		<div class="page page11">
			<div class="title1">四、在下列每一对词语中，哪一个词语更合你心意？</div>
			<div class="pagecode">Page11</div>
			<table>
				<tr>
					<td><input type="radio" class="test A1" name="no89" value="T">A、坚持己见</td>
					<td><input type="radio" class="test B2" name="no89" value="F">B、温柔有爱心</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no90" value="S">A、具体的</td>
					<td><input type="radio" class="test B2" name="no90" value="N">B、抽象的</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no91" value="F">A、全心投入</td>
					<td><input type="radio" class="test B2" name="no91" value="T">B、有决心的</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no92" value="T">A、能干</td>
					<td><input type="radio" class="test B2" name="no92" value="F">B、仁慈</td>
				</tr>

				<tr>
					<td><input type="radio" class="test A1" name="no93" value="S">A、实际</td>
					<td><input type="radio" class="test B2" name="no93" value="N">B、创新</td>
				</tr>
			</table>
			<div class="btns">
				<div class="backbtn" onclick="pagechange(11,10)">上一页</div>
				<div class="submiter" onclick="submitanswer()">提交</div>
			</div>
		</div>
	
		<div class="Alert">
			<p>请完成所有的题目之后提交！</p>
			<div class="shutdown" onclick="shutAlert()">X</div>
		</div>
	</body>
</html>
