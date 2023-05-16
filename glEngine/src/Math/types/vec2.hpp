#pragma once


struct vec2
{
	union
	{
		float x;
		float width;
	};

	union
	{
		float y;
		float height;
	};
};
