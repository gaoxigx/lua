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
	vpn(gsinfo);
end


--飞行模式
function flymodel()
	msleeprand(1000);
	appRun('com.apple.Preferences');
	msleeprand(2000);
	flyunit();
	-- ip=flyunit();
	-- notifyMessage(ip,1200);
end

--检测IP 是否重复
function flyunit()
	flstrclick=textlocal(101,292,418,359);
	if string.match(flstrclick,'飞')=='飞' then
	 	click(530,329);	
	 	msleeprand(500);
	 	click(530,329);
	else
	 	click(530,235);
	 	msleeprand(500);
	 	click(530,235);
	end
	notifyMessage('正在连接网络...',12500);	
	ggipt=getrecoip();--获取IP

	if ggipt==nil or ggipt=='' then
        notifyMessage('未检测到网络');	
		return flyunit();        	
	end	

    if ggipt==0 then
        notifyMessage('这个IP地址已经用过');
        return flyunit();
    end  
	msleeprand(1600);
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
--一键备份 hd
function backuphd(mobile,pwd)
	msleeprand(1000);	
	appRun('com.workhard.hdfakerset');
	msleeprand(1000);	
	click(139,1064);--操作
	msleeprand(1000);
	click(293,675);--备份数据
	msleeprand(1000);
	click(557,82);--开始备份
	msleeprand(2000);	
	click(313,302);--开始备份
	msleeprand(6000);
	click(323,657);--点完成
	msleeprand(6000);
end

--注册入口
function registerweixi(cd)
	weixiinfo['cd']=cd;
	openweixi();--打开微信
	ysmsleepaddnmb('推送',59,439,581,617,3);	
	--clickarea(131,636,517,702)--点击好
	openweiximsg();
	msleeprand(200);
	seachcolor(0x06bf04,6,394,637,1037);--点注册


	--msleeprand(2000);
	--[[
	--是否进入微信号
	textmsg=textlocal(20,121,622,275);
	if string.match(textmsg,'手木凡号')~='手木凡号' then		
		msleeprand(5000);	
	    clickrand(320,1074);--点更多
		msleeprand(500);	
		clickrand(320,885);--点注册
		msleeprand(500);
	end
    --]]

    ysmsleepadd('手木',43,118,599,245)--延时

	msleeprand(500);
	click(436,420);
	msleeprand(1000);
	--inputtextnumberror();
	--得到手机号码

	mboile=getmobile();
	--输入手机号码
	inputtextstr(mboile,209,385,623,455,11);
	weixiinfo['pn']=mobile;
	--点注册按钮
	msleeprand(1000);
	clickarea(47,526,568,608);

	--确认发送手机短信
	msleeprand(500);
	ysmsleepadd('发送',60,442,576,600)--延时
 	clickarea(325,626,580,700);
	msleeprand(3000);
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
		clickarea(37,761,599,831);
	end

	msleeprand(1000);
	textstryj=textlocal(25,421,622,557);	
	if string.match(textstryj,'已')=='已' then
		return 0;
	end

	ysmsleepadd('完善个人',23,134,628,289)--延时

	--clickarea(245,346,394,497);
	--runcodenmb=getparame(gsinfo,'photo');--得到对应的值
	--selectphoto(tonumber(runcodenmb));--选择图片
	str=getweixiname();	
	weixiinfo['wn']=str;
	reigistinputwxname(str)--输入昵称
	
	
	msleeprand(2000);
	reigistselect()--选择不添加通讯里的朋友
    
	msleeprand(2000);
	
	strpwd='asd168168';	
	weixiinfo['pwd']=strpwd;
	saveweixiweb(weixiinfo);
	
	gerxi=mobile..'---'..strpwd..'---'..weixiinfo['wn'];
	writeonestr("/var/touchelf/scripts/scriptfile/pwd.txt",gerxi);
	msleeprand(1000);
	filepaw(strpwd);--创建密码
	filewxhao();--设置微信号
	backuphd(mobile,strpwd);--开始备份
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
	msleeprand(2000);
	clickarea(58,669,293,732);--查找你的微信朋友
	msleeprand(1000);
	clickarea(244,1056,386,1100);--查找你的微信朋友
	msleeprand(1000);
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
        btnlefttop();
        msleeprand(500);
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
	ysmsleepaddnmb('推送',59,439,581,617,4);	
	openweiximsg();
	-- ysmsleepaddnmb('信',191,52,440,113,3);
	codexin=textlocal(191,52,450,113);
	if(string.match(codexin,'信')=='信') or (string.match(codexin,'盲')=='盲') then			
		return 1;
	end
	
	msleeprand(2000);
	codedh=textlocal(60,406,580,640);--封号提示框
	if(string.match(codedh,'圭寸')=='圭寸') or (string.match(codedh,'封')=='封') or (string.match(codedh,'角军')=='角军')then			
		clickarea(60,662,312,734);--点击取消
	end

	codecx=textlocal(64,482,572,572);--登录错误
	if(string.match(codecx,'重亲斤')=='重亲斤') then			
		clickarea(64,597,575,662);--点击取消
	end

	codecw=textlocal(60,478,572,572);--密码错误
	if(string.match(codecw,'密石马')=='密石马') then			
		clickarea(56,600,576,668);--点击确定
	end

	msleeprand(1000);
	codestr=textlocal(7,487,119,541);--封号后保存异常页面
	if(string.match(codestr,'密石马')=='密石马') or (string.match(codestr,'石马')=='石马') then	
		msleeprand(1000);
		code=textlocalnmb(244,360,475,410);
		if code==nil or code=='' then
			return;
		end
		mobile=string.gsub(code,' ','');	
		rsul=setmobilestatus(mobile);
		msleeprand(1000);
		if rsul~='0' and rsul~=nil then
			notifyMessage('异常号码已保存',1000);
		end
		return 0;
	end
	msleeprand(2000);
	dhfakeiname();
	return 1;

end


--启动dhfakei恢复
function dhfakei()    
	appRun('com.workhard.hdfakerset');
	mSleep(1000);
	click(106,1076);
	mSleep(800);
	click(230,774);
	mSleep(1200);
	click(572,80);
	mSleep(1500);
	click(323,538);
	mSleep(8000);
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

        --键盘输入汉字
        msleeprand(1000);
        click(257,875);
        msleeprand(800);
        click(41,663);

        msleeprand(1000);--确认重命名
        click(455,460);
        msleeprand(800);--下一条
        click(570,80);
        msleeprand(1400);--完整恢复
        click(322,540);
        mSleep(8000);   

    end

--检查手机号码是否则存在
function datectionmobile()
	msleeprand(500);
	clickarea(190,1050,306,1128);
    msleeprand(500);
    clickrand(311,196);
    msleeprand(500);

    tt=datefriendinfo();    
end
--运行手机号码是否则存在
function datefriendinfo()

	ysmsleepadd('肖',544,56,632,106);
   	msleeprand(200);
    clickrand(296,79);
    str="\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b";
    mobile=friendmobiletype();
    if mobile=='0' or mobile==nil then
        notifyMessage('没有手机号码'); 
        return datefriendinfo();
    end    
 

    mobile=string.sub(mobile,1,11);
    inputText(str..mobile);

    msleeprand(500);
    clickarea(29,211,608,311);--搜索
    msleeprand(500);
    
--[[   myjg=textlocal(136,397,472,467);
    if string.match(myjg,'无结果')=='无结果' then     
        msleeprand(1000);
        friendmobiletypeset(mobile,1);        
        return datefriendinfo();
    end
--]] 

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
        return datefriendinfo();
    end
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
    return datefriendinfo();
end