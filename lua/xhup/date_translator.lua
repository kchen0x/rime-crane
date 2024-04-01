local function translator(input, seg)
	if (input == "orq") then
	  local d = os.date("*t")
	  yield(Candidate("date", seg.start, seg._end, d.year .. "年" .. d.month .. "月" .. d.day .. "日", ""))
	  yield(Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), ""))
	end
  end
  return translator