//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float time;
uniform float textureWidth;
uniform float textureHeight;
uniform vec2 waveIntensity;
const float speed = 0.015;
const float xFrequency = 10.0;
const float xSize = 1.0;
const float yFrequency = 20.0;
const float ySize = 0.75;

void main()
{
	float horizontalWave = cos(time * speed + (v_vTexcoord.y * textureHeight)) * waveIntensity.x * (xSize / textureWidth);
	float verticalWave = sin(time * speed + (v_vTexcoord.x * textureWidth)) * waveIntensity.y * (ySize / textureHeight);
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, vec2(v_vTexcoord.x + horizontalWave, v_vTexcoord.y + verticalWave));
}