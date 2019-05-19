varying mediump vec4 position;
varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform lowp vec4 color;
uniform highp vec4 shader_scale;
uniform highp vec4 time;

const float PI = 3.1415926535897932384626433832795;

void main()
{
	highp vec2 pos = vec2(var_texcoord0.x * shader_scale.x, var_texcoord0.y * shader_scale.y);
	
	const float width = 20.0;
	const float period = 20.0;
	const float speed = 20.0;
	highp float a = sin(pos.x / period + time.x * speed / period) * 0.5 + 0.5;

	lowp vec4 color = vec4(color.xyz, 1.0);
	lowp vec4 dark_color = vec4(color.xyz * 0.9, 1.0);

	if (mod(pos.y + time.x * speed, width) / width < a)
	{
		if (mod(pos.y + time.x * speed, width * 2.0) < width)
		{
			gl_FragColor = color;
		}
		else
		{
			gl_FragColor = dark_color;
		}
	}
	else
	{
		if (mod(pos.y + time.x * speed, width * 2.0) < width)
		{
			gl_FragColor = dark_color;
		}
		else
		{
			gl_FragColor = color;
		}
	}
}
