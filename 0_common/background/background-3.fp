varying mediump vec4 position;
varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform lowp vec4 color;
uniform lowp vec4 shader_scale;
uniform lowp vec4 time;

const float PI = 3.1415926535897932384626433832795; // environ

void main()
{
	const float width = 50.0;
	const float period = 10.0;
	
	vec2 pos = vec2(var_texcoord0.x * shader_scale.x, var_texcoord0.y * shader_scale.y + var_texcoord0.x * shader_scale.x);
	float a = sin((var_texcoord0.x + time.x) / PI * period) * 0.5 + 0.5 + shader_scale.w;

	lowp vec4 color = vec4(color.xyz, 1.0);
	lowp vec4 dark_color = vec4(color.xyz * 0.9, 1.0);

	if (mod(pos.y, width) / width < a)
	{
		if (mod(pos.y, width * 2.0) / width < 1.0)
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
		if (mod(pos.y, width * 2.0) / width < 1.0)
		{
			gl_FragColor = dark_color;
		}
		else
		{
			gl_FragColor = color;
		}
	}
}
