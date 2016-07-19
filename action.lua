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
	msleeprand(2000);
	
	textmsg=textlocal(94,166,559,245);
	if string.match(textmsg,'VPN')=='VPN' then	

		msleeprand(1000);
		inputtextstr(vpnuser);
		msleeprand(1000);
		click(588,1064);
		msleeprand(2000);
		inputtextstr(vpnpwd);
		msleeprand(2000);
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
	flstrclick=textlocal(101,292,418,359);
	if string.match(flstrclick,'飞')=='飞' then
	 	click(530,329);	
	 	msleeprand(2000);
	 	click(530,329);
	else
	 	click(530,235);
	 	msleeprand(2000);
	 	click(530,235);
	end
	msleeprand(2000);
	--[[
	existscolor=seachcolorreturn('x04cd964',458,188,637,373);	
	notifyMessage(existscolor,5000);
	if existscolor==0 then		
		return 1;
	end
	flymodel();
	--]]
end


--一键新机 hd
function reloaddata()
	msleeprand(1000);	
	appRun('com.workhard.hdfakerset');
	msleeprand(1000);
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
	msleeprand(3000);
	inputtextstr(mobile..'-'..pwd);--更改名字
	msleeprand(4000);
	msleeprand(2000); 
	click(326,304);--开始备份
	msleeprand(3000);
	click(323,657);--点完成
end

--注册入口
function registerweixi(cd)
	weixiinfo['cd']=cd;
	openweixi();--打开微信
	msleeprand(3000);	
	openweiximsg()--打开微信后弹框
	msleeprand(2000);
	seachcolor(0x06bf04,6,394,637,1037);--点注册
	msleeprand(1000);
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
	msleeprand(2000);
	--click(305,426);	
	clickarea(220,388,525,457);
	msleeprand(1000);
	inputtextnumberror();
	--得到手机号码

	mboile=getmobile();
	--输入手机号码
	inputtextverify(mboile,209,385,623,455,11);
	weixiinfo['pn']=mobile;
	 ::redo::
	--点注册按钮
	msleeprand(2000);
	seachcolor(0x06bf04,6,394,637,1037);
	msleeprand(2000);
	--确认发送短信
	sendmobile();
	msleeprand(2000);

	textmsg=textlocal(58,134,601,238);
	if string.match(textmsg,'马')~='马' then		
		goto redo;
	end

	--输入验证码	
	verifyinfo=getverify(mboile);	
	msleeprand(2000);
	inputtextnumberrorn(6);--输入错误
	msleeprand(500);
	inputtextstr(verifyinfo);
	msleeprand(2000);
	clickarea(35,497,602,568);
	--seachcolor(0x06bd04,6,394,637,1037);--点提交	
	textmsg=textlocal(37,761,599,831)
	if string.match(textmsg,'不')=='不' then
		clickarea(37,761,599,831);
	end

	ysmsleeprandadd('完善个人',23,134,628,289)--延时

	--clickarea(245,346,394,497);
	--runcodenmb=getparame(gsinfo,'photo');--得到对应的值
	--selectphoto(tonumber(runcodenmb));--选择图片
	str=getweixiname();	
	weixiinfo['wn']=str;
	reigistinputwxname(str)--输入昵称
	
	
	msleeprand(2000);
	reigistselect()--选择不添加通讯里的朋友
    
	msleeprand(2000);
	
	strpwd='168168';	
	weixiinfo['pwd']=strpwd;
	saveweixiweb(weixiinfo);
	
	gerxi=mobile..'---'..strpwd..'---'..str;
	writeonestr("/var/touchelf/scripts/scriptfile/pwd.txt",gerxi);
	msleeprand(3000);
	filepaw(strpwd);
	backuphd(mobile,strpwd);
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
		notifyMessage('保存成功',5000);
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
	msleeprand(1000);
	msleeprand(500);
	inputtexterror();
	inputtextstr(str);--输入昵称	
end
--设备密码
function filepaw(pwdstr)
		msleeprand(3000);
        clickarea(500,1046,624,1124);--点击我
        msleeprand(2000);
        clickarea(4,808,632,880);--点击设置
        msleeprand(2000);
        clickarea(6,160,629,235);--点击帐号与安全
        msleeprand(2000);
        clickarea(4,678,634,756);--点击微信密码
        msleeprand(3000);
        

        clickarea(224,407,620,472);--点击密码
        msleeprand(3000);
        inputtextstr(pwdstr);
        msleeprand(2000);
        clickarea(224,450,515,565);--点击确认密码
        msleeprand(1000);
        inputtextstr(pwdstr);
        msleeprand(2000);
        clickarea(558,68,622,98);--点击完成
        msleeprand(2000);
end    


 
--启动登入微信
function loginweixi()
	openweixi();--打开微信
	msleeprand(2000);	
	openweiximsg();--打开微信后弹框

	msleeprand(2000);

	codedh=textlocal(60,406,580,640);--封号提示框
	if(string.match(codedh,'圭甘号')=='圭甘号') then			
		clickarea(60,662,312,734);--点击取消
	end

	codecw=textlocal(60,478,572,572);--密码错误
	if(string.match(codecw,'密石马')=='密石马') then			
		clickarea(56,600,576,668);--点击确定
	end

	msleeprand(1000);
	codestr=textlocal(16,487,106,538);--封号后保存异常页面
	if(string.match(codestr,'密石马')=='密石马') then	
		msleeprand(1000);
		code=textlocalnmb(248,370,470,410);
		if code==nil or code=='' then
			return;
		end
		mobile=string.gsub(code,' ','');	
		rsul=setmobilestatus(mobile);
		msleeprand(1000);
		if rsul~='0' and rsul~=nil then
			notifyMessage('异常号码已保存',2000);
		end
		return 0;
	end
	return 1;
end


--启动dhfakei恢复
function dhfakei()    
	appRun('com.workhard.hdfakerset');
    rotateScreen(0);
    msleeprand(3);
    touchDown(6, 524, 636)
    msleeprand(14);
    touchUp(6)

    msleeprand(2364);
    touchDown(4, 96, 1108)
    msleeprand(98);
    touchUp(4)

    msleeprand(1000);
    touchDown(3, 276, 776)
    msleeprand(64);
    touchUp(3)

    msleeprand(2000);
    touchDown(1, 622, 52)
    msleeprand(65);
    touchUp(1)

    msleeprand(2000);
    touchDown(2, 276, 524)
    msleeprand(82);
    touchUp(2)

    msleeprand(3000);
    touchDown(9, 282, 632)
    msleeprand(82);
    touchUp(9)
	
	msleeprand(3000);
    keyDown('HOME');
    msleeprand(176);
    keyUp('HOME');

    msleeprand(1000);
end


    --点赞和评论
    function filelike()
        msleeprand(2000);
        clickrand(248,1028); --点击微信
        msleeprand(2000);
        clickrand(426,666); --点击好（使用推送通知）
        msleeprand(2000);
        clickrand(400,1076);--点击发现
        msleeprand(2000);
        clickrand(290,200);--点击朋友圈
        msleeprand(2000); --点击移动
        clickmove();

        msleeprand(2000);
            x, y = findImage("/mnt/sdcard/dz66.bmp"); -- 在全屏范围找到第一个路径为"/mnt/sdcar/a.bmp"的图片, 将其左上角坐标保存到变量x和y中
            if x ~= -1 and y ~= -1 then            -- 如果找到了
                touchDown(0, x, y);                -- 点击那个点
                touchUp(0);
            end  

        -- msleeprand(3000);--点赞
        --    x, y = findImageFuzzy("/mnt/sdcard/XX.bmp",0x4c5154); 
        --     if x ~= -1 and y ~= -1 then            
        --         touchDown(0, x+98, y+40);          -- 点击那个点
        --         touchUp(0);
        --         -- notifyMessage("msleeprand",3000);
        --     end  

        msleeprand(2000);--评论
            x, y = findImageFuzzy("/mnt/sdcard/PP.bmp",0x4c5154); 
            if x ~= -1 and y ~= -1 then            -- 如果找到了
                touchDown(0, x, y);                -- 点击那个点
                touchUp(0);
                msleeprand(2000);
                -- os.execute("input text \"asdasd\"");

                a = {"666", 
                    "哇", 
                    "好像很厉害的样子",
                    "长知识了",
                    "32个赞",
                    "我差点信了",
                    "开鲁咯！",
                    "哈哈哈",
                }
                a_num=math.random(1,#a);
                inputText(a[a_num]);

                

                msleeprand(2000);
                clickarea(170,1059,464,1120); --点击键盘空格键
                msleeprand(2000);
                clickarea(490,1060,626,1120); --点击发送   
            end


        msleeprand(2000);
        btnlefttop();
    end
--检查手机号码是否则存在
function datectionmobile()
	msleeprand(3000);
	clickarea(190,1050,306,1128);
    msleeprand(3000);
    clickrand(311,196);
    msleeprand(3000);

    tt=datefriendinfo();    
end
--运行手机号码是否则存在
function datefriendinfo()
    friendsex = '关闭';
   	msleeprand(1000);
    clickrand(296,79);
    str="\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b";
    mobile=friendmobiletype();
    if mobile=='0' or mobile==nil then
        notifyMessage('没有手机号码',1000); 
        return datefriendinfo();
    end 
   
    mobile=string.sub(mobile,1,11);
    inputText(str..mobile);

    msleeprand(1000);
    clickarea(29,211,608,311);--搜索
    msleeprand(1000);
    
    myjg=textlocal(136,397,472,467);
    if string.match(myjg,'无结果')=='无结果' then     
        msleeprand(1000);
        friendmobiletypeset(mobile,1);
        
        return datefriendinfo();
    end

    msgfr=textlocal(89,470,557,683); 
    if string.match(msgfr,'不存在')=='不存在' then
      	friendmobiletypeset(mobile,1);
        clickrand(320,653);
        msleeprand(1000);
        return datefriendinfo();
    end

    if string.match(msgfr,'失败')=='失败' then     
    	if string.match(msgfr,'过于')=='过于' then
            clickrand(320,653);            
		    btnlefttop();--返回		
            return 5;
        end   
        clickrand(320,653);
        msleeprand(1000);
        friendmobiletypeset(mobile,1);
        return datefriendinfo();
    end

    findtext=textlocal(121,388,515,475);
    if string.match(findtext,'田')=='田' then
        notifyMessage('没有找着');
        datefriendinfo();
    end 
    friendmobiletypeset(mobile,2);
    btnlefttop();--返回
    return datefriendinfo();
end