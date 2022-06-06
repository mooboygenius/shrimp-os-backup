//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	float average = (gl_FragColor.r + gl_FragColor.g + gl_FragColor.b) / 3.0;
	gl_FragColor.rgb = vec3(average, average, average);
}
