--[[
    common.lua
    这个文件包含了一些常用的函数，例如操作系统检测（detect_os）和状态检查（status）。
    detect_os函数用于检测当前运行的操作系统类型。
    status函数用于检查环境变量的状态。
]]

--- detect_os 函数用于检测当前运行的操作系统类型。
-- @return 返回一个字符串，表示当前运行的操作系统类型。
local cached_os = nil

local function detect_os()
    if cached_os ~= nil then
        return cached_os
    end
    local sys = ""
    local sep = package.config:sub(1, 1)
    if sep == "\\" then
        sys = "Windows"
    else
        local h = os.getenv("HOME")
        if h and string.find(h, "/private/var/mobile/") ~= nil then
            sys = "iOS"
        else
            local p = io.open("/proc/version", "r")
            if p ~= nil then
                io.close(p)
                sys = "Linux"
            else
                local pipe = io.popen("uname -s 2>/dev/null")
                if pipe ~= nil then
                    sys = pipe:read("*l") or "Others"
                    pipe:close()
                else
                    sys = "Others"
                end
            end
        end
    end
    cached_os = sys
    return sys
end

-- status 函数用于检查环境变量的状态。
-- @param env 环境变量。
-- @return 返回一个表，表示环境变量的状态。
local function status(env)
    local context = env.engine.context
    local stat = {}
    local composition = context.composition
    stat.always = true
    stat.composing = context:is_composing()
    stat.empty = not stat.composing
    stat.has_menu = context:has_menu()
    if composition.empty ~= nil then
        stat.paging = not composition:empty() and composition:back():has_tag("paging")
    end
    return stat
end

local function get_option_bool(env, opt)
    return env.engine.schema.config:get_bool(opt)
end

local function get_option_int(env, opt)
    return env.engine.schema.config:get_int(opt)
end

local function get_option_double(env, opt)
    return env.engine.schema.config:get_double(opt)
end

local function get_option_string(env, opt)
    return env.engine.schema.config:get_string(opt)
end

local function select_index(env, key)
    local ch = key.keycode
    local index = -1
    local select_keys = env.engine.schema.select_keys
    if select_keys ~= nil and select_keys ~= "" and not key.ctrl() and ch >= 0x20 and ch < 0x7f then
        local pos = string.find(select_keys, string.char(ch))
        if pos ~= nil then
            index = pos
        end
    elseif ch >= 0x30 and ch <= 0x39 then
        index = (ch - 0x30 + 9) % 10
    elseif ch >= 0xffb0 and ch < 0xffb9 then
        index = (ch - 0xffb0 + 9) % 10
    elseif ch == 0x20 then
        index = 0
    end
    return index
end

local function apply_switch(env, keyword, target_state)
    local switcher = env.switcher
    if switcher == nil then
        return
    end
    local ctx = env.engine.context
    local user_config = switcher.user_config
    ctx:set_option(keyword, target_state)
    if switcher:is_auto_save(keyword) and user_config ~= nil then
        user_config:set_bool("var/option/" .. keyword, target_state)
    end
end

return {
    detect_os = detect_os,
    status = status,
    rime_option = {
        get_bool = get_option_bool,
        get_int = get_option_int,
        get_double = get_option_double,
        get_string = get_option_string
    },
    select_index = select_index,
    apply_switch = apply_switch,
    kRejected = 0,
    kAccepted = 1,
    kNoop = 2
}
