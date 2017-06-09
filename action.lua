--切换vpn
function vpn(gsinfo)	

	vpnuser=getparame(gsinfo,'vpnuser');--得到对应的值
	vpnpwd=getparame(gsinfo,'vpnpwd');
	msleeprand(1000);
	appRun('com.apple.Preferences');
	msleeprand(1000);
	textmsg=textlocal(113,749,356,819);
	if string.match(textmsg,'VPN')=='VPN' then
		click(547,783);
	else
		click(529,683);
	end	
	msleeprand(800);
	
	textmsg=textlocal(94,166,559,245);
	if string.match(textmsg,'VPN')=='VPN' then	

		inputtextstr(vpnuser);
		msleeprand(600);
		click(588,1064);
		msleeprand(800);
		inputtextstr(vpnpwd);
		msleeprand(500);
		click(474, 466);
		msleeprand(4000);		
		return 1;
	end

	openURL("prefs:root=AIRPLANE_MODE");

	vpn(gsinfo);
end


--飞行模式
function flymodel()
	
	msleeprand(1000);	
	--openURL("prefs:root=AIRPLANE_MODE");
	appRun('com.apple.Preferences');
	msleeprand(1000);
	touchDown(0, 272, 238); -- ID为0的手指在坐标为(100, 100)的点按下
	mSleep(500);            --延时100毫秒
	touchMove(0, 304, 547); -- ID为0的手指滑动到坐标为(200, 100)的点
	mSleep(500);            --延时100毫秒
	touchUp(0);        	
	flyunit();

	-- ip=flyunit();
	-- notifyMessage(ip,1200);
	--[[
	msleeprand(1000);
	openURL("prefs:root=AIRPLANE_MODE");
	msleeprand(1000);
	--]]
end

--检测IP 是否重复
function flyunit()
		mSleep(800);
	  flstrclick=textlocal(101,292,418,359);
	  if string.match(flstrclick,'飞')=='飞' then
	    click(530,329); 
	    mSleep(1000);
	    click(530,329);
	    mSleep(2000);
	    click(530,329);
	    mSleep(1000);
	    click(530,329);
	  else
	    click(530,235);
	    mSleep(1000);
	    click(530,235);
	  end

	  mSleep(800);
	  for sim = 100, 80, -1 do  
	      x, y = findColorInRegionFuzzy(0x4bd863, sim, 462, 144, 610, 359); 
	      if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件          
	          if string.match(flstrclick,'飞')=='飞' then
	            click(530,329);
	            mSleep(1000);
	            click(530,329);
	          else
	            click(530,235);
	          end         
	          break;   --并跳出循环
	      end
	  end  
	  mSleep(2000);
	  notifyMessage('正在连接网络...',5000); 
	--[[	
	ggipt=getrecoip();--获取IP

	if ggipt==nil or ggipt=='' then
        notifyMessage('未检测到网络');	
		return flyunit();        	
	end	

    if ggipt==0 then
        notifyMessage('这个IP地址已经用过');
        return flyunit();
    end  
    --]]
	
end


-- --飞行模式
-- function flymodel()
-- 	msleeprand(1000);
-- 	appRun('com.apple.Preferences');
-- 	msleeprand(2000);
-- 	flstrclick=textlocal(101,292,418,359);
-- 	if string.match(flstrclick,'飞')=='飞' then
-- 	 	click(530,329);	
-- 	 	msleeprand(2000);
-- 	 	click(530,329);
-- 	else
-- 	 	click(530,235);
-- 	 	msleeprand(2000);
-- 	 	click(530,235);
-- 	end
-- 	msleeprand(2000);
-- 	--[[
-- 	existscolor=seachcolorreturn('x04cd964',458,188,637,373);	
-- 	notifyMessage(existscolor,5000);
-- 	if existscolor==0 then		
-- 		return 1;
-- 	end
-- 	flymodel();
-- 	--]]
-- end


--一键新机 hd
function reloaddata()
	msleeprand(1000);	
	appRun('com.workhard.hdfakerset');
	msleeprand(1000);	
	click(139,1064);--操作
	msleeprand(500);
	click(152,257);
	msleeprand(6000);
end


--备份注册 hd
function backuphdbfzc()
	msleeprand(1000);	
	appRun('com.workhard.hdfakerset');
	msleeprand(2400);	
	click(139,1064);--操作
	msleeprand(1000);
	click(293,675);--备份数据
	msleeprand(1000);
	click(557,82);--开始备份
	msleeprand(1800);
	--[[
    --键盘输入注册
	msleeprand(1800);
	click(128,980);--输入Z键

	msleeprand(600);
	click(385,873);--输入H键

	msleeprand(600);
	click(416,764);--输入U键

	msleeprand(600);
	click(256,980);--输入C键

	msleeprand(600);
	click(158,765);--输入E键

	msleeprand(800);
	click(50,668);--点击第一个字
	--]]
	msleeprand(1000);	
	click(320,313);--开始备份

	msleeprand(10000);
	click(323,654);--点完成
end

--备份数据 hd
function backuphd(mobile,pwd)
	msleeprand(1000);	
	appRun('com.workhard.hdfakerset');
	msleeprand(2400);	
	click(139,1064);--操作
	msleeprand(1000);
	click(293,675);--备份数据
	msleeprand(1000);
	click(557,82);--开始备份	
	msleeprand(1000);	
	click(320,400);--开始备份
	msleeprand(9000);
	click(323,654);--点完成
end

--好推送消息
function startbox()
    local tj = 1;
    while true do
        for sim = 100, 92, -1 do  
            x, y = findColorInRegionFuzzy(0x007aff, sim, 304, 654, 345, 700); 
            if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件
            	
                mSleep(200);
                click(318,668);--好
                mSleep(200);
                --notifyMessage('检测脚本文件');
                return 1;
                --break;   --并跳出循环
            end
        end

        if(listcolorinfo(0xf4f5f7,97,158, 1066, 177, 1076)==true and listcolorinfo(0xf4f5f7,95,218, 1072, 330, 1090)==true ) then
			mSleep(1500);
			if(listcolorinfo(0xf4f5f7,97,158, 1066, 177, 1076)==true and listcolorinfo(0xf4f5f7,95,218, 1072, 330, 1090)==true ) then
				
				return 1;
			end
		end

        msgfr=textlocal(89,470,557,683);  
	    if string.match(msgfr,'可申')=='可申' then
	        click(185,683);
	        msleep(1000);
	        return 2;
	    end

        tj=tj+1;
        mSleep(400);
    end
end

--注册入口
function registerweixi(cd)
	reloaddata();
	weixiinfo['cd']=cd;
	openweixi();--打开微信
	while true do
		click(316,673);
		mSleep(500);
		click(473,1020);
		mSleep(500);
		if seachcolorreturn(0xffffff,340,931,345,935)==1 then
			break;
		end
	end

	msleeprand(500);
	click(436,420);
	msleeprand(500);
	mboile=getmobile();

	--输入手机号码
	inputtextstr(mboile,209,385,623,455,11);
	weixiinfo['pn']=mobile;
	--点注册按钮
	msleeprand(500);
	clickarea(47,526,568,608);
	
	--确认发送手机短信	
	while true do
		if findseachcolor(0x007aff,340,931,345,935,80)==true then
			mSleep(500);
			click(453,671);
			break;
		end
		mSleep(500);
	end

	--[[
	msleeprand(500);
	ysmsleepadd('发送',60,442,576,600)--延时
 	clickarea(325,626,580,700);
	msleeprand(3000);
	--]]
	--ysmsleepadd('正石马',23,120,628,266)--延时
	--输入验证码	
	verifyinfo=getverify(mboile);	

	--inputtextnumberrorn(6);--输入错误
	msleeprand(2000);
	inputtextstr(verifyinfo);
	msleeprand(1000);
	clickarea(35,497,602,568);
	--seachcolor(0x06bd04,6,394,637,1037);--点提交	
	textmsg=textlocal(37,761,599,831)
	if string.match(textmsg,'不')=='不' then
		click(300,800);
	end

	msleeprand(1000);
	--textstryj=textlocal(25,421,622,557);	
	--if string.match(textstryj,'已')=='已' then
		click(317,831);
	--end
	mSleep(2000);
	--ysmsleepadd('人',23,134,628,289)--延时
	--clickarea(245,346,394,497);
	--click(271,629);
	--mSleep(500);
	--runcodenmb=getparame(gsinfo,'photo');--得到对应的值
	--selectphoto(tonumber(runcodenmb));--选择图片
	str=getweixiname();	
	weixiinfo['wn']=str;
	reigistinputwxname(str)--输入昵称
	mSleep(500);
	click(314,597);
	mSleep(500);
    click(325,740);
	--msleeprand(2000);
	--reigistselect()--选择不添加通讯里的朋友
	--msleeprand(2000);
	--strpwd='fadacai888';	
	--weixiinfo['pwd']=strpwd;
	--saveweixiweb(weixiinfo);	
	--gerxi=mobile..'---'..strpwd..'---'..weixiinfo['wn'];
	--writeonestr("/var/touchelf/scripts/scriptfile/pwd.txt",gerxi);
   
    mSleep(1000);
    while true do
		textstryjm=textlocal(70,434,577,612);	
		if string.match(textstryjm,'已')=='已' then	
			mSleep(50);
			click(317,680);
			mSleep(800);
			click(77,83);	
			return 0;		
		end	

		textstryjt=textlocal(70,479,553,565);	
		if string.match(textstryjt,'回')=='回' then	
			mSleep(50);
			click(433,650);
			return 0;		
		end	

		if seachcolorreturn(0x157efb,387,765,527,833)==1 then
			mSleep(50);
			click(458,715);
			break;
		end
		mSleep(100);
	end
	--msleeprand(3000);
	--filepaw(strpwd);--创建密码
	--backuphdbfzc();--开始备份
	msleeprand(1000);	

	--]]
end

--保存微信号到网站
function saveweixiweb(weixiinfo)
	str='http://g.7gu.cn/index.php?g=api&m=mobile&a=saveweixi&cdkey='..weixiinfo['cd'];
	if weixiinfo['pn']~=nil then
		str=str..'&pn='..weixiinfo['pn'];
	end
	if weixiinfo['wx']~=nil then
		str=str..'&wx='..weixiinfo['wx'];
	end
	if weixiinfo['pwd']~=nil then
		str=str..'&pwd='..weixiinfo['pwd'];
	end
	if weixiinfo['email']~=nil then
		str=str..'&email='..weixiinfo['email'];
	end
	if weixiinfo['emailpwd']~=nil then
		str=str..'&emailpwd='..weixiinfo['emailpwd'];
	end
	if weixiinfo['wn']~=nil then
		str=str..'&wn='..weixiinfo['wn'];
	end	
	sult=httpGet(str);
	if(sult=='1') then
		notifyMessage('已上传数据',1000);
	end
end


function reigistselect()
	msleeprand(800);
	ysmsleepaddnmb('友',146,410,515,478,2);	
	local msgcolj=textlocal(146,410,515,478);		
	if(string.match(msgcolj,'朋友')=='朋友') or (string.match(msgcolj,'友')=='友') then			
		clickarea(73,678,293,723);--了解更多
	end

	msleeprand(800);
	ysmsleepaddnmb('友',190,142,445,227,2);	
	local msgcopy=textlocal(190,142,445,227);		
	if(string.match(msgcopy,'月友')=='月友') or (string.match(msgcopy,'月')=='月') then			
		clickarea(260,1060,383,1094);--以后再说
	end
end

--注册时输入昵称
function reigistinputwxname(str)
	clickarea(125,568,586,639);
	msleeprand(500);
	--inputtexterror();
	inputtextstr(str);--输入昵称	
end
--设备密码
function filepaw(pwdstr)
		msleeprand(1000);
        clickarea(500,1046,624,1124);--点击我
		-- ysmsleepaddnmb('信',191,52,440,113,3);
		codexin=textlocal(191,52,450,113);
		if(string.match(codexin,'我')~='我') then			
			filepaw(pwdstr);
			return;
		end

        msleeprand(400);
        clickarea(4,808,632,880);--点击设置
        msleeprand(400);
        clickarea(6,160,629,235);--点击帐号与安全
        msleeprand(400);
        clickarea(4,678,634,756);--点击微信密码
        msleeprand(1000);
		ysmsleepaddnmb('密石马',180,50,470,110,3);

        clickarea(215,425,440,458);--点击密码
        msleeprand(800);
        inputtextstr(pwdstr);
        msleeprand(2500);

        clickarea(215,512,440,545);--点击确认密码
        msleeprand(800);
        inputtextstr(pwdstr);
        msleeprand(2500);
        clickarea(558,68,622,98);--点击完成

	    msleeprand(1000);
		ysmsleepaddnmb('安',256,58,397,113,2)--判断是否在帐号与安全页面
	    clickarea(6,160,634,236);--微信号
	    msleeprand(1000);
	    --[[
	    --weixiinput();--输入微信号

	    msleeprand(3000);
	    btnlefttop();
	    msleeprand(1000);
	    btnlefttop();
	    msleeprand(1000);
	    --]]
	    btnlefttop();
	    msleeprand(500);
	    btnlefttop();

end    



--设置微信号
function filewxhao()
	msleeprand(1000);
    clickarea(500,1046,624,1124);--点击我
	-- ysmsleepaddnmb('信',191,52,440,113,3);
	codexin=textlocal(191,52,450,113);
	if(string.match(codexin,'我')~='我') then			
		filewxhao();
		return;
	end
    msleeprand(1000);
    clickarea(4,808,632,880);--点击设置
    msleeprand(1000);
    clickarea(6,160,629,235);--点击帐号与安全
    msleeprand(1000);
    clickarea(6,160,634,236);--微信号
    msleeprand(1000);

    weixiinput();--输入微信号

    msleeprand(3000);
    btnlefttop();

    msleeprand(1000);
    btnlefttop();
    msleeprand(1000);
    btnlefttop();
end

function weixiinput()
	local mz=randomStrnumzm(1);	
	local s =mz..randomStrnum(7) --生成8位随机字母
    inputtextstr(s);
    
    msleeprand(2000);--保存
    btnrighttop();

    msleeprand(4000);
	clickarea(326,639,580,700);--点击确定

	msleeprand(2000);
	codeycz=textlocal(60,452,572,600);--帐号已存在提示框
	if(string.match(codeycz,'失败')=='失败') then			
		clickarea(59,620,577,687);--点击确定
		weixiinput();
	end

	
end

--启动登入微信
function loginweixi()
	openweixi();--打开微信
	ysmsleepaddnmb('推送',59,439,581,617,2);	
	openweiximsg();
	--[[
	while true do
		seachcolor(0x007aff,222,631,526,707);--点好
		seachcolor(0x1aad19,222,631,526,707);--点好
	end
	--]]
	-- ysmsleepaddnmb('信',191,52,440,113,3);
	codexin=textlocal(191,52,450,113);
	if(string.match(codexin,'信')=='信') or (string.match(codexin,'盲')=='盲') then			
		return 1;
	end
	
	msleeprand(2000);
	codedh=textlocal(60,406,580,640);--封号提示框
	if(string.match(codedh,'圭寸')=='圭寸') or (string.match(codedh,'封')=='封') or (string.match(codedh,'角军')=='角军') then			
		clickarea(60,662,312,734);--点击取消
		return baopass();
	end

	--微信账号因登录环境异常，已被限制登录
    msgtbt=textlocal(89,470,557,683);  
    if string.match(msgtbt,'可申')=='可申' then
        click(185,683);
        return baopass();
    end

	codecx=textlocal(64,482,572,572);--登录错误
	if(string.match(codecx,'重')=='重') or (string.match(codecx,'登录')=='登录') then			
		clickarea(64,597,575,662);--点击取消
		return baopass();
	end

	codesr=textlocal(61,397,574,662);--骚扰用户封号提示框
	if(string.match(codesr,'户木勾')=='户木勾') or (string.match(codesr,'角军')=='角军') then			
		clickarea(65,696,304,756);--点击取消
		return baopass();
	end

	codecw=textlocal(60,478,572,572);--密码错误
	if(string.match(codecw,'密石马')=='密石马') then			
		clickarea(56,600,576,668);--点击确定
		return baopass();
	end

	codebcd=textlocal(68,380,577,681);--被顶号
	if(string.match(codebcd,'不是')=='不是') or (string.match(codebcd,'石马')=='石马') then			
		clickarea(272,716,380,761);--点击确定
		return 1;--dhfakeiname();
	end

	codebctx=textlocal(85,395,565,681);--被顶号
	if string.match(codebctx,'已')=='已' then
		seachcolor(0x007aff,150,693,562,836);			
		click(331,743);--点击确定
		return 1;
	end

end


--弹框后的输入密码页面，保存异常号码重启dhfakei
function baopass()

	runError(3,3); 	
	msleeprand(1000);
	ysmsleepaddnmb('密石马',16,487,106,538,3);	
	codestr=textlocal(16,487,106,538);--封号后保存异常页面
	if(string.match(codestr,'密石马')=='密石马') then	
		msleeprand(1000);
		--[[
		code=textlocalnmb(248,370,470,410);
		if code==nil or code=='' then
			return 1;
		end
		
		mobile=string.gsub(code,' ','');	
		rsul=setmobilestatus(mobile);
		msleeprand(1000);
		if rsul~='0' and rsul~=nil then
			notifyMessage('异常号码已保存',2000);
		end
		--]]
		--dhfakeiname();

		return loginweixi();
	end
	
end
--Nzt恢复
function nzthuifu()
  mSleep(1000);
  appKill("NZT");
  mSleep(1000);
  appRun("NZT");
  mSleep(1000);
  click(38,79);--返回
  mSleep(800);
  click(131,962);--参数记录
  mSleep(1500);
  click(577,85);--下一条
  mSleep(3000);
  click(38,79);--返回
  mSleep(1000);
end


--启动dhfakei恢复
function dhfakei()   		
	  appRun('com.workhard.hdfakerset');
	  mSleep(1000);
	  click(106,1076);--操作
	  mSleep(400);
	  click(106,1076);--操作
	  mSleep(400);
	  click(227,773);--恢复数据
	  mSleep(1500);
	  click(572,82);--下一条
	  mSleep(2000);
	  click(316,535);
	  mSleep(5000);
	  local xnum=50;
	  while true do
	    local xtc = false;
	    for sim = 100, 90, -1 do           --使用 for 循环不断降低精确度(建议精确度不低于50%)
	        x, y = findColorInRegionFuzzy(0x2866bf, sim, 457, 628, 513, 683); 
	        if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件
	            xtc=true;
	            break;                    --并跳出循环
	        end
	    end
	    if xtc==true then
	      click(331,651);
	      break;
	    end
	    mSleep(800);
	    xnum=xnum+1;
	    if xnum>=50 then
	    	break;
	    end
	  end
end 

--启动dhfakei恢复下一条前重命名
function dhfakeiname()   
	appRun('com.workhard.hdfakerset');--启动配置hdFaker
    msleeprand(2000);--点击操作
    clickarea(73,1053,131,1125);

    msleeprand(800);--点击恢复数据
    click(300,770);

    msleeprand(1000);  --查找绿色点
    x, y = findColorInRegion(0x00b41f, 4, 130, 120, 1034); -- 在区域范围找到第一个颜色为0x00b41f的点, 精确度为90%
    if x ~= -1 and y ~= -1 then                                      -- 如果找到了
        touchDown(0, x, y);                                          -- 点击那个点
     msleeprand(1500); --按住1.5秒
        touchUp(0);
    end

    msleeprand(1000);
    x, y = findImageInRegionFuzzy("/var/touchelf/scripts/scriptfile/images/CMM.bmp", 80, 330, 131, 448, 1034, 0x29292a); 
    if x ~= -1 and y ~= -1 then                                                           -- 如果找到了
        touchDown(0, x, y);                                                               -- 点击那个点
        touchUp(0);
    end


    msleeprand(1000);
    ysmsleepaddnmb('亲斤',83,466,559,533,2);--请输入一个新的名字
	local msgcomm=textlocal(83,466,559,533);		
	if(string.match(msgcomm,'亲斤')=='亲斤') then			
    	click(457,575);--点击输入框
	end

	msleeprand(500);
    ysmsleepaddnmb('亲斤',97,209,559,283,1);--请输入一个新的名字
    -- click(487,320);--点击输入框

	msleeprand(500);
    click(257,875); --键盘输入F

	msleeprand(800);
	click(41,663);--输入第一个汉字

	msleeprand(800);--确认重命名
	click(455,440);

	msleeprand(1200);--下一条
	click(570,80);
	
	msleeprand(1400);--完整恢复
	click(322,540);
	mSleep(8000);	

end

--检查手机号码是否则存在
function datectionmobile()
	msleeprand(500);
	clickarea(190,1050,306,1128);--点击通讯录
    msleeprand(500);
    clickrand(311,169);-- 点击通讯录页面的搜索框
    msleeprand(500);

    tt=datefriendinfo();    
end
--运行手机号码是否则存在
function datefriendinfo()
	runError(1,2);
	ysmsleepadd('肖',544,56,632,106);--空白页面搜索框
   	msleeprand(200);
    clickrand(420,74);
    str="\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b";
    mobile=friendmobiletype();
    if mobile=='0' or mobile==nil then
        notifyMessage('没有手机号码'); 
        return datefriendinfo();
    end    
 

    mobile=string.sub(mobile,1,11);
    inputText(str..mobile);

    msleeprand(500);
    clickarea(29,223,600,316);--搜索手机/QQ
    msleeprand(1000);
    

    msgfr=textlocal(89,470,557,683); 
    if string.match(msgfr,'不存在')=='不存在' then
      	friendmobiletypeset(mobile,1);
        clickrand(320,653);
        msleeprand(200);
        return datefriendinfo();
    end

    if string.match(msgfr,'失败')=='失败' then     
    	if string.match(msgfr,'过于')=='过于' then
            clickrand(320,653);            
		    btnlefttop();--返回		
            return 5;
        end   
        clickrand(320,653);
        msleeprand(200);
        friendmobiletypeset(mobile,1);--保存
        msleeprand(500);
		btnlefttop();
        return datefriendinfo();
    end
	runError(2,2);
--[[
    findtext=textlocal(121,388,515,475);
    if string.match(findtext,'田')=='田' then
        notifyMessage('没有找着');        
        return datefriendinfo();
    end 
--]]
	--ysmsleepaddnmb('密石马',180,50,470,110,3);
	
    local ifv = seachcolorreturn(0xf37e7d,169,173,635,316); 
    if ifv==1 then           
            friendmobiletypeset(mobile,3); 
    else
    		friendmobiletypeset(mobile,2);
    end

	--ysmsleepadd('田',222,58,425,110);
	mSleep(100);
    btnlefttop();--返回
	runError(3,1);
    return datefriendinfo();
end
--定时关机
function haltinfo()
	local ytime=getparamecom(gsinfo,'mustt_halt');
    if ytime=="2" or ytime==2 then
    	local hour=os.date("%H");
    	local  minute = os.date("%M");
    	if(tonumber(hour)>=23 and tonumber(minute)>30) then
		 	os.execute("halt");
		 end
		 
	end
end