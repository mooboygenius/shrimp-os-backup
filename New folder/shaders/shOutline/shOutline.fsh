//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 textureSize;
uniform vec4 outlineColor;

void main()
{
	vec2 shAmount=vec2(1.0, 1.0)/textureSize;
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	if (gl_FragColor.a==0.0) {
		gl_FragColor.rgba=vec4(outlineColor.r, outlineColor.g, outlineColor.b, 0.0);
		for (float xx=-1.0; xx<=1.0; xx+=1.0) {
			for (float yy=-1.0; yy<=1.0; yy+=1.0) {
				if (!(xx!=0.0 && yy!=0.0)) {
					vec2 position=vec2(v_vTexcoord.x+shAmount.x*xx, v_vTexcoord.y+shAmount.y*yy);
					if (texture2D(gm_BaseTexture, position).a>0.0) {
						gl_FragColor.a=outlineColor.a;
						break;
					}
				}
			}
		}
	}
}