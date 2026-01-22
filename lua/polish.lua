-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

local original_notify = vim.notify
local last = {}

vim.notify = function(msg, level, opts)
  local key = tostring(level or "info") .. ":" .. msg
  local now = vim.loop.now()
  local window_ms = 2000

  if last[key] and (now - last[key]) < window_ms then
    return
  end

  last[key] = now
  return original_notify(msg, level, opts)
end
