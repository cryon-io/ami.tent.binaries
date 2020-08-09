if type(APP.model) ~= "table" then
    APP.model = {}
end

local _ok, _platformPlugin = safe_load_plugin("platform")
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
    _binaryUrl = "https://github.com/Snowgem/Snowgem/releases/download/v3000458/snowgem-ubuntu-3000458-20200807.zip"
elseif _platform.DISTRO:match("Ubuntu") then
    _binaryUrl = "https://github.com/Snowgem/Snowgem/releases/download/v3000458/snowgem-ubuntu-3000458-20200807.zip"
else 
    log_error("Platform not supported!")
    return
end

APP.model = eliUtil.merge_tables(
    APP.model,
    {
        DAEMON_URL = _binaryUrl
    }
)