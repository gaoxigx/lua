--注册所有方法程序
function registerrcb(parame)
    ------更换IP---------
    if parame=='101' then   flymodel(); end --执行飞形模式
    if parame=='102' then   vpn(gsinfo);    end --执行vpn
    
    ------更换IP---------

    -------备份信息-------- 
    if parame=='121' then   reloaddata();   end --hd-一键刷机   
    if parame=='122' then   backuphd(); end --hd-一键备份
    if parame=='123' then   dhfakei();  end --hd-一键刷机
    if parame=='124' then   znt();  end --hd-一键备份   
    -------备份信息---------

    ---------进入接口-------
    if parame=='131' then   registerweixi(getDeviceID());end --执行微信注册
    if parame=='132' then   return loginweixi();   end --执行微信登入
    ---------进入接口-------

    ---------必须操事情-------
    if parame=='1003' then   dianzan(); end --点赞
    if parame=='1004' then   plinfo(); end --评论
    if parame=='1005' then   filesend(); end --发送朋友圈
    if parame=='1006' then   friendmi(); end --头像设置
    if parame=='1007' then   friend(); end --设置朋友圈照片
    if parame=='1008' then   runame(); end --个性签名
    if parame=='1009' then   address(); end --添加通讯录
    if parame=='1010' then   emailvfun(); end --绑定邮箱  
    if parame=='1011' then   finame(); end --修改名字
    if parame=='1012' then   sexb(); end --修改性别
    if parame=='1013' then   ressname(); end --发送名片
   
    if parame=='1020' then   datectionmobile(); end --检查手机号码是否存在
    return 1;
    ---------必须操事情-------
end