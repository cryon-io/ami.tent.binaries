local _ok, _platformPlugin = am.plugin.get("platform")
if not _ok then 
    log_error("Cannot determine platform!")
    return
end
local _ok, _platform = _platformPlugin.get_platform()
if not _ok then 
    log_error("Cannot determine platform!")
    return
end

local _binaryUrl = ""
if _platform.DISTRO:match("Debian") ~= nil then 
    _binaryUrl = "https://github.com/TENTOfficial/TENT/releases/download/v3.1.1/snowgem-linux-3.1.1.zip"
elseif _platform.DISTRO:match("Ubuntu") then
    _binaryUrl = "https://github.com/TENTOfficial/TENT/releases/download/v3.1.1/snowgem-linux-3.1.1.zip"
else
    log_error("Platform not supported!")
    return
end

am.app.set_model({ DAEMON_URL = _binaryUrl }, { merge = true, overwrite = true })