
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




