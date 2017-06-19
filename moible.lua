-- 主入口
SCREEN_RESOLUTION="640x1136";
SCREEN_COLOR_BITS=32;

-- 主入口
function main()
	mmlogin();
end

function mmlogin()

	appKill("com.wemomo.momoappdemo1");
    mSleep(1100);
	appRun("com.wemomo.momoappdemo1");
	mSleep(1000);

	while true do
		x,y=findColorInRegionFuzzy(0x3462ff,80,413,801,454,828); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
		if x ~= -1 and y ~= -1 then          -- 如果找到了
			mSleep(1000);
			click(190,1065);--点微信登陆
		    break;
		else		
			mSleep(200);	
		end
	end
	

	while true do
		x,y=findColorInRegionFuzzy(0x04be02,80,414,771,457,790); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
		if x ~= -1 and y ~= -1 then          -- 如果找到了
			mSleep(800);
			click(320,782);--确认微信登陆
		    break;
		else		
			mSleep(200);	
		end
	end

	mSleep(3000);
	local into = 1
	--绑定手机页面
	for sim = 100, 80, -1 do   
		x,y=findColorInRegionFuzzy(0x3462ff,sim,275,566,307,592); -- 在全屏范围找到第一个颜色为0x0000ff的点, 精确度为90%, 将其坐标保存到变量x和y中
		if x ~= -1 and y ~= -1 then          -- 如果找到了
			mSleep(800);
			click(539,226);--不绑定手机号码
			into=1;
		    break;
		else		
			mSleep(200);	
			into=2;
		end
	end
	--是第一次登入
	if(into==2) then
		onelogin();
	end
	
end
--第一个登入陌陌
function onelogin()
	mSleep(600);
	click(173,630);--修改日期
	mSleep(800);
	click(77,328);

	mSleep(800);--
	click(311,1008);--点击一步

	mSleep(800);
	click(227,337);--点击设置密码框;
	mSleep(1000);
	inputText("asd168168")--输入密码；
	mSleep(1000);
	click(340,517);--点进入陌陌

	mSleep(1000);
	click(61,77);--关闭
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

