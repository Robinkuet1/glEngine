#include "Window.h"

const Window& createWindow(const WindowOptions& options)
{
	if(glfwInit() != GLFW_TRUE)
	{
	}
	return {options.width, options.height};
}

void destroyWindow(const Window& window)
{
	
}