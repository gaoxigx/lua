-- 适用屏幕参数appKill("com.tencent.xin");

--陌陌站街
function mobileGPRS()
	appKill("com.wemomo.momoappdemo1");
    mSleep(1100);
	
	local x=getparamezb(gsinfo,'phonex');
    local y=getparamezb(gsinfo,'phoney');

	fakeGPS("com.wemomo.momoappdemo1",x ,y);
	appRun("com.wemomo.momoappdemo1");--启动陌陌
	boxinfo();
	infomovedow(311,514,400);
	mSleep(2000);
end 
--给和我打招呼人发送信息
function zgsendmsg()
	for sim = 100, 80, -1 do   
		x,y=findColorInRegionFuzzy(0x0f4ad1,sim,25,534,109,617); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
		if x ~= -1 and y ~= -1 then          -- 如果找到了
			mSleep(800);
			click(x,y);--不绑定手机号码
			into=1;
		    break;
		else		
			mSleep(200);	
			into=2;
		end
	end
end

--陌陌使用微信登入
function mmlogin()

	appKill("com.wemomo.momoappdemo1");
    mSleep(1100);
	appRun("com.wemomo.momoappdemo1");
	mSleep(1000);

	while true do
		x,y=findColorInRegionFuzzy(0x3462ff,80,413,801,454,828); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
		if x ~= -1 and y ~= -1 then          -- 如果找到了
			mSleep(1000);
			click(190,1065);--点微信登陆
		    break;
		else		
			click(31,88);--点返回
			mSleep(500);	
		end
	end	

	while true do
		x,y=findColorInRegionFuzzy(0x04be02,80,414,771,457,790); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
		if x ~= -1 and y ~= -1 then          -- 如果找到了
			mSleep(800);
			click(320,782);--确认微信登陆
		    break;
		else		
			mSleep(200);	
		end
	end

	mSleep(3500);
	local into = 1
	--绑定手机页面
	for sim = 100, 80, -1 do   
		x,y=findColorInRegionFuzzy(0x3462ff,sim,275,566,307,592); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
		if x ~= -1 and y ~= -1 then          -- 如果找到了
			mSleep(800);
			click(539,226);--不绑定手机号码
			into=1;
		    break;
		else		
			mSleep(200);	
			into=2;
		end
	end
	--是第一次登入
	if(into==2) then
		onelogin();
	end
	
end
--第一个登入陌陌
function onelogin()
	mSleep(600);
	click(173,630);--修改日期
	mSleep(800);
	click(77,328);

	mSleep(800);--
	click(311,1008);--点击一步

	mSleep(3000);
	click(227,337);--点击设置密码框;	

	click(66,880);
	mSleep(500);
	click(127,880);
	mSleep(500);
	click(194,880);
	click(66,880);
	mSleep(500);
	click(127,880);
	mSleep(500);
	click(194,880);

	while true do
		x,y=findColorInRegionFuzzy(0x3462ff,80,400,510,444,540); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
		if x ~= -1 and y ~= -1 then          -- 如果找到了
			mSleep(1000);
			click(340,517);--点进入陌陌
		    break;
		else			
			mSleep(500);	
		end
	end


	while true do
		x,y=findColorInRegionFuzzy(0x3462ff,80,310,543,337,565); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
		if x ~= -1 and y ~= -1 then          -- 如果找到了
			mSleep(1000);
			click(541,233);--取消绑定手机
		    break;
		else			
			mSleep(500);	
		end
	end

	mSleep(2000);
	click(61,77);--关闭
end
--发送陌陌动态
function sendnew()
	delphoto();
	local tpurl="/var/touchelf/scripts/scriptfile/images/mmtu.jpg";
	if file_exists(tpurl)==false  then
		local path="ftp://121.40.140.16:/script/luaimg/mmtu.jpg";      
        local getdata=ftpGet(path, tpurl, "productconsole", "T4t8u0p1");
        if getdata then
		    notifyMessage("下载成功")
		else
		    friendmi();
		    return;
		end
	end	
	saveImageToAlbum(tpurl);
    mSleep(1000);

	openmm();
	boxinfo();
	sendnewinfo();
end
function setsex()
	click(50,88);
	mSleep(800);
	
	local sex=getparamecom(gsinfo,'mustt_sex');
	sex=0;
	if sex==0 then
		--点击男生
		click(316,800)
		mSleep(800);
	else
		--点击女生
		click(310,888);
		mSleep(1000);
	end
end
-- 陌陌关注
function findmm()

 	local ynum=getparamecom(gsinfo,'mustt_ynum');

	runApp();
	--homePage();--弹出异常
   
    mSleep(1000);
    local i = 0;
    local jt = 1;
    click(62,1083);--点附近
    mSleep(500);
    
    click(322,82);--点人

    mSleep(500);

    setsex();--设置只看性别
    mSleep(2000);

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
			--sendMsg();
		end

    	if(listcolorinfo(0x77cee5,95,175,185,320,238)==false and listcolor90(0x7394ff, 199, 168, 292, 296)==false and listcolor90(0xf52156, 103, 250, 138, 285)==false and listcolorinfo(0xe81f1f,80, 175, 141, 416, 200)==false) then
    		  		
			click(97,229);--点列表进入
			local fl = followinfo();
			if fl==1 then
				i=i+1; 
			end
			--[[
			if fl==2 then
				mSleep(100)
				--blockinfo();
				mSleep(100)
				--blockinfo();
				break; 
			end--]]
	    	--关注 
	    	mSleep(100)
			blockinfo();
	    end
	    --[[
		if(listcolorinfo(0x2158ff,90,21,148,144,224)==true) then
			jt=jt+1;
			infomove(305,749,140);
		end
		--]]
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
	mSleep(1000);

	click(560,1092);
	mSleep(500);

	blockinfo();
	mSleep(500);
	--[[
	blockinfo();
	mSleep(1000);

	mSleep(500);
	click(62,1083);
	mSleep(500);
	--]]
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
	mSleep(1500);
	--if(listcolorinfo(0x00c0ff,80,434,1098,454,1105)==true) then	

		for sim = 100, 80, -1 do   
			x,y=findColorInRegionFuzzy(0x00c0ff,sim,434,1098,454,1105); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
			if x ~= -1 and y ~= -1 then          -- 如果找到了
				mSleep(500);
				click(468,1094); --点关注
				mSleep(500);
			    break;
			else		
				mSleep(200);	
			end
		end

		for sim = 100, 95, -1 do   
			x,y=findColorInRegionFuzzy(0xff5833,sim,532,355,577,392); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
			if x ~= -1 and y ~= -1 then          -- 如果找到了
				mSleep(500);
				click(556,373); --点赞
				mSleep(2000);
		
			    break;
			else		
				mSleep(200);	
			end
		end

		for sim = 100, 90, -1 do   
			x,y=findColorInRegionFuzzy(0xff5833,sim,535,516,577,553); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
			if x ~= -1 and y ~= -1 then          -- 如果找到了
				mSleep(2000);
				click(556,535); --点赞
				mSleep(500);
			    break;
			else		
				mSleep(200);	
			end
		end

		
		
		
		
		--mSleep(1000);
		--click(459,633);		
		--notifyMessage(gsinfo,7000);
		
		issendmsg=getparamecom(gsinfo,"mustt_issendmsg");

		
		if issendmsg=="2" then
			for sim = 100, 80, -1 do   
				x,y=findColorInRegionFuzzy(0x00c0ff,sim,277,1082,295,1101); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
				if x ~= -1 and y ~= -1 then          -- 如果找到了
					if sendMsgInfo()==1 then
						return 2;
					end
				    break;
				else		
					mSleep(200);	
				end
			end
		end
		--[[
		blockinfo(); --关注之后返回
		mSleep(500)
		if(listcolorinfo(0x00c0ff,80,31,1063,161,1122)==false) then
			blockinfo(); --关注之后返回
			mSleep(500)
		end
		--]]

		mSleep(1000)
		--blockinfo();
		--mSleep(500)
		--[[
		local tnum = 1;
		while true do 
			tnum=tnum+1;
			mSleep(1000)
			if(listcolorinfo(0x00c0ff,80,52,1058,46,1078)==true) then
				break;
			end

			if tnum>5 then
				break;
			end
			blockinfo(); --关注之后返回
			mSleep(500)
		end
		--]]
		return 1;
	--end
	--return 0;
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
     mSleep(1000);       
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
	appKill("com.wemomo.momoappdemo1");
    mSleep(1100);
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

function mmGPRS()
	appKill("com.wemomo.momoappdemo1");
    mSleep(1100);
	
	local x=getparamezb(gsinfo,'phonex');
    local y=getparamezb(gsinfo,'phoney');

	fakeGPS("com.wemomo.momoappdemo1",x ,y);
	notifyMessage('陌陌地址修改成功');

	appRun("com.wemomo.momoappdemo1");
end

    --通讯录检测手机号码，检测男女
function wxtxlfriend()
	appRun("com.tencent.xin");

	local i = 1;
      mSleep(3000);
   	  while true do
			x, y = findColorInRegionFuzzy(0x007aff, 90, 277, 627, 355, 700); 
			if x ~= -1 and y ~= -1 then  --如果在指定区域找到某点符合条件
				click(317,668);--好
				mSleep(200);
				break;   --并跳出循环
			end
			i=i+1;
			mSleep(200);
			if i>40 then
				break;
			end
	  end 
	  mSleep(500);
	  click(451,705);
	  mSleep(500);
	while true do
      if txlfrind()==false then
		mSleep(1000);
		if selan()==false then
			return;
		end        
      end
  end
end
function txlfrind()     
      
      appRun("com.tencent.xin");
   -- if findcolor(0x1aad19,522,287,604,341) then
      mSleep(500);
      click(26,83);
      mSleep(500);
      click(26,83);
      mSleep(500);
      click(26,83);
      mSleep(500);
      click(26,83);
      mSleep(500);
      click(26,83);
  
      mSleep(500);
      click(238,1079);
      mSleep(500);

      mSleep(5000);

      click(218,274);
      mSleep(500);

      local i = 0;
      while true do
        mSleep(500);
       
          for sim = 100, 92, -1 do  
        x, y = findColorInRegionFuzzy(0xff3b30, sim, 529, 445, 627, 523); 
        if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件
          click(x,y);
          --click(184,686);--升级
          mSleep(200);
          break;   --并跳出循环
        end
      end
      clickMove(320,482,180,482,20);
          mSleep(100);
       
          --for sim = 100, 92, -1 do  
        x, y = findColorInRegionFuzzy(0x71d01d, 90, 24, 259, 90, 361); 
        if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件
			
          return false;         
         -- break;   --并跳出循环
        else
          if i>3 then
             break;
          end
        end
        i=i+1;
    --end
     end
     mSleep(5000);

     mSleep(500);
     click(26,83);
     mSleep(1000);
     addressbook();
     return true;
  	--[[
       t = true;
      for i=1,6 do
        if fuzzycolor(0x1aad19,494,256,637,1130)==false then
          mSleep(1000);
          t=false;
        else
          break;
        end
      end
      if t==true then
       -- addressbook();
      end
    return t;
   --]]
end

function selan()
	click(250,288);
	mSleep(8000);
	local xt=false;
	if fuzzycolor(0x1aad19,480,261,624,997)==true then
		xt= true;

	end
	mSleep(500);
    click(26,83);
    mSleep(500);
    addressbook();
	return xt;
	
end

function fuzzycolor(color,x,y,x1,y1)
  local sul = false;
  for sim = 100, 98, -1 do           --使用 for 循环不断降低精确度(建议精确度不低于50%)
      x, y = findColorInRegionFuzzy(color, sim, x, y, x1, y1); 
      if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件
          sul= true;
          break;                    --并跳出循环
      end
  end
  return sul;
end

function remove(path)
    return os.execute("rm -rf "..path);
end

--修改通讯录
function addressbook()
  appRun("feibiao.WriteAddressbook");
  mSleep(1000);
  --[[
  click(322,106);
  inputText("\b\b\b\b\b");
  --inputText("20");
 --]]
  click(548,289);
  inputText("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b");
  mSleep(200);
  inputText("http://g.7gu.cn/book.php?");
  mSleep(1000);
  click(293,475);
  mSleep(2000);
end

--通用修改GPRS
function addressapp()
	local gsinfo1=runparame();
	local codeid=getparamecom(gsinfo1,'mustt_codeid');
	
	   appKill(codeid);
	   mSleep(1100);

	  --local x=getparamecom(gsinfo,'mustt_phonex');
	  --local y=getparamecom(gsinfo,'mustt_phoney');
	  --local x = 23.088239;
	  --local y = 113.521794;
	  
	  local x=getparamecom(gsinfo1,'phonex');
      local y=getparamecom(gsinfo1,'phoney');
	  notifyMessage('通用GPRS地址修改'..x);
	  notifyMessage('通用GPRS地址修改'..y);
	  fakeGPS(codeid,x ,y);
	  notifyMessage('通用GPRS地址修改'..codeid);
	 
	  appRun(codeid);
	  mSleep(5000);
end

--登入时是否有弹框 
function boxinfo()	

	while true do
		x,y=findColorInRegionFuzzy(0x00c0ff,80,43,1050,79,1092); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
		if x ~= -1 and y ~= -1 then          -- 如果找到了			
			break;		
		end
		mSleep(500);
	end

	while true do
		mSleep(1500);
		click(579,1084);
		mSleep(2000);
		x,y=findColorInRegionFuzzy(0x00c0ff,80,559,1059,592,1090); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
		if x ~= -1 and y ~= -1 then          -- 如果找到了
			click(62,1085);
			break;
		end
		click(185,699);
		mSleep(800);
	end
end
--发送陌陌动态
function sendnewinfo()
	

	for sim = 100, 80, -1 do   
		x,y=findColorInRegionFuzzy(0x00c0ff,sim,43,1050,79,1092); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
		if x ~= -1 and y ~= -1 then          -- 如果找到了
			click(64,1068)
			break;
		--else
			--click(59,86);
		end
	end

	while true do
		click(440,87);
		mSleep(800);
		--click(554,949);
		click(590,85);
		mSleep(800);
		
		for sim = 100, 80, -1 do   
			x,y=findColorInRegionFuzzy(0x069aff,sim,392,310,432,346); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
			if x ~= -1 and y ~= -1 then          -- 如果找到了				
				mSleep(500);
				--click(244,770);	
				click(412,326);
				mSleep(1000);
				sedimginfo();
				break;
			else
				mSleep(200);
			end
		end	
		break;	
	end

end
--点发送朋友图片信息
function sedimginfo()
		mSleep(800);
		click(283,167);--选中第一个图片
		mSleep(800);
		click(542,1092);--点完成
		mSleep(2000);
		click(281,182);--点输入框
		mSleep(800);
		local str=getparamecom(gsinfo,'mustt_newmm');
		inputText(str);--..math.random(1,10000000)
		mSleep(2500);
		click(595,85);--点发送
		mSleep(2500);
		--click(191,655);


		while true do
			x,y=findColorInRegionFuzzy(0x00c0ff,sim,43,1050,79,1092); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
			if x ~= -1 and y ~= -1 then          -- 如果找到了
				click(64,1068)
				break;
			else
				click(59,86);
				mSleep(2000);
				click(457,627);
				mSleep(1000);
				break;
			end
		end
end

--打开陌陌
function openmm()
	appKill("com.wemomo.momoappdemo1");
    mSleep(1100);
	appRun("com.wemomo.momoappdemo1");
end
