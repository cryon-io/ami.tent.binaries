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
    ["linux-x86_x64 (ubuntu)"] = "https://github.com/TENTOfficial/TENT/releases/download/Node/tent-linux.zip",
    ["linux-x86_x64 (debian)"] = "https://github.com/TENTOfficial/TENT/releases/download/Node/tent-blockbook.zip",
    ["linux-aarch64"] = "https://github.com/TENTOfficial/TENT/releases/download/Node/tent-linux-aarch64.zip",
}

if _platform.OS == "unix" then
    if _platform.DISTRO:match("[Uu]buntu") then
        _binaryUrl = _downloadLinks["linux-x86_x64 (ubuntu)"]
    end
    if _platform.DISTRO:match("[Dd]ebian") then
        _binaryUrl = _downloadLinks["linux-x86_x64 (debian)"]
    end
    if _platform.SYSTEM_TYPE:match("[Aa]arch64") then
        _binaryUrl = _downloadLinks["linux-aarch64"]
    end
end

if _binaryUrl == nil then
    log_error("Platform not supported!")
    return
end

am.app.set_model({DAEMON_URL = _binaryUrl}, {merge = true, overwrite = true})
