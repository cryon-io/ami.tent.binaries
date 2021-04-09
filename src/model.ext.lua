local _ok, _platformPlugin = am.plugin.safe_get("platform")
if not _ok then
    log_error("Cannot determine platform!")
    return
end
local _ok, _platform = _platformPlugin.get_platform()
if not _ok then
    log_error("Cannot determine platform!")
    return
end

local _binaryUrl = nil

local _downloadLinks = {
    ["linux-x86_x64 (debian like)"] = "https://github.com/TENTOfficial/TENT/releases/download/v3.1.1/snowgem-linux-3.1.1.zip",
    ["linux-aarch64"] = "https://github.com/TENTOfficial/TENT/releases/download/v3.1.1/snowgem-linux-3.1.1.zip",
}

if _platform.OS == "unix" then
    if _platform.DISTRO:match("Debian") or _platform.DISTRO:match("Ubuntu") then
        _binaryUrl = _downloadLinks["linux-x86_x64 (debian like)"]
    end
    if _platform.PROCESSOR_TYPE:match("aarch64") then
        _binaryUrl = _downloadLinks["linux-aarch64"]
    end
end

if _binaryUrl == nil then
    log_error("Platform not supported!")
    return
end

am.app.set_model({DAEMON_URL = _binaryUrl}, {merge = true, overwrite = true})
