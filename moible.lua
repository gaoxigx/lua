-- 主入口
SCREEN_RESOLUTION="640x1136";
SCREEN_COLOR_BITS=32;

-- 主入口
function main()      
 
 --[[
  mSleep(1000);
  --flag = ftpGet("ftp://192.168.1.100:/a.txt", "/var/touchelf/a.txt", "user", "pass") -- 将FTP服务器192.168.1.100上路径为/a.txt的文件下载到/var/touchelf/a.txt
  local imgname="/data/upload/20170227/58b3c31c2273b.jpg"
  local path="ftp://121.40.140.16:/script"..imgname;
  local savepath="/var/touchelf/scripts/scriptfile/images/tupian"..".jpg";
  local getdata=ftpGet(path, savepath, "productconsole", "T4t8u0p1");
  if getdata then
      notifyMessage("下载成功");
  else
      notifyMessage("下载失败");
  end
  mSleep(1000);
  saveImageToAlbum(savepath);
  mSleep(1000);
  
  
  
  array = memorySearch("com.tencent.xin", true, { 0x100, 4, 0x200 })    -- 搜索过程为先搜素0x100，如果该内存地址+4的位置为0x200，则为一个有效地址
  logDebug("找到"..#array.."个地址")
  for i=1,#array do
      logDebug(string.format("第%d个地址为: 0x%x", i, array[i]))
  end
--]]
--[[
  notifyMessage("sdfds");
  mSleep(2000);
   selectimg(9,980,1,0);
--]]

  mSleep(1000); 
 local mobilecode=textlocalnmb(128,224,338,283); 
    notifyMessage(string.len(mobilecode),2000);
    if string.len(mobilecode)>6 then
        mobilecode=textlocalnmb(122,317,206,367);  
        if string.len(mobilecode)>6 then
           notifyMessage('设置异常',2000);
           return
        end  
    end 

  notifyMessage(mobilecode);
end


--根据区域查找数字
function textlocalnmb(x,y,x1,y1)
  code = localOcrText("/var/touchelf/scripts/tessdata",  -- 语言包tessdata目录在设备中的路径
                                                  "eng",  -- 语言类型为中文
                                                    x,  -- 图片左上角X坐标为100
                                                    y,  -- 图片左上角Y坐标为100
                                                    x1,  -- 图片右下角X坐标为200
                                                    y1,  -- 图片右下角Y坐标为200
                                            "0123456789"); -- 设置白名单字符串, 只识别数字
  if code == "" then
    code=0;
  end 
  return code;
end


function clickMove(x1,y1,x2,y2,n)
    local w = math.abs(x2-x1);
    local h = math.abs(y2-y1);
    touchDown(0,x1,y1);
    mSleep(50);
    if x1 < x2 then
        w1 = n; 
    else
        w1 = -n;
    end
    if y1 < y2 then
        h1 = n; 
    else
        h1 = -n;
    end
    if w >= h then
        for i = 1 , w,n do 
            x1 = x1 + w1;
            if y1 == y2 then
            else
                y1 = y1 + math.ceil(h*h1/w);
            end
            touchMove(0,x1,y1);
            mSleep(10);
        end
    else
        for i = 1 ,h,n do 
            y1 = y1 + h1;
            if x1 ==x2 then
            else
                x1 = x1 + math.ceil(w*w1/h);
            end
            touchMove(0,x1,y1);
            mSleep(10);
        end
    end
    mSleep(50);
    touchUp(0);
end

function selectimg(num,height,funnum,selecnum)  
    local count = 3;
    for i=1,4 do
        mSleep(200);
        click((count*158)+80,height); 
        count = count - 1;      
        mSleep(500);       
        local tm = 0;
        for sim = 100, 85, -1 do           --使用 for 循环不断降低精确度(建议精确度不低于50%)
            x, y = findColorInRegionFuzzy(0x373738, sim, 169, 1067, 410, 1130); 
            if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件     
                tm=1;
                break;                    --并跳出循环            
            end
        end
       
        if tm==1 then
          mSleep(500);
          click(580,62);
          mSleep(1000);
          click(46,64); 
          selecnum=selecnum+1;
          if selecnum>=num then
            break;
          end 
         end
         mSleep(1000);       
    end

    if selecnum<num then       
        funnum=funnum+1;
        selectimg(num,height-160,funnum,selecnum);
    end 
end

--根据区域查找数字
function textlocalnmb(x,y,x1,y1)
  code = localOcrText("/var/touchelf/scripts/tessdata",  -- 语言包tessdata目录在设备中的路径
                                                  "eng",  -- 语言类型为中文
                                                    x,  -- 图片左上角X坐标为100
                                                    y,  -- 图片左上角Y坐标为100
                                                    x1,  -- 图片右下角X坐标为200
                                                    y1,  -- 图片右下角Y坐标为200
                                            "0123456789"); -- 设置白名单字符串, 只识别数字
  if code == "" then
    code=0;
  end 
  return code;
end

function click(x, y)
    touchDown(0, x, y);
    mSleep(200);
    touchUp(0);
end

