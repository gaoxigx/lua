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



    --向左拨动
    function clickmoveleft()
    	x=560;
    	y=76;
        
        mSleep(800);
        cs=math.random(2, 4);--拨动次数
        -- notifyMessage(cs);   
        if cs>1 then
            for i=1,cs do
            	touchDown(0,x,y);
            	mSleep(800);                
                touchMove(0,x-254,y);
                mSleep(100);                
                touchUp(0);
            end
        else
            touchMove(0,x-254,y);
            mSleep(100);                
            touchUp(0);
        end
        mSleep(5000);
    end



function jiuxiu()
	msleeprand(1000);

	appRun("com.9xiu.9xiumm");--打开九秀
    msleeprand(2000);
    local msgcodeqx=textlocal(18,1112,104,1133);        
    if(string.match(msgcodeqx,'直')=='直') then     
		click(61,1082);--直播
    end
  
    msleeprand(2000);
    local msgcodeqx=textlocal(523,365,584,410);        
    if(string.match(msgcodeqx,'冀童')=='冀童') then     
		click(559,388);--更多
    end

    msleeprand(2000);
    click(163,244);--直播间1
    	    msleeprand(4000);
	    click(436,80);
	youkeqh();--切换游客打招呼

    msleeprand(2000);
    click(491,244);--直播间2
    	    msleeprand(4000);
	    click(436,80);
	youkeqh();--切换游客打招呼

    msleeprand(2000);
    click(164,575);--直播间3
    	    msleeprand(4000);
	    click(436,80);
	youkeqh();--切换游客打招呼	

    msleeprand(2000);
    click(494,575);--直播间4
    	    msleeprand(4000);
	    click(436,80);
	youkeqh();--切换游客打招呼

    msleeprand(2000);
    click(170,857);--直播间5
    	    msleeprand(4000);
	    click(436,80);
	youkeqh();--切换游客打招呼

    msleeprand(2000);
    click(484,857);--直播间6
    	    msleeprand(4000);
	    click(436,80);
	youkeqh();--切换游客打招呼


    msleeprand(2000);
    click(157,1103);--直播间7
    	    msleeprand(4000);
	    click(436,80);
	youkeqh();--切换游客打招呼	


    msleeprand(2000);
    click(488,1103);--直播间8
    	    msleeprand(4000);
	    click(436,80);
	youkeqh();--切换游客打招呼

end



   --游客切换
	function youkeqh();

	    msleeprand(2000);
	    clickmoveleft();--向上拨动
	    msleeprand(2000);
	    click(56,416);--第一个游客
	    dazhaohu();

	    msleeprand(2000);
	    click(436,80);
	    msleeprand(2000);
	    click(56,535);--第二个游客
	    dazhaohu();

	    msleeprand(2000);
	    click(436,80);
	    msleeprand(2000);
	    click(56,650);--第三个游客
	    dazhaohu();

	    msleeprand(2000);
	    click(436,80);
	    msleeprand(2000);
	    click(56,770);--第四个游客
	    dazhaohu();

	    msleeprand(2000);
	    click(436,80);
	    msleeprand(2000);
	    click(56,888);--第五个游客
	    dazhaohu();


	    msleeprand(2000);
	    click(436,80);
	    msleeprand(2000);
	    click(56,1008);--第六个游客
	    dazhaohu();

	    msleeprand(2000);
	    click(610,77);--关闭
	    msleeprand(2500);
	end


   --打招呼
	function dazhaohu()
	    msleeprand(1500);
	    click(320,713);--私聊
	    msleeprand(1000);
	    click(338,1110);--点击输入框
	    msleeprand(1000);
		str="\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b";
	     msleeprand(1500);
	        a = {"嗨,你好", 
	            "hello", 
	            "hello,你会唱歌吗",
	        }
	        a_num=math.random(1,#a);
	        inputText(str..a[a_num]);

	    msleeprand(2000);
	    click(596,600); --点击发送  

	    msleeprand(2000);
	    click(610,77);--关闭
	end

    --向上拨动不要管理员
    function clickmoveleft()
    	x=230;
    	y=1068;
        
        mSleep(800);
        cs=math.random(2, 3);--拨动次数
        -- notifyMessage(cs);   
        if cs>1 then
            for i=1,cs do
            	touchDown(0,x,y);
            	mSleep(500);                
                touchMove(0,x,y-589);
                mSleep(100);                
                touchUp(0);
            end
        else
            touchMove(0,x,y-589);
            mSleep(100);                
            touchUp(0);
        end
        mSleep(5000);
    end


