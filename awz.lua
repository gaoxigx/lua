-- 适用屏幕参数appKill("com.tencent.xin");
--[[
SCREEN_RESOLUTION="640x1136";
SCREEN_COLOR_BITS=32;
weixiinfo={};
-- 主入口
function main()
	-- loginawxwx();
	-- login62zh();
	xiazai();
end
--]]
function loginawxwx()
	--得到62数据
 	local url='http://g.7gu.cn/index.php?g=Api&m=Wxh&a=wx62data';
	local redata = httpGet(url);	
	
	local wxid=0;
	local wxpwd=0;
	local wx62=0;
	if redata~=nil and redata~='null' then
		wxid = getparame(redata,"wxid");
		weixiinfo['wxid']=wxid;		
		wxpwd = getparame(redata,"wxpwd");
		weixiinfo['wxpwd']=wxpwd;
		wx62 = getparame(redata,"wx62");
		weixiinfo['wx62']=wx62;
	end

	if wx62==0 or wx62=='' then
		notifyMessage('数据已登完');
		return;
	end

 	appRun("AWZ");--打开awz	
	mSleep(1000);
	newh(); --一键新机
	getdata();--得到数据    
	writeFile("/var/mobile/iggparams.txt",wx62);--写入	
	set62dta();--设置62数据
	setwxname(wxid..'--'..wxpwd);	
	notifyMessage("已经加62数据");	
	mSleep(1000);

	login62zh()--登入62数据
 end
 function awxnexwx()
 	appRun("AWZ");--打开awz
 	mSleep(1000);
 	nextawzwx();
 	notifyMessage("成功加载数据");
 end
--一件新机
function newh()
	mSleep(200);
	return htwx("http://127.0.0.1:1688/cmd?fun=newrecord","一键新机失败");
end
--生成62数据参数
function getdata()
	mSleep(200);
	return htwx("http://127.0.0.1:1688/cmd?fun=getcurrentrecordparam","获取数据失败");
end
--设置62数据参数
function set62dta()
	mSleep(200);
	return htwx("http://127.0.0.1:1688/cmd?fun=setcurrentrecordparam","设置62数据失败");
end
--设计当前数据名称
function setwxname(name)
	mSleep(200);
	local t="http://127.0.0.1:1688/cmd?fun=renamecurrentrecord&name="..name;
	return htwx(t,"设置名称失败");
end
--下一条数据
function nextawzwx()
	mSleep(200);
	return htwx("http://127.0.0.1:1688/cmd?fun=nextrecord","下一条数据错误");
end
--发送http请求
function htwx(http,msg)
	mSleep(200);
	code = httpGet(http);
	if code  == "" then
		notifyMessage(msg);
	    return false;
	end
	mSleep(3000);	
	return true;
end
--写入文件62long
function writeFile(path,longid)
	file=io.open(path,'a+')
	file:write("62long:"..longid)
	file:close()
end

function getparame(sul,str)
	v=string.sub(sul,string.find(sul,'<'..str..'>')+string.len('<'..str..'>'),string.find(sul,'</'..str..'>')-1);
	return v;
end



--登录62数据并设置资料
function  login62zh()
	mSleep(1000);
	openweixi();

	while true do
		mSleep(500);
		click(158,1047);--点击登录
		mSleep(500);
		if seachcolorreturn(0xffffff,340,931,345,935)==1 then
			break;
		end
	end

	mSleep(800);
	click(455,1055);--其他方式登录	
	mSleep(1500);
	click(272,325);--点击输入帐号 
	mSleep(500);
	click(272,325);--点击输入帐号 
	inputText(weixiinfo['wxid']);
	mSleep(1200);
	click(244,422);--点击输入密码
	inputText(weixiinfo['wxpwd']);
	mSleep(1000);
	local msgcode=textlocal(80,419,541,481);--匹配通讯录点否		
	if(string.match(msgcode,'匹')=='匹') or (string.match(msgcode,'录')=='录') then			
		click(190,700);--否
	end

	while true do
	mSleep(500);
	click(560,1085);--点击登录
	mSleep(500);
	if seachcolorreturn(0x1aad19,548,1062,578,1097)==1 then
		break;
	end
	click(190,700);--否
	end
end	

--下载
function xiazai()
	xiazaiqqtp('pyq.txt');
    --读取指定文件所有内容，返回一个数组
    local  list = readFile("/var/touchelf/scripts/scriptfile/images/pyq.txt");
    if list==nil then
    	notifyMessage("文档下载失败");
    	return false;
    end
	local str = list[1];

	if str==nil then 
		notifyMessage("文档下载失败");
		return false;
	end

	local result = Split(str,',')  --分隔字符串  
    notifyMessage("下载图片中");

    for k, v in pairs( result) do 
    	notifyMessage(v,2000);
        xiazaiqqtp(v)
    end
--]]

end

--字符串分隔方法  
function Split(szFullString, szSeparator)  
	local nFindStartIndex = 1  
	local nSplitIndex = 1  
	local nSplitArray = {}  
	while true do  
	   local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)  
	   if not nFindLastIndex then  
	    nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))  
	    break  
	   end  
	   nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)  
	   nFindStartIndex = nFindLastIndex + string.len(szSeparator)  
	   nSplitIndex = nSplitIndex + 1  
	end  
	return nSplitArray  
end
  



--读取文档
function readFile(path)
    local file = io.open(path,"r");--用读模式打开一个文件
    if file then
        local _list = {};
        for l in file:lines() do 
            table.insert(_list,l)
        end
        file:close();--关闭默认的输出文件
        return _list
    end
end


--下载图片请求
function xiazaiqqtp(imgname)
    mSleep(1000);
    local path="ftp://121.40.140.16:/script/luaimg/"..imgname;  
    local savepath="/var/touchelf/scripts/scriptfile/images/"..imgname;
    local getdata=ftpGet(path, savepath, "productconsole", "T4t8u0p1");
    if getdata then
        return true;    
    end

 	return false;

end

--新号设置资料
function shezhizl()
	msleeprand(1000);
	delphoto();
	mSleep(1000);
	openweixi();
	mSleep(800);
    saveImageToAlbum("/var/touchelf/scripts/scriptfile/images/tx1.png");
    mSleep(800);
	click(560,1082);--点我设置资料
	mSleep(800);
	click(167,241);
	mSleep(800);
	click(300,250);--头像设置
	mSleep(800);
	click(592,85);--三点
	mSleep(800);
	click(322,882);--从相册选择
	mSleep(800);
	click(283,182);--第一个相册
	mSleep(1500);--点击第一张
	click(71,205);
	click(572,1065);--完成
	mSleep(3000);
	click(83,83);--返回

	mSleep(1000);
	click(320,368);--设置名字
	mSleep(800);
	inputText("小雪");
	click(590,86);--保存
	mSleep(1200);
	click(254,765);--设置性别女
	mSleep(800);
	click(307,292);--女
	mSleep(800);
	click(299,939);--设置个性签名
	inputText("青春无期限，无热血不少年！");
	click(592,86);--完成
end	


--打开微信
function openweixi()
	appRun("com.tencent.xin");--打开微信
end

function closeweixi()
	kill_app("com.tencent.xin");
end



--点击按钮
function click(x, y)	
    touchDown(0, x, y);
    mSleep(math.random(20,80));
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


--查找当前屏幕颜色值并返回int 1 0
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



--删除相片
function delphoto()
   mSleep(1000);
  --openURL("prefs:root=Photos");  .sharing-nowakeMar
  --appRun("com.apple.mediastream"); 
   mSleep(1000);
   appKill("com.apple.mobileslideshow");
   mSleep(1000);
   appRun("com.apple.mobileslideshow"); 
   --appRun("com.apple.mediastream.sharing-nowake");  
  mSleep(1000);
  --是否打相册
  local numloop = 1;
  while true do
    local wloop = false;
    for sim = 100, 90, -1 do  
        x, y = findColorInRegionFuzzy(0x007aff, sim, 93, 1068, 131, 1095); 
        if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件          
            wloop=true;               
            break;   --并跳出循环
        end
    end 

    local wloop1 = false;
    for sim = 100, 90, -1 do  
        x, y = findColorInRegionFuzzy(0x007aff, sim, 15, 58, 126, 123); 
        if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件          
            wloop1=true;               
            break;   --并跳出循环
        end
    end 
    if wloop1==false then
      return;
    end

    if wloop==true then
      break;
    end
    numloop=numloop+1;
    if numloop>50 then
      break;
    end
    mSleep(1000);
    click(101,1087);
    mSleep(1000);
    appKill("com.apple.mobileslideshow");
    mSleep(2000);
  end

  mSleep(800);
  click(591,81);
  mSleep(1000);
  click(583,177);
  mSleep(1000);
  click(591,1083);
  mSleep(1000);
  click(317,975);
  --是否打相册     
end
