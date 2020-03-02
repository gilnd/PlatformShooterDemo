//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	//get the original color
	vec4 originalColor = texture2D( gm_BaseTexture, v_vTexcoord );
	
	vec4 outputColor = vec4(255.0, 255.0, 255.0, originalColor.a); 
    //Output color
	gl_FragColor = outputColor;
}
