#define PROCESSING_TEXTURE_SHADER

// properties set automatically by processing;
uniform sampler2D texture;
uniform vec2 texOffset;

// properties set by vertex shader;
varying vec4 vertTexCoord;
varying vec4 vertColor;

// This function is executed for every pixel;
// The purpose of this is to set gl_FragColor for the GPU;
void main()
{
    vec4 color = texture2D(texture, vertTexCoord.xy);
    
    color.rgb = vec3(1.0) - color.rgb; // Reverses the colors of the image.
    
    color.rgb = vec3((color.r + color.g + color.b) / 3); // Makes the colors of the image grey.
    
    color.rgb -= vec3(.5);
    color.rgb *= 10.0;
    color.rgb += vec3(.5);
    
    color.rgb = clamp(color.rgb, 0.0, 1.0);
    
    gl_FragColor = color;
}
