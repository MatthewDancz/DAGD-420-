#define PROCESSING_TEXTURE_SHADER

// properties set automatically by processing;
uniform sampler2D texture;
uniform vec2 texOffset;

// properties set by vertex shader;
varying vec4 uvs;

// This function is executed for every pixel;
// The purpose of this is to set gl_FragColor for the GPU;
void main()
{
    vec4 color = texture2D(texture, uvs.xy); // Swizelling uvs.xyzw, uvs.rgba, uvs.stpq
    gl_FragColor = color;
}
