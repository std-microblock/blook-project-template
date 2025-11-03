set_project("example-project")

set_languages("c++2b")
set_warnings("all")
add_rules("plugin.compile_commands.autoupdate", {outputdir = "build"})
add_rules("mode.releasedbg")

includes("deps/blook.lua")

add_requires("blook")

target("example-project")
    set_kind("shared")
    add_files("src/**.cc")
    set_encodings("utf-8")
    add_packages("blook")
    add_defines("NOMINMAX", "WIN32_LEAN_AND_MEAN")

    add_syslinks("psapi", "ws2_32", "user32", "advapi32", "shell32", "shlwapi", "iphlpapi", "crypt32", "secur32")
    add_linkdirs("lib")

    -- bin2c
    -- add_rules("utils.bin2c", {extensions = {".js"}})
    -- add_files("scripts/launcher.js")
