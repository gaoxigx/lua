
    --点赞和评论
    function filelike()
        msleeprand(2000);
        clickarea(346,1050,480,1128);--点击发现
        msleeprand(2000);
        clickarea(10,164,630,234);--点击朋友圈

        msleeprand(2000); --点击移动
        clickmove();

        msleeprand(2000);
            x, y = findImage("/mnt/sdcard/dz66.bmp"); -- 在全屏范围找到第一个路径为"/mnt/sdcar/a.bmp"的图片, 将其左上角坐标保存到变量x和y中
            if x ~= -1 and y ~= -1 then            -- 如果找到了
                touchDown(0, x, y);                -- 点击那个点
                touchUp(0);
            end  

        -- msleeprand(3000);--点赞
        --    x, y = findImageFuzzy("/mnt/sdcard/XX.bmp",0x4c5154); 
        --     if x ~= -1 and y ~= -1 then            
        --         touchDown(0, x+98, y+40);          -- 点击那个点
        --         touchUp(0);
        --         -- notifyMessage("msleeprand",3000);
        --     end  

        msleeprand(3000);--评论
            x, y = findImageFuzzy("/mnt/sdcard/PP.bmp",0x4c5154); 
            if x ~= -1 and y ~= -1 then            -- 如果找到了
                touchDown(0, x, y);                -- 点击那个点
                touchUp(0);
                msleeprand(2000);
                -- os.execute("input text \"asdasd\"");

                a = {"666", 
                    "哇", 
                    "好像很厉害的样子",
                    "长知识了",
                    "32个赞",
                    "我差点信了",
                    "开鲁咯！",
                    "上线5黑，赶紧的",
                }
                a_num=math.random(1,#a);
                inputText(a[a_num]);

                msleeprand(2000);
                clickarea(170,1059,464,1120); --点击键盘空格键
                msleeprand(2000);
                clickarea(490,1060,626,1120); --点击发送   
            end


        msleeprand(2000);
        btnlefttop();
    end




    --发送朋友圈
    function filesend()
    msleeprand(2000);
    clickarea(346,1050,480,1128);--点击发现
    msleeprand(2000);
    clickarea(10,164,630,234);--点击朋友圈
    msleeprand(2000);
    clickarea(566,65,612,100);--右上角
    msleeprand(2000);
    clickarea(6,940,632,1024);--从手机相册选择
    -- msleeprand(3000);  
    -- clickarea(22,320,620,458)--点击第二个相册

	msleeprand(3000); --点击移动
	clickmove();

    msleeprand(3000);

        tp=math.random(1, 9);--随机点击图片数量
        for i=1,tp do
			st=(math.random(0, 10000)%4)*150-20;
			if st<150 then
				st=150;
			end
			dt=(math.random(0,10000)%6)*154-20;
			if dt<154 then
				dt=154;
			end
    		click(st,dt);
        end


    msleeprand(3000);
    clickarea(520,1070,618,1108);--选好图片点击完成

    msleeprand(2000);
    clickarea(40,154,584,186);--点击进入输入框

     msleeprand(3000);

        a = {"666", 
            "哇", 
            "好像很厉害的样子",
            "长知识了",
            "32个赞",
            "我差点信了",
            "开鲁咯！",
            "上线5黑，赶紧的",
        }
        a_num=math.random(1,#a);
        inputText(a[a_num]);

        -- msleeprand(2000);
        -- clickarea(170,1059,464,1120); --点击键盘空格键
        msleeprand(3000);
        clickarea(554,62,622,98); --点击发送  

        msleeprand(3000);
        btnlefttop();--点击坐上角返回

    end



    --头像设置
    function friendmi()
        msleeprand(2000);
        clickarea(510,1046,624,1124); --点击我
        msleeprand(2000);
        clickarea(10,170,630,320);--点击头部栏信息
        msleeprand(2000);
        clickarea(6,164,632,314);--点击头像
        msleeprand(2000);
        btnrighttop();--点击个人头像右上角选择
        msleeprand(3000);
        clickarea(6,840,632,924);--点击从手机相册选择
        msleeprand(3000);  
        clickarea(8,308,632,456);--点击第二个相册

        if photo=='第二个相册' then      
            clickarea(22,320,620,458)
        end

        msleeprand(2000); --点击移动
        clickmove();

        msleeprand(4000);
    -- notifyMessage('sdfsdf',5000); 
        st=(math.random(0, 10000)%4)*156-20;
        if st<156 then
            st=156;
        end
        dt=(math.random(0,10000)%6)*156-20;
        if dt<156 then
            dt=156;
        end
        click(st,dt);--随机选择图片

        msleeprand(3000);
        clickarea(540,1040,616,1076);--选取图片

        msleeprand(3000);
        btnlefttop();

        msleeprand(2000);
        btnlefttop();--点击坐上角返回
    end

    --设置朋友圈照片
    function friend()
        msleeprand(2000);
        clickarea(346,1050,480,1128);--点击发现
        msleeprand(2000);
        clickarea(10,164,630,234);--点击朋友圈
        msleeprand(2000);
        clickarea(8,136,632,506);--轻触设置相册封面    
        msleeprand(3000);
        clickarea(6,940,632,1020);--点击更改相册封面
        msleeprand(2000);
        clickarea(6,164,632,240);--从手机相册选择
        msleeprand(2000);
        clickarea(6,305,632,452);--选择第二个相册
        
        if photo=='第二个相册' then      
            clickarea(22,320,620,458)
        end

        msleeprand(2000); --点击移动
        clickmove();

        msleeprand(4000);
    -- notifyMessage('sdfsdf',5000); 
        st=(math.random(0, 10000)%4)*157-20;

        dt=(math.random(0,10000)%6)*157-20;
        if dt<145 then
            dt=176;
        end
        click(st,dt);--随机选择图片

        msleeprand(3000);
        clickarea(540,1040,616,1076);--选取图片

        msleeprand(3000);
        btnlefttop();

        msleeprand(2000);
        btnlefttop();--点击坐上角返回
    end





    --个性签名
    function runame()
    msleeprand(2000);
    clickarea(510,1046,624,1124);--点击我
    msleeprand(2000);
    clickarea(10,170,630,320);--点击头部信息
    msleeprand(2000);
    clickarea(6,894,632,992);--点击个性签名

    msleeprand(2000);
    clickrand(632,310);--点击进入输入框
    msleeprand(2000);
    str="\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b";
    inputText(str);--删除键

     msleeprand(3000);
--[[
        a = {"今天天气很不错", 
            "这鬼天气，晒成狗了", 
            "又下雨，MB",
            "老是躺输没意思cao",
            "32个赞",
            "都走了！",
            "开鲁咯！",
            "许多不舍！",
        }
        a_num=math.random(1,#a);
        --]]
        signstr=getsiing();
        -- notifyMessage(signstr,5000);
        inputText(signstr);

        -- msleeprand(2000);
        -- clickarea(170,1059,464,1120); --点击键盘空格键
        msleeprand(2000);
        clickarea(550,62,622,100); --点击完成

        msleeprand(2000);
        btnlefttop();--点击坐上角返回

    end




    --添加通讯录
    function address() 
        str="\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b";

        for i=1,3 do
            mSleep(2000);
            clickrand(590,80); --点击+号添加
            mSleep(2000);
            clickrand(140,484);--点击添加电话

            mSleep(2000);
            clickrand(275,485);--点击进入输入框
       
        
        -- notifyMessage('adsad');          
            mobile=friendmobile();
            notifyMessage(mobile,2000); 
            inputText(str..mobile);

            mSleep(3000);
            clickrand(590,86);--点击完成

            mSleep(3000);
            clickrand(120,80);--点击所有联系人

        end

    end