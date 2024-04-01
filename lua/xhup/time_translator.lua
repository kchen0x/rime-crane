local weekday = { "日", "一", "二", "三", "四", "五", "六" }

local function translator(input, seg)
  if (input == "ouj") then
    yield(Candidate("time", seg.start, seg._end, os.date("%H:%M") .. " 周" .. weekday[os.date("*t").wday], ""))
    yield(Candidate("time", seg.start, seg._end, os.date("%H点%M分"), ""))
  end
end

return translator
