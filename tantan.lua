--打开探探
function opentt(){
	appRun("com.yaymedialabs.putong");
}

function openlover(){

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
}
