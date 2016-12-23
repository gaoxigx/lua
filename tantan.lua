--探探
function opentt()
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

--探探



