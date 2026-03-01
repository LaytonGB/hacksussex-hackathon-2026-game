shader_type canvas_item;

uniform float threshold : hint_range(0.0, 0.2) = 0.05;

void fragment() {
    vec4 color = texture(TEXTURE, UV);

    // If the color is close to black, fade it out
    if (length(color.rgb) < threshold) {
        color.a = 0.0;
    }

    COLOR = color;
}