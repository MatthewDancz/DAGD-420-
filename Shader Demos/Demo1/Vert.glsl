#define PROCESSING_TEXTURE_SHADER

// properties automatically set by Processing for
// a PROCESSING_TEXTURE_SHADER;
uniform mat4 transform;
uniform mat4 texMatrix;
attribute vec4 vertex;
attribute vec4 color;
attribute vec2 texCoord;

// Properties that we set for the frag shader;
varying vec4 uvs;

// This function runs for each vertex
// it's primary purpose is to set gl_Position;
void main()
{
    //set UVs for frag shader;
    uvs = texMatrix * vec4(texCoord, 1.0, 1.0);
    
    //set vertex screen position for GPU;
    gl_Position = transform * vertex;
}