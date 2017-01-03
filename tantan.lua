--探探
function opentt()
	closett()
	mSleep(10000);
	appRun("com.yaymedialabs.putong");
	fakeGPS("com.yaymedialabs.putong", 40.0234512958, 116.2185668045); 
end

function openlover()
	info=runparame();
    local xzb=getparamezb(gsinfo,'phonex');
    local yzb=getparamezb(gsinfo,'phoney');
    appRun("com.yaymedialabs.putong");
	fakeGPS("com.yaymedialabs.putong", xzb, yzb); 
	for sim = 100, 50, -1 do  
			x, y = findColorInRegionFuzzy(0x007aff, sim, 301, 650, 336, 684); 
			if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件
			    click(318,668);--好
			    mSleep(500);
			    --notifyMessage("sdfdsf");
			    break;                    --并跳出循环
			end
			--mSleep(500);
	end


	mSleep(3000);
	mSleep(1000);
	click(416,1046);
	mSleep(1000);
	click(416,1046);
	mSleep(1000);
	click(416,1046);
	mSleep(1000);
	click(416,1046);
	mSleep(1000);	
end

function closett()
	appKill("com.yaymedialabs.putong");
end
--探探GPRS修改成功
function ttGPRS()
	appKill("com.yaymedialabs.putong");
	mSleep(2000);
	info=runparame();
    local xzb=getparamezb(gsinfo,'phonex');
    local yzb=getparamezb(gsinfo,'phoney');
	fakeGPS("com.yaymedialabs.putong", xzb, yzb); 
	notifyMessage("探探GPRS地址修改成功");
end

--探探


--合拍
   

function hepai()

   appRun("com.HePai.HePaiiOS");--打开合拍

	msleeprand(3000);

    local msgcodeqx=textlocal(420,1100,476,1131);        
    if(string.match(msgcodeqx,'发王见')=='发王见') then     
		click(448,1076);--发现

		msleeprand(1500);
		click(300,680);--附近的人
	end
	
	msleeprand(3000);
		local msgcodexqxt= textlocal(415,1037,551,1080);
		if(string.match(msgcodexqxt,'兴趣')=='兴趣') or (string.match(msgcodexqxt,'目')=='目') then

        	for i=1,66 do
				click(359,1059);--通过
			    mSleep(1000);
			end
		end
end	

 --合拍
