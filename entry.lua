-- 适用屏幕参数appKill("com.tencent.xin");
SCREEN_RESOLUTION="640x1136";
SCREEN_COLOR_BITS=32;
package.path=package.path .. ";/var/touchelf/scripts/scriptfile/?.lua";
-- 主入口
gsinfo='';
weixiinfo={};
function main()

	insetinfo();
	require "comm";
	require "action";	
	require "post";
	require "register";
	require "catwxw";
	require "loadfun";
	
	loadfunction();	

	gsinfo=runparame();--得到指令23,134,628,289		
	if gsinfo==nil or gsinfo=='' then
		notifyMessage('请连接网络再运行',5000);
		os.exit();
	end

	if gsinfo=='3' or gsinfo=='0'  then
		notifyMessage('没有指定运行命令',5000);
		os.exit();
	end

	runcodenmb=getparame(gsinfo,'parame');--得到对应的值   
	if runcodenmb=='' then
		notifyMessage('没有可执和f的指令',5000);
		os.exit();
	end

	k=fg(runcodenmb,',');	
    for i,v in ipairs(k) do     	
    	sul=registerrcb(k[i]);
    	if sul==0 then
    		break;
    	end
    end
    --]]
 end

function backuphdhd(mobile,pwd)
	mSleep(1000);	
	appRun('com.workhard.hdfakerset');
	mSleep(1000);	
	click(139,1064);--操作
	mSleep(1000);
	click(293,675);--备份数据
	mSleep(1000);
	click(557,82);--开始备份
	mSleep(3000);
	inputtextstr(mobile..'-'..pwd);--更改名字
	mSleep(4000);
	mSleep(2000); 
	click(326,304);--开始备份
	mSleep(3000);
	click(323,657);--点完成
end


--安装脚本--
function insetinfo()
	notifyMessage('检测脚本文件');
	newfolder();--创建文件
	flag=true;
	local t={'comm','action','loadfun','catwxw','register','post'};	
	for k, v in pairs(t) do
		if file_exists("/var/touchelf/scripts/scriptfile/"..v..".lua") then 
			path="/var/touchelf/scripts/scriptfile/"..v..".lua";		
			f=io.file(path);
			local tim=f.time();	
			local strurlt='http://g.7gu.cn/index.php?g=api&m=Equictive&a=filetime&n='..v..'&t='..tim;
			if strurlt=='' or strurlt==nil then
				notifyMessage('没有网络');
				os.exit();
			end				
			local timeat=httpGet(strurlt);	
			if timeat=='1' then
				getfileat(v);
			end
		else
	   		getfileat(v);
		end				
	end

	if flag then
	    notifyMessage("脚本已经更新到最新");
	else
	    notifyMessage("脚本已经更新失败");	 
	end		
end
--[[
参数说明：path为要创建文件夹的路径。
如要创建test文件夹，则输入：
--]]
function newfolder(path)
	path="/var/touchelf/scripts/scriptfile/";
    return os.execute("mkdir "..path);
end

--解压zip文件
function unzip()
	path="/var/touchelf/scripts/scriptfile/tessdata.zip";
	to="/var/touchelf/scripts/scriptfile/";
    return os.execute("unzip "..path.." -d "..to);
end

----检测指定文件是否存在
function file_exists(file_name)
    local f = io.open(file_name, "r")
    return f ~= nil and f:close()
end
--得到文件的修改时间
function filestime()
	strfiletime=httpGet('http://g.7gu.cn/index.php?g=api&m=Equictive&a=index');
	return strfiletime;
end

function io.file(path)
    local _={}
    function _:chmod(mode)
        if mode then
            return os.execute("chmod "..mode.." "..path)
        else 
            return string.sub(io.popen("ls -l "..path):read("*l"),2,10)
        end
    end
    function _:chown(mode)
        if mode then
            return os.execute("chown "..mode.." "..path)
        else 
            return string.match(io.popen("ls -l "..path):read("*l"),string.rep("[^ ]+[ ]+",2).."([^ ]+)")
        end
    end
    function _:size()
        return string.match(io.popen("ls -l "..path):read("*l"),string.rep("[^ ]+[ ]+",4).."([^ ]+)")
    end
    function _:time()
        return string.match(io.popen("ls -l "..path):read("*l"),string.rep("[^ ]+[ ]+",5).."("..string.rep("[^ ]+[ ]+",3)..")")
    end
    return _
end

--得到相应的命令
function getparame(sul,str)
	v=string.sub(sul,string.find(sul,'<'..str..'>')+string.len('<'..str..'>'),string.find(sul,'</'..str..'>')-1);
	return v;
end
--安装脚本--
-------------------start执行过程--------------------------------
--注册

----------------------------------------------------




function getfileat(vl)
    local flagf = ftpGet("ftp://121.40.140.16:/script/public/script/scriptfile/"..vl..".lua", "/var/touchelf/scripts/scriptfile/"..vl..".lua", "productconsole", "T4t8u0p1");
	if flagf then
	    notifyMessage('文件更新中>>>'..vl);
	else
	    notifyMessage("下载失败")
	end

end
