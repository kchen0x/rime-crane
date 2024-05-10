--[[
    shortcut_processor.lua
    这个文件包含了处理快捷键的逻辑，通过Lua脚本实现间接实现了部分直通车的功能。
    它首先引入了common模块，然后定义了安装路径和用户路径。
    它还定义了一个名为command的表，该表包含了不同的Windows/macOS命令，这些命令可以通过快捷键触发。
    每个命令都是一个表，包含了执行该命令所需的所有参数。
]]
local common = require("xhup/common")

local install_path = (rime_api ~= nil and rime_api.get_shared_data_dir ~= nil
  and {rime_api:get_shared_data_dir()}
  or {'%ProgramFiles(x86)%\\Rime\\weasel-0.15.0'})[1]
local user_path = (rime_api ~= nil and rime_api.get_user_data_dir ~= nil
  and {rime_api:get_user_data_dir()}
  or {'%appdata%\\Rime'})[1]

local command = {
  ["Windows"] = {
    ["oav"] = {'start "" "' .. install_path .. '"'},
    ["ocm"] = {'start "" "cmd.exe"', 'start "" "wt.exe"'},
    ["odn"] = {'start "" "::{20D04FE0-3AEA-1069-A2D8-08002B30309D}"'},
    ["oec"] = {'start "" "excel.exe"'},
    ["ogj"] = {'start "" "' .. user_path .. '"'},
    ["oht"] = {'start "" "mspaint.exe"'},
    ["ojs"] = {'start "" "calc.exe"'},
    ["owd"] = {'start "" "winword.exe"'},
  },
  ["Darwin"] = {
    ["oav"] = {'open "' .. install_path .. '"'},
    ["ocm"] = {'open -a Terminal.app'},
    ["odn"] = {'open -a Finder.app'},
    ["oec"] = {'open -a "Microsoft Excel.app"'},
    ["ogj"] = {'open "' .. user_path .. '"'},
    ["ojs"] = {'open -a Calculator.app'},
    ["owd"] = {'open -a "Microsoft Word.app"'},
  },
  ["iOS"] = {},
}
local option = {
  ["ojf"] = {
    ["name"] = "simplification",
    ["type"] = "toggle",
  },
}

--[[

]]
local function restore_saved_options(key, env)
  local inp = env.engine.context.input
  if string.len(inp) <= 1 and env.switcher ~= nil then
    local swt = env.switcher
    local ctx = env.engine.context
    local conf = swt.user_config
  end
end

local function processor(key, env)
  restore_saved_options(key, env)
  local context = env.engine.context
  if key:release() or key:alt() then return common.kNoop end
  local sys = common.detect_os()
  local index = common.select_index(env, key)
  if index < 0 then return common.kNoop end
  if command[sys][context.input] ~= nil then
    local cmd = command[sys][context.input][index+1]
    if cmd ~= nil then
      os.execute(cmd)
      context:clear()
      return common.kAccepted
    end
  elseif option[context.input] ~= nil then
    local opt_name = option[context.input]["name"]
    local opt_type = option[context.input]["type"]
    local opt_value = nil
    if opt_type == "list" then
      opt_value = option[context.input]["value"][index+1]
    elseif opt_type == "toggle" then
      if index == 0 then
        opt_value = not context:get_option(opt_name)
      end
    end
    if opt_value ~= nil then
      common.apply_switch(env, opt_name, opt_value)
      context:clear()
      return common.kAccepted
    end
  end

  local comp = context.composition
  if comp.empty == nil then return common.kNoop end
  if comp:empty() then return common.kNoop end
  local seg = comp:back()
  if seg == nil or seg.menu == nil or seg:has_tag("raw") then return common.kNoop end
  local page_size = env.engine.schema.page_size
  if index >= page_size then return common.kNoop end
  local page_start = math.floor(seg.selected_index / page_size) * page_size
  local cand = seg:get_candidate_at(page_start + index)
  if cand == nil then return common.kNoop end
  if cand.type:sub(1,1) ~= "$" then return common.kNoop end
  local new_input = string.match(cand.type, "%$(%w+)")
  if new_input == nil or new_input == "" then return common.kNoop end
  context.input = new_input
  return common.kAccepted
end

local function init(env)
  if Switcher == nil then return end
  env.switcher = Switcher(env.engine)
end

return { init = init, func = processor }
