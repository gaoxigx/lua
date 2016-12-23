-- 适用屏幕参数appKill("com.tencent.xin");


-- 陌陌关注
function findmm()

 	local ynum=getparamecom(gsinfo,'mustt_ynum');

	runApp();
	homePage();--弹出异常

    mSleep(1000);
    local i = 0;
    local jt = 1;
    click(62,1083);--点附近
    mSleep(500);

    click(199,88);--
    mSleep(500);

    click(322,82);--点人
    mSleep(500);

    click(62,1083);--点附近
    mSleep(500);

    while true do
    	if(i==0) then
    		homelist();
    		i=i+1;
    	end
    	--是否到了首页


    	if(i>tonumber(ynum)) then 
    		break;
    	end

    	x, y = findColorInRegionFuzzy(0xf95645,93,338,1045,357,1066); 
		if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件
			sendMsg();
		end

    	if(listcolorinfo(0x77cee5,95,175,185,320,238)==false and listcolor90(0x7394ff, 199, 168, 292, 296)==false and listcolor90(0xf52156, 103, 250, 138, 285)==false and listcolorinfo(0xe81f1f,80, 175, 141, 416, 200)==false) then
    		  		
			click(97,229);--点列表进入
			local fl = followinfo();
			if fl==1 then
				i=i+1; 
			end

			if fl==2 then
				mSleep(100)
				blockinfo();
				mSleep(100)
				blockinfo();
				break; 
			end
	    	--关注 
	    	mSleep(100)
			blockinfo();
	    end

		if(listcolorinfo(0x2158ff,90,21,148,144,224)==true) then
			jt=jt+1;
			infomove(305,749,140);
		end

	    homelist();
    end
	
end
function sendMsgInfo()
	local txtmsg=getparamecom(gsinfo,'mustt_txtmsg');
	mSleep(1000);
	if(listcolorinfo(0141414,90,407,1078,431,1101)==false and listcolorinfo(0x00c0ff,95,48,1066,98,1111)==false) then
		blockinfo();
		mSleep(500);
		return 0;
	end

	click(299,1094); --点对话
	mSleep(600);

	if(listcolorinfo(0x0c0c0c,90,407,1078,431,1101)==true and listcolorinfo(0x007399,95,48,1066,98,1111)==true and listcolorinfo(0x7e0c0c,90,443,1066,496,1121)) then
		click(188,629);
		mSleep(300);

		blockinfo();
		mSleep(500);
		return 1;
	end

	if listcolorinfo(0x3462ff,90,544,1061,616,1121)==false then
		blockinfo();
		mSleep(300);
		return 0;
	end

	click(109,1013);
	mSleep(100);

	inputText(txtmsg);--输入字信息
	mSleep(100);

	click(560,1092);
	mSleep(500);

	blockinfo();
	mSleep(500);

	blockinfo();
	mSleep(1000);

	mSleep(500);
	click(62,1083);
	mSleep(500);
	return 0;
end


--发送回复信息
function sendMsg()	

	local txtmsg=getparamecom(gsinfo,'mustt_sendmsg');
	--sendMsg();
	mSleep(1000);
	
	click(322,1073);
	local x = 1;
	mSleep(1000);

	while true do
		if(x==1) then
			infomovedow(305,549,250);
			mSleep(300);
			infomove(305,549,100);
			--infomove(305,549,250);
		end
		x=x+1;

		if(listcolorinfo(0xf95645,90,571,199,632,250)==true or listcolorinfo(0xf95645,90,586,341,620,374)==true) then
			mSleep(400);
			click(286,205);--进入聊天框
				mSleep(800);

				click(109,1013);
				mSleep(100);

				inputText(txtmsg);--输入字信息
				mSleep(100);

				click(560,1092);
				mSleep(500);

				blockinfo();
				mSleep(1000);

				infomove(305,549,160);
		else
			break;
		end
	end

	mSleep(500);
	click(62,1083);
	mSleep(500);
end
--关注
function followinfo()
	mSleep(500);
	if(listcolorinfo(0x141414,90,407,1078,431,1101)==true and listcolorinfo(0x00c0ff,95,48,1066,98,1111)==true and listcolorinfo(0xd21515,90,443,1066,496,1121)) then
	
		mSleep(500);
		click(299,1094); --点关注

		mSleep(1000);
		click(459,633);

		mSleep(2000);
		click(556,373)--点赞
		mSleep(500);
		--notifyMessage(gsinfo,7000);
		
		issendmsg=getparamecom(gsinfo,"mustt_issendmsg");
		if issendmsg=="2" then
			if sendMsgInfo()==1 then
				return 2;
			end
		end

		blockinfo(); --关注之后返回
		mSleep(500)
		if(listcolorinfo(0x00c0ff,80,31,1063,161,1122)==false) then
			blockinfo(); --关注之后返回
			mSleep(500)
		end
		
		mSleep(500)
		blockinfo();
		return 1;
	end
	return 0;
end

--点返回
function blockinfo()
	click(31,88);--点返回
	mSleep(200);
end

function colorareclick(color,x,y,x1,y1) 
	local x = 1;
	while true do
		for sim = 100, 95, -1 do  
			x, y = findColorInRegionFuzzy(color, sim,x,y,x1,y1); 
			if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件
				click(x,y);
				return;
			end
		end
		x=x+1;
		if(x==4) then
			break;
		end
		mSleep(500);
	end
	
end
--是否正在真播
function listcolor(color,x,y,x1,y1)
	for sim = 100, 80, -1 do  
		x, y = findColorInRegionFuzzy(color, sim,x,y,x1,y1); 
		if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件
			return true;
		end
	end
	return false;
end
--查询哪一段
function listcolor90(color,x,y,x1,y1)
	for sim = 100, 90, -1 do  
		x, y = findColorInRegionFuzzy(color, sim,x,y,x1,y1); 
		if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件
			return true;
		end
	end	
	return false;
end
--查询哪一段
function listcolorinfo(color,num,x,y,x1,y1)
	for sim = 100, num, -1 do  
		x, y = findColorInRegionFuzzy(color, sim,x,y,x1,y1); 
		if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件
			return true;
		end
	end
	return false;
end

function homelist()
	infomove(305,749,210);
end

--上下拉动
function infomove(x,y,z);
	mSleep(800);
    touchDown(0,x,y);
    mSleep(500);                
    touchMove(0,x,y-z);
    mSleep(100);                
    touchUp(0);
end

function infomovedow(x,y,z);
	mSleep(800);
    touchDown(0,x,y);
    mSleep(500);                
    touchMove(0,x,y+z);
    mSleep(100);                
    touchUp(0);
end

function infomovex(x,y,z);

	mSleep(800);
    touchDown(0,x,y);
    mSleep(500);                
    touchMove(0,x-z,y);
    mSleep(100);                
    touchUp(0);
end

function leftrightmovee(x,y,x1,y1)
    touchDown(0,x,y);
    mSleep(200);                
    touchMove(0,x1,y1);
    mSleep(100);                
    touchUp(0);
end
function click(x, y)
    touchDown(0, x, y);
    mSleep(200);
    touchUp(0);
end

function runApp()
	appRun("com.wemomo.momoappdemo1");
	local x=getparamezb(gsinfo,'phonex');
    local y=getparamezb(gsinfo,'phoney');

	fakeGPS("com.wemomo.momoappdemo1",x ,y);
end
--第一页首页
function homePage()
   	for sim = 100, 92, -1 do  
		x, y = findColorInRegionFuzzy(0x007aff, sim, 277, 627, 355, 700); 
		if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件

			click(318,668);--好
			mSleep(200);
			break;   --并跳出循环
		end
	end
	
	for sim = 100, 92, -1 do  
		x, y = findColorInRegionFuzzy(0x007aff, sim, 80, 644, 280, 700); 
		if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件
			
			click(184,686);--升级
			mSleep(200);
			break;   --并跳出循环
		end
	end


	if(listcolorinfo(0x262626,97,496,1065,529,1093)==true and listcolorinfo(0x00c0ff,95,49,1063,74,1080)==true ) then
		mSleep(1500);
		if(listcolor90(0x262626,97,496,1065,529,1093)==true and listcolorinfo(0x00c0ff,95,49,1063,74,1080)==true) then
			return;
		end
	end
	--[[
	if(getColor(31,82)==15527403 or (getColor(31,82)==x0f7f7f7 or getColor(31,82)==16250871)and(getColor(496,92)==x0f7f7f7 or getColor(496,92)==16250871)) then
		mSleep(1500);
		if(getColor(31,82)==15527403 or (getColor(31,82)==x0f7f7f7 or getColor(31,82)==16250871)and(getColor(496,92)==x0f7f7f7 or getColor(496,92)==16250871)) then
   	   		return;
   		end
   	end
	--]]

   	mSleep(400);
   	homePage();
   	--]]
end

function delemove()
	mSleep(900);
    touchDown(9, 430, 340)
    mSleep(47);
    touchMove(9, 414, 340)
    mSleep(17);
    touchMove(9, 406, 340)
    mSleep(19);
    touchMove(9, 398, 340)
    mSleep(16);
    touchMove(9, 388, 340)
    mSleep(16);
    touchMove(9, 380, 340)
    mSleep(17);
    touchMove(9, 370, 340)
    mSleep(17);
    touchMove(9, 360, 340)
    mSleep(16);
    touchMove(9, 350, 338)
    mSleep(18);
    touchMove(9, 342, 338)
    mSleep(16);
    touchMove(9, 334, 338)
    mSleep(17);
    touchMove(9, 326, 338)
    mSleep(16);
    touchMove(9, 318, 338)
    mSleep(17);
    touchMove(9, 310, 338)
    mSleep(16);
    touchMove(9, 302, 338)
    mSleep(17);
    touchMove(9, 296, 338)
    mSleep(16);
    touchMove(9, 288, 338)
    mSleep(17);
    touchMove(9, 280, 336)
    mSleep(17);
    touchMove(9, 274, 336)
    mSleep(16);
    touchMove(9, 268, 334)
    mSleep(17);
    touchMove(9, 262, 334)
    mSleep(17);
    touchMove(9, 254, 334)
    mSleep(17);
    touchMove(9, 246, 334)
    mSleep(17);
    touchMove(9, 238, 334)
    mSleep(16);
    touchMove(9, 232, 332)
    mSleep(16);
    touchMove(9, 224, 332)
    mSleep(17);
    touchMove(9, 216, 332)
    mSleep(17);
    touchMove(9, 208, 330)
    mSleep(17);
    touchMove(9, 202, 330)
    mSleep(16);
    touchMove(9, 196, 330)
    mSleep(17);
    touchMove(9, 188, 328)
    mSleep(17);
    touchMove(9, 182, 328)
    mSleep(16);
    touchMove(9, 174, 326)
    mSleep(18);
    touchMove(9, 166, 326)
    mSleep(16);
    touchMove(9, 158, 324)
    mSleep(17);
    touchMove(9, 148, 324)
    mSleep(16);
    touchMove(9, 136, 324)
    mSleep(17);
    touchUp(9)

    mSleep(1000);
end

--登入
function logininfo()

end
--退出
function queryinfo()
	click(578,1077); --点个人中心
	mSleep(800);

	infomove(301,801,600);
	mSleep(500);

	click(208,945);--点设置

	mSleep(700);

	click(215,929);--退出当前账号
	mSleep(900);

	click(454,672);
	mSleep(600);
end