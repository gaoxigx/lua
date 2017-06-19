--注册所有方法程序
jgtime=0;
function registerrcb(parame)
	os.execute("su mobile -c uicache");
    --微信摇一摇
    if string.match(gsinfo,'1030')=="1030" then
         local ytime=getparamecom(gsinfo,'mustt_ytime');
         if getweixiyaotime(ytime)=="1" or getweixiyaotime(ytime)==1 then
            weixiyaoyao();
        end
    end
    --摇一摇--
   
    ------更换IP---------
    if parame=='101' then   flymodel(); end --执行飞形模式
    if parame=='102' then   vpn(gsinfo);    end --执行vpn
    
    ------更换IP---------

    -------备份信息-------- 
    if parame=='121' then   reloaddata();   end --hd-一键刷机   
    if parame=='122' then   backuphd(); end --hd-一键备份
    if parame=='123' then   dhfakei();  end --hd-一键刷机
    if parame=='124' then   znt();  end --hd-一键备份   
    if parame=='126' then   nzthuifu(); end 
    -------备份信息---------

    ---------进入接口-------
    if parame=='131' then   return registerweixi(getDeviceID());end --执行微信注册
    if parame=='132' then   return loginweixi();   end --执行微信登入
    if parame=='136' then    return loginawxwx(); end --awz登入
    if parame=='137' then 	return awxnexwx(); end --awz恢复下一条数据
    if parame=='138' then   return awzsetpwd();end--修改密码
    ---------进入接口-------

    ---------必须操事情-------
    if parame=='1003' then   dianzan(); end --点赞
    if parame=='1004' then   plinfo(); end --评论
    
    if parame=='1005' then   filesend(); end --发送定时朋友圈
    if parame=='1041' then   sendfind(); end --发送固定朋友圈
    if parame=='1042' then   delphoto(); end --删除照片
    if parame=='1043' then   sendonefind()  end --发送一个固定的朋友圈

    if parame=='1006' then   friendmi(); end --头像设置
    if parame=='1007' then   friend(); end --设置朋友圈照片
    if parame=='1008' then   runame(); end --个性签名
    if parame=='9009' then   address(); end --添加通讯录
    if parame=='1021' then   addressone(); end --指定添加某人
    if parame=='1010' then   emailvfun(); end --绑定邮箱  
    if parame=='1011' then   finame(); end --修改名字
    if parame=='1012' then   sexb(); end --修改性别
    if parame=='1013' then   ressname(); end --发送名片
    if parame=='1020' then   datectionmobile(); end --检查手机号码是否存在    

    if parame=='1030' then registerweixicheck(getDeviceID()); end --微信通讯录添加好友
    if parame=='1031' then wxtxlfriend(); end --微信通讯录添加好友
    if parame=='1032' then addressapp(); end --通用修改GPRS地址

    --摇一摇--

    ---------必须操事情-------

    ---------探探进入接口-------
    if parame=='2001' then    opentt();end --开打探探
    if parame=='2002' then    openlover();end --探探关注喜欢
    if parame=='2003' then    closett();end --关闭探探
    if parame=='2004' then ttGPRS(); end--探探GRP系统
    ---------探探进入接口-------

    ---------陌陌-------------
    if parame=='2901' then    mmlogin();end --微信登入陌陌
    if parame=='2902' then    sendnew();end --发送陌陌动态
    if parame=='3001' then    findmm();end --陌陌关注如果有聊天即时回复一句话
    if parame=='3002' then    mmGPRS();end --陌陌修改GPRS地理位置
    if parame=='3003' then    mobileGPRS();end --陌陌站街打开刷新
    ---------陌陌-------------

    --定时关机--
    if parame=="4001" then haltinfo();end--定时关机
    --定时关机

    ---------合拍-------------
    if parame=='5001' then    hepai();end --合拍关注如果有聊天即时回复一句话
    ---------合拍-------------
    
    return 1;
    
end


