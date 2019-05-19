varying mediump vec4 position;
varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform lowp vec4 color;
uniform highp vec4 shader_scale;
uniform highp vec4 time;

void main()
{
	const float width = 70.0;
	const float speed = -100.0;
	highp float a = mod(var_texcoord0.x * shader_scale.x - time.x * speed, width) / width;
	if (a < 0.5)
	{
		gl_FragColor = vec4(color.xyz, 1.0);
	}
	else
	{
		gl_FragColor = vec4(color.xyz * 0.9, 1.0);
	}
}
