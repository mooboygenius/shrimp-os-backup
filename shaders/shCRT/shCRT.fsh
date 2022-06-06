//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 textureSize;
uniform vec2 lineDistance;
uniform float intensity;

void main()
{
	vec2 shAmount=vec2(1.0/textureSize.x, 1.0/textureSize.y);
	vec2 realPos=vec2(floor(textureSize.x*v_vTexcoord.x), floor(textureSize.y*v_vTexcoord.y));
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord);
	if (gl_FragColor.a==1.) {
		
		// blackening
		if (mod(realPos.x, lineDistance.x)==0.0 || mod(realPos.y, lineDistance.y)==0.0) {
			gl_FragColor.rgb*=(1.-intensity*.1);
		}
		
		// whitening
		if (mod(realPos.y+1., lineDistance.y)==0.0) {
			gl_FragColor.rgb*=intensity*2.;
		}
		
	}
}