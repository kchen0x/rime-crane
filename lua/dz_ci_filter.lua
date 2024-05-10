--    https://github.com/rime/librime/issues/248#issuecomment-468924677
--    單字和字詞切換
local function filter(input, env)
  b = env.engine.context:get_option("dz_ci")
  for cand in input:iter() do
    if (not b or utf8.len(cand.text) == 1) then
      yield(cand)
    end
  end
end

return filter
