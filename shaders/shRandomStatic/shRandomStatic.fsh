//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float time;
uniform float intensity;

float random (vec2 st, float ti) {
    return fract(sin(dot(vec2(st.x + ti, st.y + ti), vec2(12.9898 + ti * 0.00001, 78.233 + ti * 0.00001))) * 43758.5453123);
}

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	vec2 pos = gl_FragCoord.xy;
	float rnd = (random(pos, time) - 0.5) * intensity;
	gl_FragColor.r += rnd;
	gl_FragColor.g += rnd;
	gl_FragColor.b += rnd;
	
}
