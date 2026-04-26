shader_type canvas_item;

uniform int dist = 2;
uniform vec4 color: source_color = vec4(0.0, 0.0, 0.0, 0.5);

varying vec2 main_uv;

void vertex() {

	vec2 uv = TEXTURE_PIXEL_SIZE * float(dist * 2);

	vec2 uv_half = uv * 0.5;
	vec2 uv_dist = uv + 1.0;

	VERTEX *= uv_dist;

	main_uv = UV * uv_dist - uv_half;
}

void fragment() {

	// sample colors for shadow
	float shadow_amt = texture(TEXTURE, main_uv).a
		* step(-1.0, -main_uv.x)
		* step(-1.0, -main_uv.y)
		* step(0.0, main_uv.x)
		* step(0.0, main_uv.y);

	// shadow color
	COLOR = color * shadow_amt;
}
