shader_type canvas_item;

uniform int dist = 2;
uniform vec4 color: source_color = vec4(0.0, 0.0, 0.0, 0.5);
uniform float angle: hint_range(0.0, 360.0) = 90.0;

varying vec2 main_uv;
varying vec2 shadow_uv;

void vertex() {

	vec2 uv = TEXTURE_PIXEL_SIZE * float(dist * 2);

	vec2 uv_half = uv * 0.5;
	vec2 uv_dist = uv + 1.0;

	vec2 shadow_direction = (vec4(cos(radians(angle)), sin(radians(angle)), 0.0, 1.0) * MODEL_MATRIX).xy;

	VERTEX *= uv_dist;

	main_uv = UV * uv_dist - uv_half;
	shadow_uv = main_uv - shadow_direction * uv_half;
}

void fragment() {

	// sample colors for shadow
	float shadow_amt = texture(TEXTURE, shadow_uv).a
		* step(-1.0, -shadow_uv.x)
		* step(-1.0, -shadow_uv.y)
		* step(0.0, shadow_uv.x)
		* step(0.0, shadow_uv.y);

	// shadow color
	COLOR = color * shadow_amt;

	// sample main colors on top of shadow
	vec4 main_color = texture(TEXTURE, main_uv)
		* step(-1.0, -main_uv.x)
		* step(-1.0, -main_uv.y)
		* step(0.0, main_uv.x)
		* step(0.0, main_uv.y);

	// need to make area where main and shadow overlap black for next step
	COLOR = mix(COLOR, vec4(0.0, 0.0, 0.0, 1.0), main_color.a);

	// add main color on top of blackened area
	COLOR += main_color * main_color.a;
}
