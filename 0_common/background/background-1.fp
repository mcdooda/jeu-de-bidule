varying mediump vec4 position;
varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform lowp vec4 color;
uniform lowp vec4 shader_scale;
uniform lowp vec4 time;

const float PI = 3.1415926535897932384626433832795;

void main()
{
	const lowp float width = 100.0;
	const lowp float speed = 100.0;
	float a = sin(mod(var_texcoord0.x * shader_scale.x - var_texcoord0.y * shader_scale.y - time.x * speed, width) / width * PI * 2.0) * 0.5 + 1.0;

	lowp vec4 color = vec4(color.xyz, 1.0);
	lowp vec4 dark_color = vec4(color.xyz * 0.9, 1.0);

	gl_FragColor = mix(color, dark_color, a);
}
