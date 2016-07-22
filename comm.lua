---------------
--打开微信弹出信息按钮 
function openweiximsg()	
	local msgcode=textlocal(85,630,560,700);		
	if(string.match(msgcode,"女子")=='女子') then			
		clickarea(56,633,583,701);
	end
end


--得到相应的命令
function getparamecom(sul,str)
	
	v=string.sub(sul,string.find(sul,'<'..str..'>')+string.len('<'..str..'>'),string.find(sul,'</'..str..'>')-1);
	return v;
end

--确认发送手机短信
function sendmobile()
 	textmsg=textlocal(73,436,574,611); 	
 	if string.match(textmsg,'发送验证码')=='发送验证码' then
 		clickrand(449,665);
 	end
end

--得到设备命令
function runparame()
	cdkeystr=cdkey();
	sul=httpGet("http://g.7gu.cn/index.php?g=api&m=equictive&a=saveDeviceID&cdkey="..cdkeystr.."&vn="..versioninfo());
	return sul;
end


--获取个性签名语录
function getsiing()
	sul=httpGet("http://g.7gu.cn/index.php?g=api&m=Wxwapi&a=sign");
	return sul;
end

--验证原密码
function getpwd(moblie)
	sul=httpGet("http://g.7gu.cn/index.php?g=api&m=Wxwapi&a=getpwd&pn"..mobile);
	return sul;
end


--获取朋友圈语录
function getcir()
	sult=httpGet("http://g.7gu.cn/index.php?g=api&m=Wxwapi&a=circle");
	return sult;
end
--获取email用户密码
function getemail()
	sult=httpGet("http://g.7gu.cn/index.php?g=api&m=Wxwapi&a=emailinfo");
	return sult
end
--
function setmobilestatus(phone)
	cd=getDeviceID();
	sul=httpGet("http://g.7gu.cn/index.php?g=Api&m=Wxwapi&a=mobilestatus&cdkey="..cd.."&pn="..phone);
	return sul;
end

--选择图片
function selectphoto(y)
	msleeprand(1500);
	clickarea(14,939,631,1023);--从手机相机选择
	msleeprand(1000);
	--选择第几个相薄		
	clickarea(10,137+(y-1)*170,625,299+(y-1)*170);
	msleeprand(1500);
	--随机选择一张图片
	st=(math.random(0, 10000)%4)*155-20;
	if st<150 then
		st=150;
	end
	dt=(math.random(0,10000)%6)*156-20;
	if dt<150 then
		dt=150;
	end
	click(st,dt)
	msleeprand(3000);
	clickrand(572,1065);
	--clickarea(527,1025,635,1117);
	msleeprand(3000);

end

--------------------end执行过程---------------------------------


------------------------start返回函数--------------------------------------
--得到序列号
function cdkey()
	deviceID = getDeviceID();
	return deviceID;
end
--得到设备版本
function versioninfo()
	version = getVersion();
	return version;
end
--得到一个昵称
function getweixiname()
	wxname=httpGet("http://g.7gu.cn/index.php?g=api&m=mobile&a=wxname");
	return wxname;
end



 -- 将设备ID保存到deviceID变量中
-------------------------授权一台设备-------------------------
--加入专属对接
function exclusive(joinarte)
   strexclusive=httpGet('http://mapi.aiputime.com/http.action?apiType=JoinBusi&apiId='..joinarte['abcuser']..'&apiSecret='..joinarte['abcpwd']..'&busiKey='..joinarte['joinbusi']);
   if strexclusive==nil or strexclusive=='' then
		exclusive(joinarte);
   end
   c=string.sub(strexclusive,string.find(strexclusive,':')+1,string.len(strexclusive)-1);
   if c=='1' then
   	  return 1;
   end	
   str='网络错误';
    if c=='-10' then str='账户不存在或密码错误' end
    if c=='-80' then str='传递的参数不正确' end
    if c=='-81' then str='不存在此对接' end
    if c=='-82' then 
    	str='用户已加入此对接';
    	return 1;
    end
    if c=='-83' then str='加入或创建的专属对接数量超过限制' end
   notifyMessage(str,5000);
   exclusive(joinarte);
end
--退出专属对接
function queryexclusive(join)

	--ndVGtxJnUO
	--WXZC250X00
	--WXZC123123
	--9Ew6maOrdc
	--wDaPJCXDUZ	
   strexclusive=httpGet('http://mapi.aiputime.com/http.action?apiType=QuitBusi&apiId='..join['abcuser']..'&apiSecret='..join['abcpwd']..'&busiKey='..join['joinbusi']);
   c=string.sub(strexclusive,string.find(strexclusive,':')+1,string.len(strexclusive)-1);	
   if c=='1' then
   	  return 1;
   end	
    str='网络错误';
    if c=='-10' then str='账户不存在或密码错误'; end
    if c=='-80' then str='传递的参数不正确'; end
    if c=='-81' then str='不存在此对接'; end
    if c=='-82' then str='用户已加入此对接'; end
    if c=='-83' then str='加入或创建的专属对接数量超过限制'; end
   notifyMessage(str,5000);
   queryexclusive(join);
end

--得到手机号码
function getmobile()
	hpone=runparame();
	if hpone==nil or hpone=='' then
		notifyMessage('网速太慢或已断网',2000);
		getmobile();
	end
	joinary={};	
	joinary['abcuser']=getparamecom(hpone,'abcuser')--平台用户名
	joinary['abcpwd']=getparamecom(hpone,'abcpwd')--平台密码
	joinary['joinbusi']=getparamecom(hpone,'joinbusi');--对接码;

	exclusive(joinary);
	--'{"c":1,"data":["15818618500"]}';	
	--mobile=httpGet("http://mapi.aiputime.com/http.action?apiType=GetPhone&apiId=gaoxi0&apiSecret=fadacai888&pId=1");
	strmobile=httpGet("http://mapi.aiputime.com/http.action?apiType=GetPhone&apiId="..joinary['abcuser'].."&apiSecret="..joinary['abcpwd'].."&pId=1");	
	--strmobile='{"c":1,"data":["15818618500"]}';
	if strmobile==nil then
		notifyMessage('网络状态不好重新获取',2000);
		getmobile();
	end	
	findval=string.find(strmobile,',');
	if findval==nil then
		c=string.sub(strmobile,string.find(strmobile,':')+1,string.len(strmobile)-1);		
	else
		c=string.sub(strmobile,string.find(strmobile,':')+1,findval-1);	
	end

	if c=='1' then
		mobile=string.sub(strmobile,string.find(strmobile,'data')+8,string.len(strmobile)-3);
		return mobile;
	end
	if c=='-1' then
		notifyMessage('余额不足',2000);
		msleeprand(3000);
	end
	if c=='-2' then
		notifyMessage('不存在可使用的手机号码',2000);
		msleeprand(1000);
	end
	if c=='-6' then
		notifyMessage('您正在使用的手机号超过限制的最大数',2000);
		msleeprand(3000);
	end
	if c=='-10' then
		notifyMessage('账户不存在或密码错误',2000);
		msleeprand(4000);
	end
	if c=='-30' then
		notifyMessage('您的绑定项目中不含此项目（若您的账号绑定了某些项目，您只能获取绑定项目的号码）',2000);
		msleeprand(4000);
	end
	if c=='-90' then
		notifyMessage('传递的参数不正确',2000);
		msleeprand(2000);
	end
	if c=='-91' then
		notifyMessage('您访问接口速度过快.',2000);
		msleeprand(1000);
	end
	if c=='-92' then
		notifyMessage('您不具有该权限',2000);
		msleeprand(1000);
	end
	if c=='-93' then
		notifyMessage('您的账户已被锁定',2000);
		msleeprand(5000);
	end
	if c=='-99' then
		notifyMessage('其他错误',2000);
		msleeprand(6000);
	end
	t=getmobile();
	return t;
	
end

--更改得到ip vpn
function getip()
	return '192.168.1.1';
end


--得到验证码
function getverify(mobile)
	--'{"c":1,"m":"您的验证码为888999","mc":"685000"}';
	--verify=httpGet("http://mapi.aiputime.com/http.action?apiType=GetCode&apiId=gaoxi0&apiSecret=fadacai888&pId=1&pn=13788889999&dev=zharty");
	strverify=httpGet("http://mapi.aiputime.com/http.action?apiType=GetCode&apiId=gaoxi&apiSecret=fadacai888&pId=1&pn="..mobile.."&dev=zharty");
	if 	strverify==nil or strverify=='' then
		return getverify(mobile);
	end
	--strverify='{"c":1,"m":"您的验证码为888999","mc":"977860"}';																			
	findval=string.find(strverify,',');
	if findval==nil then
		c=string.sub(strverify,string.find(strverify,':')+1,string.len(strverify)-1);		
	else
		c=string.sub(strverify,string.find(strverify,':')+1,findval-1);	
	end
	if c=='1' then
		verifyt=string.gsub(string.sub(strverify,string.find(strverify,'mc')+5,string.len(strverify)-2),' ','');	
		return verifyt;		
	end
	
	if c=='-2' then
		notifyMessage('号码存不在了',2000);
		msleeprand(1000);
	end

	if c=='0' then
		notifyMessage('平台未接收到验证码-请稍等',2000);
		msleeprand(1000);
	end
	if c=='-1' then
		notifyMessage('余额不足',6000);
		msleeprand(4000);
	end

	if c=='-3' then
		notifyMessage('该手机号码不能使用或已经使用',6000);
		msleeprand(2000);
	end

	if c=='-10' then
		notifyMessage('账户不存在或密码错误',6000);
		msleeprand(4000);
	end

	if c=='-30' then
		notifyMessage('您的绑定项目中不含此项目（若您的账号绑定了某些项目，您只能获取绑定项目的号码）',6000);
		msleeprand(4000);
	end

	if c=='-90' then
		notifyMessage('传递的参数不正确',6000);
		msleeprand(4000);
	end

	if c=='-93' then
		notifyMessage('您的账户已被锁定',6000);
		msleeprand(4000);
	end

	if c=='-99' then
		notifyMessage('其他错误',6000);
		msleeprand(4000);
	end

	return getverify(mobile);	
end

--遇到某些应用一次关不掉的话可用下面的方法
function kill_app(app_package)
    while true do 
        if appRunning(app_package) then 
            appKill(app_package);
            msleeprand(1000);
        else
            return true;
        end
    end
end
------------------------end返回函数------------------------------------


------------------------start操作函数----------------------------------
--打开微信
function openweixi()
	appRun("com.tencent.xin");--打开微信
end

function closeweixi()
	kill_app("com.tencent.xin");
end
--输入时验证手机是否正确
function inputtextverify(parame,x,y,x1,y1,nmb)
	if parame==nul then
		return;
	end
	str="\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b";
	inputText(str..parame);
	textmsg=string.sub(string.gsub(textlocalnmb(x,y,x1,y1),' ',''),1,nmb);
	if textmsg~=parame then
		msleepadd(2000,1);
		inputtextverify(parame,x,y,x1,y1,nmb);
	end
end
--输入文件本
function inputtextstr(parame)
	str="\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b";
	inputText(str..parame);	
end
--输入错误
function inputtexterror()
	i=math.random(1,10);
	for t=1,i do
		clickarea(0,716,635,1037);
		mSleep(math.random(500,3000));
		if t%math.random(1,5) then
			clickarea(0,635,229,698);
		end
	end
end

--输入数字错误信息
function inputtextnumberror()
	i=math.random(1,10);	
	for t=1,i do		
		clickarea(0,707,632,1029);
		mSleep(math.random(500,3000));	
	end	
end

--输入数字错误信息
function inputtextnumberrorn(n)
	i=math.random(1,n);	
	for t=1,i do		
		clickarea(0,707,632,1029);
		mSleep(math.random(500,3000));	
	end	
end


--延迟随机
function msleeprand(t)
	mSleep(t+math.random(100,999));
end

--增加延迟随机时间
function msleepadd(t,s)
	if s>1 then
		mSleep(t+math.random(s*10,s*100-1));
	else
		mSleep(t+math.random(100,999));
	end
end

--增加延迟随机时间
function ysmsleepadd(str,x,y,x1,y1)
	textmsg=textlocal(x,y,x1,y1);	

	if string.match(textmsg,str)~=str then
		msleeprand(math.random(500,2000));
		ysmsleepadd(str,x,y,x1,y1);
	end
end



--左上角按钮
function btnlefttop()
	click(6,44);
end

--右上角按钮
function btnrighttop()
	click(622,68);  
end
--点击按钮
function click(x, y)	
    touchDown(0, x, y);
    mSleep(math.random(20,80));
    touchUp(0);
end
--点击随时增加5个像素内
function clickrand(x, y)	
    touchDown(0, x + math.random(-5, 5), y + math.random(-5, 5));
    mSleep(math.random(100, 200));
    touchUp(0);
end
--点击区域	
function clickarea(x,y,x1,y1)
	touchDown(0,math.random(x, x1),math.random(y, y1));
	mSleep(math.random(100, 200));
	touchUp(0);
end

--根据区域查找字符串
function textlocal(x,y,x1,y1)
	code = localOcrText("/var/touchelf/scripts/tessdata",  -- 语言包tessdata目录在设备中的路径
													"chi_sim",  -- 语言类型为中文
													  x,  -- 图片左上角X坐标为100
													  y,  -- 图片左上角Y坐标为100
													  x1,  -- 图片右下角X坐标为200
													  y1); -- 图片右下角Y坐标为200
	if code == "" then
		code=0;
	end	
	return code;
end
--根据区域查找数字
function textlocalnmb(x,y,x1,y1)
	code = localOcrText("/var/touchelf/scripts/tessdata",  -- 语言包tessdata目录在设备中的路径
	                                                "eng",  -- 语言类型为中文
	                                                  x,  -- 图片左上角X坐标为100
	                                                  y,  -- 图片左上角Y坐标为100
	                                                  x1,  -- 图片右下角X坐标为200
	                                                  y1,  -- 图片右下角Y坐标为200
	                                       		"0123456789"); -- 设置白名单字符串, 只识别数字
	if code == "" then
		code=0;
	end	
	return code;
end


--查找当前屏幕颜色值并点击
function  seachcolor(color,x,y,x1,y1)	
	x,y=findColorInRegionFuzzy(color,80,x,y,x1,y1); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
	if x ~= -1 and y ~= -1 then          -- 如果找到了
		mSleep(1000);
	    click(x,y);
	else
		mSleep(1000);		
		seachcolor(color,x,y,x1,y1);
	end
end

--查找当前屏幕颜色值并点击
function seachcolorreturn(color,x,y,x1,y1)
	local t = 1;
	x,y=findColorInRegionFuzzy(color,80,x,y,x1,y1); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
	if x ~= -1 and y ~= -1 then          -- 如果找到了
		t = 1;
	else
		t=0;
	end
	return t;
end

function websavemoble(url)
end

--保存微信名与密码 
function savefileweixi(filePath,moible,pwd)
 	local fileWrite = io.open(filePath,"w")
    if fileWrite then
        fileWrite:write(moible..'----'..pwd);
        fileWrite:write("\n")
        fileWrite:close()
    end    
end


--封装好 不用改
function readFile(file)
    assert(file,"file open failed")
    local fileTab = {}
    local line = file:read()
    while line do
        table.insert(fileTab,line)
        line = file:read()
    end
    return fileTab;
end
--封装好 不用改
function writeFile(file,fileTab)
    assert(file,"file open failed")
    for i,line in ipairs(fileTab) do
        file:write(line)
        file:write("\n")
    end
end

--写入一行进文档
function writeonestr(filePath,str)
	local file = io.open(filePath,"w")
    assert(file,"file open failed");
    file:write(str);
    file:write("\n");
end


--分割字符串
function fg(str, split_char)--分割字符串
    local sub_str_tab = {}
    cc=0
    while (true) do
        cc=cc+1

        local pos = string.find(str, split_char);
        if (not pos) then
            sub_str_tab[#sub_str_tab + 1] = str;
            break;
        end
        local sub_str = string.sub(str, 1, pos - 1);
        sub_str_tab[#sub_str_tab + 1] = sub_str;
        str = string.sub(str, pos + 1, #str);
    end

    return sub_str_tab
--[[k=fg("你#好#啊", "#")
     for a=1,cc,1 do 
     ts(k[a])
     end--]]
end




------------------------end操作函数-------------------------------

-----------------------------------
    --向上拨动
    function clickmove(id,x,y)
        touchDown(0,math.random(80, 550),math.random(786, 1020));
        mSleep(100);
        cs=math.random(1, 4);--拨动次数
        -- notifyMessage(cs);   
    
        if cs>1 then
            for i=1,cs do
                touchMove(0,math.random(80, 550),math.random(100, 500));
            end
        
        else
            touchMove(0,math.random(80, 550),math.random(100, 500));
        end

        mSleep(100);
        touchUp(0);
    end


    --向下拨动
    function clickmovedom(id,x,y)
        touchDown(0,math.random(80, 550),math.random(160, 300));
        mSleep(100);
        cs=math.random(1, 4);--拨动次数
        -- notifyMessage(cs);   
    
        if cs>1 then
            for i=1,cs do
                touchMove(0,math.random(80, 550),math.random(680, 980));
            end
        
        else
            touchMove(0,math.random(80, 550),math.random(680, 980));
        end

        mSleep(100);
        touchUp(0);
    end


	--获取手机号码
    function friendmobile()
	mSleep(1000);
	mobile1 = httpGet('http://g.7gu.cn/index.php?g=api&m=Mobile&a=index'); -- 获取www.google.com的内容
	mSleep(2000);
	return mobile1; 
	end

--检查手机号码
function friendmobiletype()	
	mobile2 = httpGet('http://g.7gu.cn/index.php?g=api&m=Mobile&a=getmboiletype'); -- 获取www.google.com的内容	
	return mobile2; 
end
--检查手机号码状态修改为已检查过
function friendmobiletypeset(mobile,stratu)	
	mobile3 = httpGet('http://g.7gu.cn/index.php?g=api&m=Mobile&a=setmobiletype&mobile='..mobile..'&st='..stratu); -- 获取www.google.com的内容
	return mobile3; 
end
---------------------------------
--打开微信弹出信息按钮 
function goinfo()
	mSleep(3000);
	code=textlocal(85,630,560,700)	
	if(string.match(code,"女子")=='女子') then			
		click(313,665);
	end
end




function zdl()
	mSleep(3000);
	code=textlocal(250,718,388,788)	
	if(string.match(code,'矢口道了')=='矢口道了') then			
		clickarea(50,716,590,798);
	end

end

--随机生成字符串
    function randomStr(str, num)
        local reStr ='';
        math.randomseed(tostring(os.time()):sub(5):reverse());
        for i = 1, num do
            local getStr = math.random(1, string.len(str));
            reStr = reStr .. string.sub(str, getStr, getStr);
        end
        return reStr;
    end


    function randomStrnum(num)
    	return 	randomStr("abcdefghijklmnopqrstuvwxyz23456789",num);
    	
    end


