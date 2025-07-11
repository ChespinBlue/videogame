shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;
// Define the desired low resolution for the pixelation effect
uniform float pixel_width = 340.0;
uniform float pixel_height = 256.0;

void fragment() {
    // Get the current screen pixel's UV coordinates (0.0 to 1.0)
    vec2 uv = SCREEN_UV;

    // Calculate the "quantized" UV coordinates
    // This rounds the UV to the nearest "pixel" in our virtual low resolution grid
    vec2 quantized_uv = floor(uv * vec2(pixel_width, pixel_height)) / vec2(pixel_width, pixel_height);

    // Sample the texture (or screen) using the quantized UV
    // If applying to the entire screen, use SCREEN_TEXTURE.
    // If applying to a specific sprite's texture, use TEXTURE.
    COLOR = texture(SCREEN_TEXTURE, quantized_uv); // Or texture(TEXTURE, quantized_uv) for a sprite
}
