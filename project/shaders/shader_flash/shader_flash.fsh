//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor = vec4(v_vColour.rgb, texture2D( gm_BaseTexture, v_vTexcoord ).a);
	//gl_FragColor.rbg = vec3(1,1,1);
}