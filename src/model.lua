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
    _binaryUrl = "https://github.com/Snowgem/Snowgem/releases/download/v3000457-20190909/snowgem-debian9.11.0-3000457-20190926.zip"
elseif _platform.DISTRO:match("Ubuntu") and _platform.DISTRO:match("Ubuntu 20.04") then 
    _binaryUrl = "https://github.com/Snowgem/Snowgem/releases/download/v3000457-20190909/snowgem-ubuntu18.04-3000457-20190926.zip"
elseif _platform.DISTRO:match("Ubuntu") and _platform.DISTRO:match("Ubuntu 18.04") then 
    _binaryUrl = "https://github.com/Snowgem/Snowgem/releases/download/v3000457-20190909/snowgem-ubuntu18.04-3000457-20190926.zip"
elseif _platform.DISTRO:match("Ubuntu") and _platform.DISTRO:match("Ubuntu 16.04") then 
    _binaryUrl = "https://github.com/Snowgem/Snowgem/releases/download/v3000457-20190909/snowgem-ubuntu16.04-3000457-20190926.zip"
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