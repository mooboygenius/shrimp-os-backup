//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec4 ditherColor;
uniform vec2 textureSize;
uniform float radius;
const float maxRadius=100.0;

void main()
{
	float m=4.0;
	vec2 shAmount=vec2(m, m)/textureSize;
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	if (gl_FragColor.a==0.0) {
		for (float xx=-maxRadius; xx<=maxRadius; xx+=1.0) {
			if (xx<-radius) continue;
			for (float yy=-maxRadius; yy<=maxRadius; yy+=1.0) {
				if (yy<-radius) continue;
				vec2 position=vec2(v_vTexcoord.x+shAmount.x*xx, v_vTexcoord.y+shAmount.y*yy);
				if (position.x==clamp(position.x, 0.0, 1.0) && position.y==clamp(position.y, 0.0, 1.0)) {
					if (texture2D(gm_BaseTexture, position).a==1.0) {
						vec2 realPosition=vec2(v_vTexcoord.x*textureSize.x, v_vTexcoord.y*textureSize.y);
						vec2 modPosition=vec2(floor(mod(realPosition.x, 2.0)), floor(mod(realPosition.y, 2.0)));
						if ((modPosition.x!=modPosition.y) && (modPosition.x==0.0 || modPosition.y==0.0)) {
							gl_FragColor.rgba=ditherColor;
							break;
						}
					}
				}
				if (yy>=radius) break;
			}
			if (xx>=radius) break;
		}
	}
}