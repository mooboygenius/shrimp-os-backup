//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec4 limit;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.rgba=vec4(max(gl_FragColor.r, limit.r/255.0), max(gl_FragColor.g, limit.g/255.0), max(gl_FragColor.b, limit.b/255.0), max(gl_FragColor.a, limit.a/255.0));
}
