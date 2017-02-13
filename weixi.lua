
-- t微信摇一摇--
-- 主入口
function weixiyaoyao()
   -- while true do
        appKill("com.tencent.xin");
        mSleep(1100)
        local x=getparamezb(gsinfo,'phonex');
    	 local y=getparamezb(gsinfo,'phoney');
        fakeGPS("com.tencent.xin",x,y);
        mSleep(1000); 
        appRun("com.tencent.xin");
        if startbox()==2 then --弹框 账号已封
        	return;
        end
        click(34,89);--返回
        click(34,89);--返回
        click(34,89);--返回
        click(34,89);--返回
        
        for sim = 100, 0, -1 do           --使用 for 循环不断降低精确度(建议精确度不低于50%)
            x, y = findColorInRegionFuzzy(0x09bb07, sim, 40, 1043, 104, 1101); 
            if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件
                 click(398,1077);--点发现
                break;                    --并跳出循环
            end

            x, y = findColorInRegionFuzzy(0x09bb07, sim, 367,1043 , 433, 1101); 
            if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件
                click(398,1077);--点发现
                break;                    --并跳出循环
            end
        end
        
        mSleep(500);
        
        click(154,416);--点摇一摇
        mSleep(100);
        shakeDevice();--摇一摇
        mSleep(5000);

        --if(getweixiyaotime(60)) then end;
        --mSleep(1000*60*tonumber(ytime));
        --[[
        click(34,89);--返回
        click(34,89);--返回
        click(34,89);--返回
        click(34,89);--返回
        --appKill("com.tencent.xin");
        --]]
    --end
end

function startbox()
    local tj = 1;
    while true do
        for sim = 100, 92, -1 do  
            x, y = findColorInRegionFuzzy(0x007aff, sim, 304, 654, 345, 700); 
            if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件
            	
                mSleep(200);
                click(318,668);--好
                mSleep(200);
                --notifyMessage('检测脚本文件');
                return 1;
                --break;   --并跳出循环
            end
        end

        if(listcolorinfo(0xf4f5f7,97,158, 1066, 177, 1076)==true and listcolorinfo(0xf4f5f7,95,218, 1072, 330, 1090)==true ) then
			mSleep(1500);
			if(listcolorinfo(0xf4f5f7,97,158, 1066, 177, 1076)==true and listcolorinfo(0xf4f5f7,95,218, 1072, 330, 1090)==true ) then
				
				return 1;
			end
		end

        msgfr=textlocal(89,470,557,683);  
	    if string.match(msgfr,'可申')=='可申' then
	        click(185,683);
	        msleep(1000);
	        return 2;
	    end

        tj=tj+1;
        mSleep(400);
    end
end
--微信通讯录检测数据--必须安插件
function wxtxlfriend()
      addressbook();
      appRun("com.tencent.xin");
   -- if findcolor(0x1aad19,522,287,604,341) then
      mSleep(500);
      click(26,83);
      mSleep(500);
      click(26,83);
      mSleep(500);
      click(26,83);
      mSleep(500);
      click(26,83);
      mSleep(500);
      click(26,83);

      mSleep(500);
      click(238,1079);
      mSleep(500);

      click(218,274);
      mSleep(800);

      click(161,290);
      mSleep(10000);
       --[[      for i=1,4 do

        if fuzzycolor(0x1aad19,494,256,637,1130)==false then
          mSleep(1000);
        else
          break;
        end
      end
     --]]

      mSleep(2500);
end

function remove(path)
    return os.execute("rm -rf "..path);
end

