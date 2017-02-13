
--[[注册文件]]
function reary()
	local t={
	'comm',
	'action',
	'catwxw',
	'register',
	'post',
	'tantan',
	"tanwxw",
	'weixi',
	'mm'
	};	
	return t;
end



--注册所有方法程序
function loadfunction()
	newfiles('/var/touchelf/scripts/scriptfile/images/');
    loadimg(); 
    locafebiao();   
end

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
--安装脚本--
-------------------start执行过程--------------------------------
--注册

----------------------------------------------------

function locafebiao()
	flag=true;
	local t={'feibiao'};	
	for k, v in pairs(t) do
		if file_exists("/var/touchelf/scripts/"..v..".lua") then 
		else
	   		getfilestart(v);
	   		notifyMessage('请运行feibiao.lua文件');
	   		os.exit();
		end				
	end
end

function getfilestart(vl)
    local flagf = ftpGet("ftp://121.40.140.16:/script/public/script/scriptfile/"..vl..".lua", "/var/touchelf/scripts/"..vl..".lua", "productconsole", "T4t8u0p1");
	if flagf then
	    notifyMessage('加载'..vl..'文件');
	else
	    notifyMessage("加载失败")
	end
end
----------------------------------------------------



