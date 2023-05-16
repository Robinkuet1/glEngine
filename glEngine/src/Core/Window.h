#pragma once
#include "defines.h"
#include "GLFW/glfw3.h"

struct WindowOptions
{
	u32 width = 0U;
	u32 height = 0U;
	const char* title = "";
};

struct Window
{
	u32 width = 0U;
	u32 height = 0U;
	GLFWwindow* handle;
};

const Window& createWindow(const WindowOptions& options);
void destroyWindow(const Window& window);

