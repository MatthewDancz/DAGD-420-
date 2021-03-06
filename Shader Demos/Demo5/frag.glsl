#define PROCESSING_TEXTURE_SHADER

// properties set automatically by processing;
uniform sampler2D texture;
uniform vec2 texOffset;

// Custom properties passed in by ME;
//uniform sampler2D texture2;
//uniform float time;
uniform float aspect;

// properties set by vertex shader;
varying vec4 vertTexCoord;
varying vec4 vertColor;

// This function is executed for every pixel;
// The purpose of this is to set gl_FragColor for the GPU;
void main()
{
    vec2 uv = vertTexCoord.xy;
    
    vec4 color1 = texture2D(texture, uv);  
    
    uv.x *= aspect;
    
    float distance = distance(uv, vec2(.5, .5));
    /*
    if (uv.y > .5)
    {
        color1 = vec4(0, 0, 1, 1);
    }
    */
    
    if (distance < .2)
    {
        color1 = vec4(0, 0, 1, 1);
    }

    //vec4 color2 = texture2D(texture2, vertTexCoord.xy);
    
    
    
    //color1.rgb = vec3(1.0) - color1.rgb; // Reverses the colors of the image.
    
    //color1.rgb = vec3((color1.r + color1.g + color1.b) / 3); // Makes the colors of the image grey.
    
    //color1.rgb -= vec3(.5);
    //color1.rgb *= 10.0;
    //color1.rgb += vec3(.5);
    
    //color1.rgb = clamp(color1.rgb, 0.0, 1.0);
    
    gl_FragColor = color1; //Multiplication is darker, adding is bright.
}
