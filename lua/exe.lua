--[[
Source:https://github.com/hchunhui/librime-lua/issues/35
通过特定命令启动外部程序。

※将"- lua_processor@exe_processor" 放在 engine/processors 里，并位于默认 selector 之前
※rime.lua中 增加"exe_processor = require("exe")"


--]] local function generic_open(dest)
  if os.execute('start "" ' .. dest) then
    return true
  elseif os.execute('open ' .. dest) then
    return true
  elseif os.execute('xdg-open ' .. dest) then
    return true
  end
end

local function exe(key, env)
  local engine = env.engine
  local context = engine.context
  local kNoop = 2
  if (context.input == "/huma" or context.input == "/zhmn") then
    generic_open("https://tiger-code.com")
    context:clear()
  elseif (context.input == "/baidu" or context.input == "/bddu" or context.input == "/fuxl") then
    generic_open("https://www.baidu.com")
  elseif (context.input == "/biying" or context.input == "/bing" or context.input == "/biyk" or context.input == "/htxk") then
    generic_open("https://cn.bing.com")
  elseif (context.input == "/guge" or context.input == "/google" or context.input == "/hgzz") then
    generic_open("https://www.google.com")
    context:clear()
  elseif (context.input == "/wangpan" or context.input == "/whpj" or context.input == "/mbia") then
    generic_open("http://huma.ysepan.com")
    context:clear()
  elseif (context.input == "/genda" or context.input == "/gfda" or context.input == "/piua" or context.input == "/muyi" or context.input == "/emon" ) then
    generic_open("https://typer.owenyang.top")
    context:clear()
  elseif (context.input == "/zitong" or context.input == "/zits" or context.input == "/whib") then
    generic_open("https://zi.tools")
    context:clear()
  elseif (context.input == "/yedian" or context.input == "/yedm" or context.input == "/dnih") then
    generic_open("http://www.yedict.com")
    context:clear()
  end
  return kNoop
end

return exe
-- return { func = exe }    --与"return exe"等效。
