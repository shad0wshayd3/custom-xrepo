package("figcone")
    set_homepage("https://github.com/kamchatka-volcano/figcone")
    set_description("Read JSON, YAML, TOML, XML or INI configuration by declaring a struct")
    set_license("MS-PL")

    add_urls("https://github.com/kamchatka-volcano/figcone.git")

    add_versions("v3.1.0", "8a668e89d354fd604dc9e7832d99c35ca518436b")

    add_configs("use_json", {description = "enable json parsing", default = false, type = "boolean"})
    add_configs("use_yaml", {description = "enable yaml parsing", default = false, type = "boolean"})
    add_configs("use_toml", {description = "enable toml parsing", default = false, type = "boolean"})
    add_configs("use_ini", {description = "enable ini parsing", default = false, type = "boolean"})
    add_configs("use_xml", {description = "enable xml parsing", default = false, type = "boolean"})
    add_configs("use_shoal", {description = "enable shoal parsing", default = false, type = "boolean"})

    add_deps("cmake")

    on_install("windows|x64", function(package)
        local configs = {}
        table.insert(configs, "-DCMAKE_BUILD_TYPE=" .. (package:debug() and "Debug" or "Release"))
        table.insert(configs, "-DBUILD_SHARED_LIBS=" .. (package:config("shared") and "ON" or "OFF"))
        table.insert(configs, "-DFIGCONE_USE_JSON=" .. (package:config("use_json") and "ON" or "OFF"))
        table.insert(configs, "-DFIGCONE_USE_YAML=" .. (package:config("use_yaml") and "ON" or "OFF"))
        table.insert(configs, "-DFIGCONE_USE_TOML=" .. (package:config("use_toml") and "ON" or "OFF"))
        table.insert(configs, "-DFIGCONE_USE_INI=" .. (package:config("use_ini") and "ON" or "OFF"))
        table.insert(configs, "-DFIGCONE_USE_XML=" .. (package:config("use_xml") and "ON" or "OFF"))
        table.insert(configs, "-DFIGCONE_USE_SHOAL=" .. (package:config("use_shoal") and "ON" or "OFF"))
        import("package.tools.cmake").install(package, configs)
    end)
