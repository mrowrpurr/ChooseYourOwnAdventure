add_rules("mode.debug", "mode.release")

set_languages("c++23")

add_repositories("SkyrimScripting https://github.com/SkyrimScripting/Packages.git")

add_requires(
    "skyrim-commonlib-ae",
    "skyrim-commonlib-se",
    "skyrim-commonlib-vr"
)

mod_info = {
    name = "Choose Your Own Adventure",
    version = "0.0.1",
    author = "Mrowr Purr",
    email = "mrowr.purr@gmail.com"
}

local mods_folders = os.getenv("SKYRIM_MODS_FOLDERS")
if mods_folders then
    mod_info.mods_folders = mods_folders
end

target("SKSE Plugin - AE")
    set_basename("ChooseYourOwnAdventure")
    add_files("plugin.cpp")
    add_packages("skyrim-commonlib-ae")
    add_rules("@skyrim-commonlib-ae/plugin", {
        mod_name = "Choose Your Own Adventure (AE)",
        mods_folders = mod_info.mods_folders or "",
        name = mod_info.name,
        version = mod_info.version,
        author = mod_info.author,
        email = mod_info.email
    })

target("SKSE Plugin - SE")
    set_basename("ChooseYourOwnAdventure-1597")
    add_files("plugin.cpp")
    add_packages("skyrim-commonlib-se")
    add_rules("@skyrim-commonlib-se/plugin", {
        mod_name = "Choose Your Own Adventure (SE)",
        mods_folders = mod_info.mods_folders or "",
        name = mod_info.name,
        version = mod_info.version,
        author = mod_info.author,
        email = mod_info.email
    })

target("SKSE Plugin - VR")
    set_basename("ChooseYourOwnAdventure-VR")
    add_files("plugin.cpp")
    add_packages("skyrim-commonlib-vr")
    add_rules("@skyrim-commonlib-vr/plugin", {
        mod_name = "Choose Your Own Adventure (VR)",
        mods_folders = mod_info.mods_folders or "",
        name = mod_info.name,
        version = mod_info.version,
        author = mod_info.author,
        email = mod_info.email
    })
