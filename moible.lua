-- 主入口
SCREEN_RESOLUTION="640x1136";
SCREEN_COLOR_BITS=32;

-- 主入口
function main()
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
      mSleep(8000);




      --[[
      click(161,290);
      mSleep(3500);
      --]]
      local i=0;
      while true do
        --[[
          for sim = 100, 92, -1 do  
          x, y = findColorInRegionFuzzy(0xff3b30, sim, 529, 445, 627, 523); 
          if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件
            click(x,y);
            --click(184,686);--升级
            mSleep(200);
            break;   --并跳出循环
          end
        end
        clickMove(320,482,180,482,20);
        mSleep(100);
        --]]
          --for sim = 100, 92, -1 do  
        x, y = findColorInRegionFuzzy(0x71d01d, 90, 24, 259, 90, 316); 
        if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件
          
          break;   --并跳出循环
        end
        i=i+1;
        mSleep(1000);
    --end
     end
     
   
end

function findseach(i)
  local sul = false;
  if findcolor(0x1aad19,532,295+(110*i),594,329+(110*i)) then
    sul=true;
  end
  return sul;
end

function findcolor(color,x,y,x1,y1)
  local t = false;
  x, y = findColorInRegion(color, x, y,x1,y1); -- 在区域[(100,100)(200,200)]范围找到第一个颜色为0x0000ff的点, 将其坐标保存到变量x和y中
  if x ~= -1 and y ~= -1 then                             -- 如果找到了
      t=true;
  end
  return t;
end

--修改通讯录
function addressbook()

  appRun("feibiao.WriteAddressbook");

  mSleep(1000);
  --[[
  click(322,106);
  inputText("\b\b\b\b\b");
  --inputText("20");
 
 --]]

  click(548,289);
  inputText("\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b");
  mSleep(200);
  inputText("http://g.7gu.cn/book.php?");
  

  mSleep(1000);
  click(293,475);
  mSleep(2000);
end

function cffriend()
    mSleep(600);
    if fuzzycolor(0x46b6ef,180,180,634,230)==false then
      return;
     -- notifyMessage("性别: 女");
    end

    mSleep(200);
    click(205,541);

    mSleep(100);
    click(209,633);

    mSleep(200);
    click(205,755);

    mSleep(800);
    code = localOcrText("/var/touchelf/scripts/tessdata",  -- 语言包tessdata目录在设备中的路径
                                                    "eng",  -- 语言类型为中文
                                                      421,  -- 图片左上角X坐标为100
                                                      176,  -- 图片左上角Y坐标为100
                                                      633,  -- 图片右下角X坐标为200
                                                      230,  -- 图片右下角Y坐标为200
                                             "0123456789"); -- 设置白名单字符串, 只识别数字
   
    if code ~= "" then
        --goto ("识别失败");
        shhttp(code);--手机上传成功;
        --notifyMessage(string.format("识别成功: %s", code),5000);
    end
    mSleep(200);
    click(26,83);
end

function shhttp(mobile)
  local sul = false;
  
  if string.len(mobile)>0 then
      string.gsub(mobile," ","");
      httpGet("http://g.7gu.cn/index.php?g=api&m=Mobilebook&a=phonecheck&mobile="..mobile);
      sul=true;
  end

  return sul;
end

function fuzzycolor(color,x,y,x1,y1)
  local sul = false;
  for sim = 100, 98, -1 do           --使用 for 循环不断降低精确度(建议精确度不低于50%)
      x, y = findColorInRegionFuzzy(color, sim, x, y, x1, y1); 
      if x ~= -1 and y ~= -1 then   --如果在指定区域找到某点符合条件
          sul= true;
          break;                    --并跳出循环
      end
  end
  return sul;
end

function click(x, y)
    touchDown(0, x, y);
    mSleep(200);
    touchUp(0);
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
