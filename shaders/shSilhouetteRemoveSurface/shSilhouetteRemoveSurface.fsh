//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	vec4 Color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	if((Color.r < 0.25 && Color.g < 0.25 && Color.b < 0.25) || (Color.r > 0.75 && Color.g > 0.75 && Color.b > 0.75) ) {
	//if the color is grey
		gl_FragColor = vec4(0.0, 0.0, 0.0, 0.0);//Completamente trasparent YO!
	} else { // if not grey
		gl_FragColor = Color;
	}
}
