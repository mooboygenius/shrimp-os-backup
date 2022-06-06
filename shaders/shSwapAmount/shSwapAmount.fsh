varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 swapColor;
uniform vec3 swapBaseColor;
uniform float swapAmount;
uniform float swapThreshold;

void main() {
	gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	float fragColorCombined = (gl_FragColor.r + gl_FragColor.g + gl_FragColor.b);
	float swapBaseColorCombined = (swapBaseColor.r + swapBaseColor.g + swapBaseColor.b);
	if ((abs(fragColorCombined - swapBaseColorCombined) / 3.0) <= swapThreshold) {
		gl_FragColor.r = mix(gl_FragColor.r, swapColor.r, swapAmount);
		gl_FragColor.g = mix(gl_FragColor.g, swapColor.g, swapAmount);
		gl_FragColor.b = mix(gl_FragColor.b, swapColor.b, swapAmount);
	}
}