-- 主入口
SCREEN_RESOLUTION="640x1136";
SCREEN_COLOR_BITS=32;

-- 主入口
function main()
	openmm();
	boxinfo();
	sendnew();
end

function boxinfo()	
	while true do
		mSleep(1200);
		click(579,1084);
		mSleep(1000);
		x,y=findColorInRegionFuzzy(0x46cbfd,80,86,441,128,468); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
		if x ~= -1 and y ~= -1 then          -- 如果找到了
			click(62,1085);
			break;
		
		end
		click(185,699);
		mSleep(800);
	end
end
	
function sendnew()
	
	for sim = 100, 80, -1 do   
		x,y=findColorInRegionFuzzy(0x00c0ff,sim,43,1050,79,1092); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
		if x ~= -1 and y ~= -1 then          -- 如果找到了
			click(64,1068)
			break;
		else
			click(59,86);
		end
	end

	while true do
		click(440,87);
		mSleep(800);
		click(554,949);
		mSleep(800);
		
		for sim = 100, 80, -1 do   
			x,y=findColorInRegionFuzzy(0x05d0c0,sim,224,719,262,744); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
			if x ~= -1 and y ~= -1 then          -- 如果找到了				
				mSleep(500);
				click(244,770);	
				mSleep(1000);
				sedimginfo();
				break;
			else
				mSleep(200);
			end
		end		
	end

end
--点发送朋友图片信息
function sedimginfo()
		mSleep(800);
		click(283,167);--选中第一个图片
		mSleep(800);
		click(542,1092);--点完成
		mSleep(2000);
		click(281,182);--点输入框
		mSleep(800);
		inputText("长按二维码，别怪我没有告诉你噢，闺蜜开直播了");--..math.random(1,10000000)
		mSleep(2500);
		click(595,85);--点发送
		mSleep(2500);
		--click(191,655);


		while true do
			x,y=findColorInRegionFuzzy(0x00c0ff,sim,43,1050,79,1092); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
			if x ~= -1 and y ~= -1 then          -- 如果找到了
				click(64,1068)
				break;
			else
				click(59,86);
				mSleep(2000);
				click(457,627);
				mSleep(1000);
				break;
			end
		end
end


function openmm()
	appKill("com.wemomo.momoappdemo1");
    mSleep(1100);
	appRun("com.wemomo.momoappdemo1");
end


--查找当前屏幕颜色值并点击
function  seachcolor(color,x,y,x1,y1)	
	
	for sim = 100, 80, -1 do   
		x,y=findColorInRegionFuzzy(color,sim,x,y,x1,y1); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
		if x ~= -1 and y ~= -1 then          -- 如果找到了
			notifyMessage("dsfd545456",5000);
			mSleep(200);
		    click(x,y);
		    break;
		else
			notifyMessage("dsfd545456"..sim,1000);
			mSleep(200);	
		end
	end
end

function click(x, y)
    touchDown(0, x, y);
    mSleep(200);
    touchUp(0);
end

