--注册所有方法程序
function loadfunction()
	newfiles('/var/touchelf/scripts/scriptfile/images/');
    loadimg();    
    loadfile();
end
require "tantan";

function newfiles(path)    
    return os.execute("mkdir "..path);
end
function loadimg()
--images--
   local a = {"PP.bmp","XX.bmp","dz66.bmp","XSC.bmp","CMM.bmp"}
   for k, v in pairs(a) do   
   		if file_exists("/var/touchelf/scripts/scriptfile/images/"..v..".lua") then
        	flag = ftpGet("ftp://121.40.140.16:/script/public/script/scriptfile/images/"..v, "/var/touchelf/scripts/scriptfile/images/"..v, "productconsole", "T4t8u0p1");
        end
   end
--images--
end

function loadfile()
	notifyMessage('检测脚本文件');
	newfolder();--创建文件
	flag=true;
	local t={'tantan'};	
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
	    notifyMessage("探探脚本已经更新到最新");
	else
	    notifyMessage("探探脚本已经更新失败");	 
	end		
end