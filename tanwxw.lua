--左上角按钮
function btnlefttop()
	click(37,82);
end

--右上角按钮
function btnrighttop()
	click(599,85);  
end


--延迟随机
function msleeprand(t)
	mSleep(t+math.random(100,999));
end

--点击按钮
function click(x, y)	
    touchDown(0, x, y);
    mSleep(math.random(20,80));
    touchUp(0);
end
--探探点赞
function ttdianzan()
    appRun("com.yaymedialabs.putong");--打开探探

    msleeprand(5000);
    click(37,82);--左上角

	msleeprand(1500);
	click(226,388);--探探


	msleeprand(1200);
	for sim = 100, 50, -1 do  
			x, y = findColorInRegionFuzzy(0xec553f, sim, 400, 1035, 436, 1067); 
			if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件
			    click(418,1050);--红色心形
			    mSleep(500);
			    --notifyMessage("sdfdsf");
			    break;                    --并跳出循环
			end
			--mSleep(500);
	end
end
