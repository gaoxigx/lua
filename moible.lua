-- 主入口
SCREEN_RESOLUTION="640x1136";
SCREEN_COLOR_BITS=32;

-- 主入口
function main()
	mSleep(1000);

	  seachcolor(0x1aad19,6,394,637,1037);--增加到通讯录 按颜色查找通讯录
	 
	  mSleep(1000);

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

