local common = require("xhup/common")

local labels = {
  ["Windows"] = {
    ["oav"] = {"[安装目录]"},
    ["ocm"] = {"[命令提示符]", "[Windows Terminal]"},
    ["odn"] = {"[文件管理器]"},
    ["oec"] = {"[Excel]"},
    ["oei"] = {"[启用二重简码]", "[关闭]"},
    ["ogj"] = {"[Rime 用户目录]"},
    ["oht"] = {"[画图]"},
    ["ojf"] = {"[简繁切换]"},
    ["ojs"] = {"[计算器]"},
    ["owd"] = {"[Word]"},
  },
  ["Darwin"] = {
    ["oav"] = {"[Rime 程序目录]"},
    ["ocm"] = {"[终端]"},
    ["odn"] = {"[访达]"},
    ["oec"] = {"[Excel]"},
    ["oei"] = {"[启用二重简码]", "[关闭]"},
    ["ogj"] = {"[Rime 用户目录]"},
    ["ojf"] = {"[简繁切换]"},
    ["ojs"] = {"[计算器]"},
    ["owd"] = {"[Word]"},
  },
  ["iOS"] = {},
}

local function translator(input, seg)
  local sys = common.detect_os()
  local lbls = labels[sys][input]
  if lbls == nil then return end
  for i, lbl in pairs(lbls) do
    yield(Candidate("shortcut", seg.start, seg._end, lbl, ""))
  end
end

return translator
