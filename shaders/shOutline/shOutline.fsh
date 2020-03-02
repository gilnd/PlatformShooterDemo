//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 size;
uniform float thick;
uniform vec3 oColor;
uniform float accuracy;
uniform float tol;
uniform vec4 uvs;

const float rad_circle = 6.28319;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    bool outline = false;
 
    for(float i=1.0; i<=thick; i++){
        for(float d=0.0; d<rad_circle; d+=rad_circle/accuracy){
			vec2 check_pos = v_vTexcoord + i*vec2(cos(d)*size.x, -sin(d)*size.y);
            vec4 datPixel =  v_vColour * texture2D( gm_BaseTexture, check_pos);
            
			bool out_bound = check_pos.x < uvs.r || check_pos.y < uvs.g || check_pos.x > uvs.b || check_pos.y > uvs.a; 
			
            if (datPixel.a>tol && gl_FragColor.a<=tol && !out_bound){
                outline = true;
                break;
            }
        }
		if (outline) break;
    }
    
    if (outline) gl_FragColor = vec4(oColor.r, oColor.g, oColor.b, 1.0);
}



