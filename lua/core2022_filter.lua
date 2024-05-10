local charsets = {
  { first = 0x4e00, last = 0x9fff }, -- 基本区
  { first = 0x3400, last = 0x4dbf }, -- 扩A
  { first = 0x20000, last = 0x2a6df }, -- 扩B
  { first = 0x2a700, last = 0x2b73f }, -- 扩C
  { first = 0x2b740, last = 0x2b81f }, -- 扩D
  { first = 0x2b820, last = 0x2ceaf }, -- 扩E
  { first = 0x2ceb0, last = 0x2ebef }, -- 扩F
  { first = 0x30000, last = 0x3134f }, -- 扩G
  { first = 0x31350, last = 0x323af }, -- 扩H
  { first = 0x2EBF0, last = 0x2EE5D }, -- 扩I
  { first = 0x31c0, last = 0x31ef }, -- 笔画
  { first = 0x2e80, last = 0x2eff }, -- 部首扩展
  { first = 0x2f00, last = 0x2fdf }, -- 康熙部首
  { first = 0xf900, last = 0xfadf }, -- 兼容
  { first = 0x2f800, last = 0x2fa1f }, -- 兼补
  { first = 0x2ff0, last = 0x2fff }, -- 汉字结构
  { first = 0x3100, last = 0x312f }, -- 注音
  { first = 0x31a0, last = 0x31bf }, -- 注音扩展
  -- -- 以上为汉字部分
  -- { first = 0x3040, last = 0x309f }, -- 平假名 
  -- { first = 0x30a0, last = 0x30ff }, -- 片假名
  -- { first = 0x31f0, last = 0x31ff }, -- 假名扩展
  -- { first = 0x1b000, last = 0x1b0ff }, -- 假名补充
  -- { first = 0x1b100, last = 0x1b12f }, -- 假名扩展A
  -- { first = 0x1b130, last = 0x1b16f }, -- 小型日文假名扩展
  -- -- 韩文
  -- { first = 0x1100, last = 0x11ff }, -- 韩文字母
  -- { first = 0x3130, last = 0x318f }, -- 韩文兼容字母
  -- { first = 0xa960, last = 0xa97f }, -- 韩文字母扩展-A
  -- { first = 0xd7b0, last = 0xd7ff }, -- 韩文字母扩展-B
  -- { first = 0xac00, last = 0xd7af }, -- 韩文音节
  -- CJK
  -- { first = 0xfe30, last = 0xfe4f }, -- 中日韩兼容形式
  -- { first = 0x3200, last = 0x32ff }, -- 中日韩弧圈字符
  -- { first = 0x3000, last = 0x303f }, -- 中日韩符号和标点
  -- 私用区
  { first = 0xe000, last = 0xf8ff }, -- 私用区
  { first = 0xf0000, last = 0xffff }, -- 私用区补充A
  { first = 0x100000, last = 0x10ffff }, -- 私用区补充B
}

local function is_cjk(code)
  for i, charset in ipairs(charsets) do
    if ((code >= charset.first) and (code <= charset.last)) then
      return true
    end
  end
  return false
end

local function should_yield(text, option, coredb)
  local should_yield = true
  if option then
    for i in utf8.codes(text) do
      local code = utf8.codepoint(text, i)
      if is_cjk(code) then
        charset = coredb:lookup(utf8.char(code))
        if charset == "" then
          should_yield = false
          break
        end
      end
    end
  end
  return should_yield
end

local function filter(input, env)
  on = env.engine.context:get_option("extended_char")
  for cand in input:iter() do
    if should_yield(cand.text, on, env.coredb) then
      yield(cand)
    end
  end
end

local function init(env)
  -- 当此组件被载入时，打开反查库，并存入 `coredb` 中
  env.coredb = ReverseDb("build/core2022.reverse.bin")
end

return { init = init, func = filter }
