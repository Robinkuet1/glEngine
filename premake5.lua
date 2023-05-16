workspace "glEngine"
    architecture "x64"

    configurations {
        "Debug",
        "Release"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
IncludeDir = {}

IncludeDir["GLFW"] = "vendor/glfw/include"

include "vendor/glfw"

project "glEngine"
    location "glEngine"
    kind "StaticLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-tmp/" .. outputdir .. "/%{prj.name}")

    files {
        "%{prj.name}/src/**.c",
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp",
        "%{prj.name}/src/**.hpp"
    }

    includedirs {
        "%{prj.name}/src",
        "%{IncludeDir.GLFW}",
        "%{prj.name}/vendor/include"
    }

    links {
        "opengl32.lib",
        "GLFW",
    }

    cppdialect "C++20"
    staticruntime "On"
    systemversion "latest"

    filter "configurations:Debug"
        defines "DEBUG"
		staticruntime "off"
        runtime "Debug"
        symbols "On"
    filter "configurations:Release"
        defines "RELEASE"
		staticruntime "off"
        runtime "Release"
        optimize "On"

project "glEditor"
    location "glEditor"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-tmp/" .. outputdir .. "/%{prj.name}")

    files {
        "%{prj.name}/src/**.c",
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp",
        "%{prj.name}/src/**.hpp"
    }

    includedirs {
        "glEngine/src",
        "%{IncludeDir.GLFW}",
    }

    links {
        "opengl32.lib",
        "GLFW",
        "glEngine"
    }

    cppdialect "C++20"
    staticruntime "On"
    systemversion "latest"

    filter "configurations:Debug"
        defines "ENGINE_DEBUG"
        staticruntime "off"
        runtime "Debug"
        symbols "On"
    filter "configurations:Release"
        defines "ENGINE_RELEASE"
        staticruntime "off"
        runtime "Release"
        optimize "On"