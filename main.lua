local skynet = require "skynet"
local snax = require "snax"
local sprotoloader = require "sprotoloader"

local is_windows = package.config:sub(1,1) == '\\'

skynet.start(function()
	skynet.error("Skynet RDC Server Start")
	skynet.uniqueservice("protoloader")
	if not is_windows and not skynet.getenv "daemon" then
		local console = skynet.newservice("console")
	end
	skynet.newservice("debug_console",8000)
	skynet.newservice("cfg")
	local starter = snax.uniqueservice("stream", {})
	skynet.newservice("adminweb", "0.0.0.0", 8181)
	skynet.exit()
end)
