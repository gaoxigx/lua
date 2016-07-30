--点赞和评论
    function filelike()
        clickarea(346,1050,480,1128);--点击发现
        msleeprand(1000);
        clickarea(10,164,630,234);--点击朋友圈

        msleeprand(2000); --点击移动
        clickmove();

        msleeprand(2000);
            x, y = findImage("/var/touchelf/scripts/scriptfile/images/dz66.bmp"); -- 在全屏范围找到第一个路径为"/mnt/sdcar/a.bmp"的图片, 将其左上角坐标保存到变量x和y中
            if x ~= -1 and y ~= -1 then            -- 如果找到了
                touchDown(0, x, y);                -- 点击那个点
                touchUp(0);
            end  
    end
--点赞
    function dianzan()
        filelike();
        msleeprand(3000);--点赞
            x, y = findImageFuzzy("/var/touchelf/scripts/scriptfile/images/XX.bmp",0x4c5154); 
             if x ~= -1 and y ~= -1 then            
                 touchDown(0, x+98, y+40);          -- 点击那个点
                 touchUp(0);
                 -- notifyMessage("msleeprand",3000);
             end  
        msleeprand(2000);
        btnlefttop();
    end
--评论
    function plinfo()
        filelike();
          msleeprand(3000);--评论
            x, y = findImageFuzzy("/var/touchelf/scripts/scriptfile/images/PP.bmp",0x4c5154); 
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
                    "哈哈哈！",
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

    info=runparame();
    if info==nil or info=='' then
        notifyMessage('没有得到指令',2000);
        filesend();
    end

    fphoparame=getparamecom(info,'mustt_fphoto');
    if fphoparame==nil or fphoparame=='' then
        notifyMessage('没有得到指令参数',2000);
        filesend();
    end

    msleeprand(1000);
    clickarea(346,1050,480,1128);--点击发现
    
    msleeprand(1000);   
    clickarea(10,164,630,234);--点击朋友圈

    msleeprand(800);
    clickrand(589,83);--点击右上角
 
    zdl();  --知道了

    msleeprand(500);
    clickarea(6,940,632,1014);--从手机相册选择

    ysmsleepaddnmb('回',4,53,131,112,1);
    click(62,82);--点击返回

    msleeprand(2000); --点击相册
    if fphoparame=='1' then      
        clickarea(6,130,630,235)
    end

    if fphoparame=='2' then      
        clickarea(6,245,630,350)
    end

    if fphoparame=='3' then      
        clickarea(6,360,630,468)
    end

    if fphoparame=='4' then      
        clickarea(6,475,630,580)
    end

    if fphoparame=='5' then      
        clickarea(6,590,630,698)
    end

    if fphoparame=='6' then      
        clickarea(6,706,630,810)
    end

    if fphoparame=='7' then      
        clickarea(6,820,630,926)
    end

    if fphoparame =='8' then      
        clickarea(6,936,630,1040)
    end

    msleeprand(1500); --点击移动
    clickmovedom();

    msleeprand(1000);

        tp=math.random(1, 9);--随机点击图片数量
        for i=1,tp do
            st=(math.random(0, 10000)%4)*160-25;
            if st<160 then
                st=160;
            end
            dt=(math.random(0,10000)%6)*154-125;
            if dt<154 then
                dt=154;
            end
            click(st,dt);
        end


    msleeprand(2000);
    clickarea(520,1070,618,1108);--选好图片点击完成

    msleeprand(1000);
    clickarea(35,155,263,184);--点击进入输入框

    msleeprand(1000);
    signpyq=string.gsub(getcir(),' ','');--去除空格
    if signpyq==0 then
        notifyMessage('数据库里的朋友圈语录已用完',2000);
        os.exit();
    end    

    if signpyq==nil or signpyq=='' then
        notifyMessage('网络已断开!无法得到数据',2000);
    else
        inputText(signpyq);
    end

     -- msleeprand(1500);
     --    a = {"666", 
     --        "哇", 
     --        "好像很厉害的样子",
     --        "长知识了",
     --        "32个赞",
     --        "我差点信了",
     --        "开鲁咯！",
     --        "上线5黑，赶紧的",
     --    }
     --    a_num=math.random(1,#a);
     --    inputText(a[a_num]);


    msleeprand(2000);
    clickarea(554,62,622,98); --点击发送  

    msleeprand(3000);
    btnlefttop();--点击坐上角返回


    end


    --头像设置
    function friendmi()

    info=runparame();
    if info==nil or info=='' then
        notifyMessage('没有得到指令',2000);
        friendmi();
    end

    aphoparame=getparamecom(info,'mustt_aphoto');
    if aphoparame==nil or aphoparame=='' then
        notifyMessage('没有得到指令参数',2000);
        friendmi();
    end


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

        msleeprand(3000); --点击相册
        if aphoparame=='1' then      
            clickarea(6,130,630,286)
        end

        if aphoparame=='2' then      
            clickarea(6,296,630,450)
        end

        if aphoparame=='3' then      
            clickarea(6,460,630,616)
        end

        if aphoparame=='4' then      
            clickarea(6,626,630,780)
        end

        if aphoparame=='5' then      
            clickarea(6,790,630,950)
        end

        if afphoparame=='6' then      
            clickarea(6,950,630,1120)
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
        btnlefttop();--点击左上角返回
    end

    --设置朋友圈照片
    function friend()

    info=runparame();
    if info==nil or info=='' then
        notifyMessage('没有得到指令',2000);
        friend();
    end

    afphoparame=getparamecom(info,'mustt_afphoto');
    if afphoparame==nil or afphoparame=='' then
        notifyMessage('没有得到指令参数',2000);
        friend();
    end

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


        msleeprand(3000); --点击相册
        if afphoparame=='1' then      
            clickarea(6,130,630,286)
        end

        if afphoparame=='2' then      
            clickarea(6,296,630,450)
        end

        if afphoparame=='3' then      
            clickarea(6,460,630,616)
        end

        if afphoparame=='4' then      
            clickarea(6,626,630,780)
        end

        if afphoparame=='5' then      
            clickarea(6,790,630,950)
        end

        if afphoparame=='6' then      
            clickarea(6,950,630,1120)
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
    msleeprand(1000);
    clickarea(510,1046,624,1124);--点击我
    msleeprand(1000);
    clickarea(10,170,630,320);--点击头部信息
    msleeprand(1000);
    clickarea(6,894,632,992);--点击个性签名

    msleeprand(1000);
    clickrand(632,310);--点击进入输入框
    msleeprand(2000);
    str="\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b";

    msleeprand(2000);
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
        signstr=string.gsub(getsiing(),' ','');--去除空格
        if signstr==0 then
            notifyMessage('数据库里个性签名语录已用完',2000);
            os.exit();
        end    

        if signstr==nil or signstr=='' then
            notifyMessage('网络已断开!无法得到数据',2000);
        else
            inputText(str..signstr);
        end

        

        msleeprand(2000);
        clickarea(550,62,622,100); --点击完成

        msleeprand(1000);
        btnlefttop();--点击坐上角返回

    end




    -- --添加通讯录
    -- function address() 
    --     str="\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b";

    --     for i=1,3 do
    --         msleeprand(2000);
    --         clickrand(590,80); --点击+号添加
    --         msleeprand(2000);
    --         clickrand(140,484);--点击添加电话

    --         msleeprand(2000);
    --         clickrand(275,485);--点击进入输入框
       
        
    --     -- notifyMessage('adsad');          
    --         mobile=friendmobile();
    --         notifyMessage(mobile,2000); 
    --         inputText(str..mobile);

    --         msleeprand(3000);
    --         clickrand(590,86);--点击完成

    --         msleeprand(3000);
    --         clickrand(120,80);--点击所有联系人

    --     end

    -- end

function frinedinfo(addparame)
    friendtext=addparame;
    if string.len(friendtext)>0 then--是否自定义申请增加微信信息     
        msleeprand(1000);
        str="\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b";
        inputText(str..friendtext);
        msleeprand(1000);
    end 
    friendvt=textlocal(205,55,499,114);
    if string.match(friendvt,'朋友')=='朋友' then

    end

    btnrighttop();--发送信息
    msleeprand(3000);
end

function address()  --添加通讯录
        info=runparame();        
        if info==nil or info=='' then
            notifyMessage('没有得到指令',2000);
            address();
        end
        addparame=getparamecom(info,'mustt_adtext');
        if addparame==nil or addparame=='' then
            addparame='';
        end
        for i=1,5 do
            msleeprand(2000);               
            tc=addfriend(addparame);         
            if tc==0 then
                break;
            end
        end
end

--指定添加某人
function addressone()
       info=runparame();        
        if info==nil or info=='' then
            notifyMessage('没有得到指令',2000);
            address();
        end
        addparame=getparamecom(info,'mustt_grname');
        if addparame==nil or addparame=='' then
            addparame='';
        end   

        msleeprand(1000);
        clickarea(26,152,535,187);--点击搜索框
        msleeprand(1000);
        seachfrinedcodeone(addparame);       

end


--增加朋友
function addfriend(addparame)
    clickarea(190,1050,306,1128);--点击通讯录
    msleeprand(1000);
    clickarea(26,152,535,187);--点击搜索框
    msleeprand(1000);
    m=seachfrinedcode(addparame);    
    if m==0 then
        return 0;
    else
        return 1;
    end
end

--搜索朋友
function seachfrinedcode(addparame)
    friendsex = '关闭';
    clickrand(296,79);
    str="\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b";
    local mobile=friendmobile();
    if mobile==0 or mobile==nil then
        notifyMessage('没有手机号码',1000);   
        return;
    end 
    mobile=string.sub(mobile,1,11);
    inputText(str..mobile);


    msleeprand(1000);
    clickarea(29,211,608,311);--搜索
    msleeprand(2000);
    
    myjg=textlocal(136,397,472,467);

    if string.match(myjg,'无结果')=='无结果' then     
        msleeprand(1000);
        seachfrinedcode(addparame);
        return 1;
    end


    msgfr=textlocal(89,470,557,683);    

    if string.match(msgfr,'失败')=='失败' then
        
        if string.match(msgfr,'过于')=='过于' then
            clickrand(320,653);
            msleeprand(1000);
            btnrighttop();--取消
            msleeprand(2000);
            btnlefttop();--返回
            return 0;
        end
        clickrand(320,653);
        msleeprand(1000);
        seachfrinedcode(addparame);
        return 1;
        --btnrighttop();--取消
        --msleeprand(2000);
    end

    findtext=textlocal(121,388,515,475);
    if string.match(findtext,'田')=='田' then
        notifyMessage('没有找着');
        seachfrinedcode(addparame);
    end 

    local ifv = seachcolorreturn(0xf37e7d,169,173,635,316); 
    if ifv==1 and friendsex=='女' then
            seachcolor(0x06bf04,6,394,637,1037);--增加到通讯录 按颜色查找通讯录
           -- clickrand(374,734);--
            msleeprand(1500);
            frinedinfo(addparame);
    end

    if ifv==0 and friendsex=='男' then
            seachcolor(0x06bf04,6,394,637,1037);--增加到通讯录 按颜色查找通讯录
           -- clickrand(374,734);--
            msleeprand(1500);
            frinedinfo(addparame);
    end

    if friendsex=='关闭' then
            seachcolor(0x06bf04,6,394,637,1037);--增加到通讯录 按颜色查找通讯录
           -- clickrand(374,734);--
            msleeprand(1500);
            frinedinfo(addparame);
    end
    
    btnlefttop();--返回
    msleeprand(1000);

    btnrighttop();--取消
    msleeprand(1000);

    btnlefttop();--返回
    return 1;
    --seachfrinedcode();
end

--搜索朋友
function seachfrinedcodeone(mobileone)
    friendsex = '关闭';
    clickrand(296,79);
    str="\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b";
    local mobile=mobileone;
    if mobile==0 or mobile==nil then
        notifyMessage('没有手机号码',1000);   
        return;
    end 
    mobile=string.sub(mobile,1,11);
    inputText(str..mobile);


    msleeprand(1000);
    clickarea(29,211,608,311);--搜索
    msleeprand(2000);
    
    myjg=textlocal(136,397,472,467);

    if string.match(myjg,'无结果')=='无结果' then     
        msleeprand(1000);
        seachfrinedcode(mobileone);
        return 1;
    end


    msgfr=textlocal(89,470,557,683);    

    if string.match(msgfr,'失败')=='失败' then
        
        if string.match(msgfr,'过于')=='过于' then
            clickrand(320,653);
            msleeprand(1000);
            btnrighttop();--取消
            msleeprand(2000);
            btnlefttop();--返回
            return 0;
        end
        clickrand(320,653);
        msleeprand(1000);
        seachfrinedcode(mobileone);
        return 1;
        --btnrighttop();--取消
        --msleeprand(2000);
    end

    findtext=textlocal(121,388,515,475);
    if string.match(findtext,'田')=='田' then
        notifyMessage('没有找着');
        seachfrinedcode(mobileone);
    end 

    local ifv = seachcolorreturn(0xf37e7d,169,173,635,316); 
    if ifv==1 and friendsex=='女' then
            seachcolor(0x06bf04,6,394,637,1037);--增加到通讯录 按颜色查找通讯录
           -- clickrand(374,734);--
            msleeprand(1500);
            frinedinfo(mobileone);
    end

    if ifv==0 and friendsex=='男' then
            seachcolor(0x06bf04,6,394,637,1037);--增加到通讯录 按颜色查找通讯录
           -- clickrand(374,734);--
            msleeprand(1500);
            frinedinfo(mobileone);
    end

    if friendsex=='关闭' then
            seachcolor(0x06bf04,6,394,637,1037);--增加到通讯录 按颜色查找通讯录
           -- clickrand(374,734);--
            msleeprand(1500);
            frinedinfo(mobileone);
    end
    
    btnlefttop();--返回
    msleeprand(1000);

    btnrighttop();--取消
    msleeprand(1000);

    btnlefttop();--返回
    return 1;
    --seachfrinedcode();
end

 --修改名字
    function finame()
        msleeprand(2000);
        clickarea(510,1046,624,1124);--点击我
        msleeprand(2000);
        clickarea(10,170,630,320);--点击头部信息
        msleeprand(2000);
        clickarea(6,324,630,404);--点击个人信息下的名字

        msleeprand(2000);
        str="\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b";
        inputText(str);--删除键

        msleeprand(3000);

        wxn=getweixiname();

        inputText(wxn);

        msleeprand(2000);
        clickarea(490,1058,624,1120); --点击完成

        msleeprand(2000);
        btnlefttop();--点击坐上角返回
    end


 --修改性别
    function sexb()
        info=runparame();        
        if info==nil or info=='' then
            notifyMessage('没有得到指令',2000);
            sexb();
        end

        sexparame=getparamecom(info,'mustt_sex');
        if sexparame==nil or sexparame=='' then
            notifyMessage('没有得到指令参数',2000);
            sexb();
        end

        msleeprand(2000);
        clickarea(510,1046,624,1124);--点击我
        msleeprand(2000);
        clickarea(10,170,630,320);--点击头部信息
        msleeprand(2000);
        clickarea(6,720,632,796);--点击性别

        msleeprand(2000);
        sexfun(sexparame);--更改性别

        msleeprand(2000);
        btnlefttop();--点击坐上角返回
    end

    --更改性别
    function sexfun(parame)        
        if parame=='1' then
            clickarea(6,164,630,234);
            return;
        else
            clickarea(6,250,630,324);
        end
    end


    --绑定邮箱
    function emailvfun()
        rotateScreen(0);
        msleeprand(2000);
        clickarea(510,1046,624,1124)--点击我
        msleeprand(2000);
        clickarea(10,808,630,880)--点击设置

        msleeprand(1523);
        clickarea(6,160,629,235)--点击帐号与安全
        -- notifyMessage('asdasd',8000);
        -- os.exit();

        msleeprand(2038);
        clickarea(6,466,634,540)--点击邮箱地址


        msleeprand(1000);
        emailfunsave();
        msleeprand(5000);
        btnlefttop();
        btnlefttop();
        btnlefttop();
        btnlefttop();
    end
    --邮箱保存
    function emailfunsave()
        msleeprand(2000);
        emailinfostr=getemail();
        if emailinfostr==nil or emailinfostr=='' then 
            notifyMessage('没有找着数据',2000);
            emailfunsave();
        end 
        emailary=string.sub(emailinfostr,1,string.find(emailinfostr,',')-1);
        pwd=string.sub(emailinfostr,string.find(emailinfostr,',')+1,string.len(emailinfostr)-2);

        if emailary=='' or emailary==nil then
            notifyMessage('数据有错误',2000);
            emailfunsave();
        end        

        
                
        --emailcount=UBound(emailary);
        emainb=1;
        msleeprand(3000);
        code=textlocal(53,365,563,422);
        qtt=string.match(code,'重亲');
        if qtt=='重亲' then       
            btnrighttop();
            msleeprand(1000);
            str=("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"); 
            inputText(str..emailary);

            msleeprand(1000);
            btnrighttop();
            msleeprand(1000);
            code=textlocal(67,484,566,562); 
            msleeprand(1000);
            if string.match(code,"青")=="青" then 
                click(317,672);--点确认按钮
                msleeprand(1000);
                notifyMessage(emailary);
                email163(emailary,pwd);
                btnlefttop();
            else            
                btnlefttop();
                click(290,390);
                msleeprand(2000);            
                emailinfo(emailary,pwd);
            end

            --[[

            click(290,390);
            msleeprand(2000);
            click(317,672);--点确认按钮
            msleeprand(2000);
            wxemail=string.lower(string.sub(textlocal(7,164,604,238),1,4)); 
            local x = 1;
            for i,v in ipairs(emailary) do  
                if string.match(v,wxemail) then
                    x=2;         
                    email163(v,i);
                    return ;
                end
            end
            if x==1 then
                emailarys=txt('emails.lua');
                for i,v in ipairs(emailarys) do         
                    if string.match(v,wxemail) then
                        x=2;    
                        email163(v,i);
                        return ;
                    end
                end
            end
            if(x==1) then
                notifyMessage('没有找着对应的邮箱密码',2000);
            end
            --]]
            return;
        end
        
        msleeprand(1000);

        str=("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b"); 
        --(math.random(1,10000)%emailcount)+1
        
        inputText(str..emailary);
        msleeprand(1000);
        btnrighttop();
        msleeprand(3000);
        emailinfo(emailary,pwd);
        
    end

    --确认按钮
    function msgyesbtn()    
        click(317,629);
    end

    function emailinfo(emailary,pwd)
        code=textlocal(67,484,566,562); 
        --notifyMessage(code,5000);
        if(string.match(code,"失败")=='失败') then
            msgyesbtn();--点确认按钮
            click(446,197);--点击编辑
            msleeprand(2000);   
            click(500,200);
            emailfunsave()
        end
        
        if(string.match(code,"青")=='青') then    
            click(317,672);--点确认按钮
            --notifyMessage('请确认邮箱验证');
            msleeprand(1000);
            email163(emailary,pwd);
        end
        
        if(string.match(code,"已")=='已') then        
            msgyesbtn();--点确认按钮 
            click(446,197);--点击编辑
            msleeprand(500);
            --duyihang('/var/touchelf/scripts/luafile/email.lua','/var/touchelf/scripts/luafile/emails.lua',1);
            msleeprand(3000);   
            click(500,200);
            emailfunsave();
        end
    end
    --验证163邮箱
    function email163(emailarytow,pwd)
        msleeprand(2000);
        appRun('com.netease.mailmaster');
        msleeprand(1000);   
        goinfo();
        email163login(emailarytow,pwd);
        emailjs();
        msleeprand(5000);
        --notifyMessage('开始页面',5000);
        click(338,209);--收件箱第一个邮箱

        msleeprand(6000);
        emailreg();
     
        msleeprand(6000);
        click(322,559);--点确认
        msleeprand(6000);

        if nt==1 then
          click(80,8);--返回
          msleeprand(1000);
        end
        click(80,8);--返回
        
        
        click(80,8);--返回
        
        
        click(556,1085);--我
        
        
        click(400,677);--设置
        
        
        click(326,220);--账号
        
        
        click(326,220);--删除账号
        
        msleeprand(500)
        
        click(317,974);--删除账号

        msleeprand(1000)

        kill_app("com.netease.mailmaster"); -- 关闭163
        msleeprand(1000);
        appRun("com.tencent.xin");--打开微信
        msleeprand(700);

        msleeprand(3000);           
        --duyihang('/var/touchelf/scripts/luafile/email.lua','/var/touchelf/scripts/luafile/emails.lua',1);
        msleeprand(3000);
        --]]
    end


function emailreg()
    code=textlocal(115,262,496,309);        
    nt=0;   
    if(string.match(code,"团")=='团') then    
        click(338,326);
        msleeprand(6000);
        nt=1;
    end 
end

function loginys()
    code=textlocal(140,53,442,107); 
    if string.match(code,"牛")=='牛' then
        return;
    end
end

function emailjs()
    code=textlocal(140,53,442,107); 
    --notifyMessage(code,5000);
    if string.match(code,"牛")=='牛' then
        return;
    end
    msleeprand(2000);
end
function delS(s)
    assert(type(s)=="string")
    return s:match("^%s+(.-)%s+$")
end
    --登入163
function email163login(emailarytow,pwd)
    --[[
    if emailarytow==nil then
        return
    end
    --]]


    code=textlocal(140,53,442,107); 
    if string.match(code,"牛")=='牛' then
        return;
    end

    msleeprand(2000);   
        
    click(310,353);
    click(310,353);

    str="\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b";   
  
    --notifyMessage(emailname);
    inputText(str..emailarytow);
    msleeprand(3000);
    
    click(310,450); 
    str="\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b";   
   
    inputText(str..pwd);
    --notifyMessage(emailpwd,1000);
    msleeprand(3000);
    
    click(320,590);--登陆
    msleeprand(8000);

    loginemailjs();
    code=textlocal(140,53,442,107); 
    loginys();
    if string.match(code,"牛")=='牛' then
        return;
    end

    click(181,620);
    notifyMessage('重新登入',2000);
    email163login(emailarytow,pwd);
end
function loginemailjs()
    logincode=textlocal(235,166,547,235);   
    --notifyMessage(logincode);
    if string.match(logincode,"正")=='正' then
        msleeprand(1000);
        loginemailjs();
    end
end


function ressname() --发送名片
    info = runparame();
    if info==nil or info=='' then
        notifyMessage('没有得到指令',2000);
        ressname();
    end

    naparame=getparamecom(info,'mustt_name');
    if naparame==nil or naparame=='' then
        notifyMessage('没有得到指令参数',2000);
        ressname();
    end

    card(naparame);
end


--发送名片

function card(namestr) 
    name=fg(namestr,',');
    clickarea(190,1050,306,1128);--点击通讯录
    msleeprand(1000);
    
    click(317,173);--搜索
    mSleep(1000);
    cs=wixiname(name);
    if cs==0 then
        notifyMessage('没有找着');
        return; 
    end 
    mSleep(2000);
    btnright();--个人信息
    c=getColor(527,421);
    mSleep(1000);
    --10066329
    if c==15461355 then
        mSleep(1000);
        click(545,428)--置顶
    end


    mSleep(1000);
    clickrand(91,223)--个人头像

    mSleep(1000);
    btnright()--三个点 

    mSleep(1500);
    click(287,337);--推荐给朋友

    mSleep(500);
    click(272,326);--选中搜索人

    mSleep(1500);
    click(302,170);

    inputText(name[cs]);

    mSleep(1500);
    click(64,239);--选中搜索人


    mSleep(2000);
    clickrand(455,653);--发送
end


 --搜索人名
function wixiname(name)
    for x in ipairs(name) do
        click(286,83);
        str="\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b";
        inputText(str..name[x]);----搜索朋友
        mSleep(1000);
        fontinfo=textlocal(137,151,548,320);
        if string.match(fontinfo,'搜')~='搜' and string.match(fontinfo,'网络查')~='网络查' then
            click(298,277);--选中搜索人
            mSleep(1000);
            return x;           
        end
    end
    return 0;
end   

--微信右向角按钮
function btnright();
    clickrand(589,83);
end


--删除备份文件
    function scbf();
        appRun('com.workhard.hdfakerset');--启动配置hdFaker
        msleeprand(2000);
        clickarea(73,1053,131,1125);

        msleeprand(1000);
        click(300,770);

        msleeprand(1500);
        touchDown(0, 300, 178);
        mSleep(1500);--按住1.5秒
        touchUp(0);

        -- msleeprand(1000);  --查找绿色点
        -- x, y = findColorInRegionFuzzy(0x00b41f, 90, 4, 130, 514, 1034); -- 在区域范围找到第一个颜色为0x00b41f的点, 精确度为90%
        -- if x ~= -1 and y ~= -1 then                                      -- 如果找到了
        --     touchDown(0, x, y);                                          -- 点击那个点
        --  msleeprand(1500); --按住1.5秒
        --     touchUp(0);
        -- end

        msleeprand(1000);
        x, y = findImageInRegionFuzzy("/var/touchelf/scripts/scriptfile/images/XSC.bmp", 80, 163, 131, 298, 1034, 0x25252a); 
        if x ~= -1 and y ~= -1 then                                                           -- 如果找到了
            touchDown(0, x, y);                                                               -- 点击那个点
            touchUp(0);
        end

        msleeprand(1000);
        codesc=textlocal(91,442,544,553);--删除备份文件
        if(string.match(codesc,'分文')=='分文') then         
         clickarea(112,585,523,635);--点击确定删除
        end
    end

