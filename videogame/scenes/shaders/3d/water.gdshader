shader_type spatial;
//render_mode unshaded;

float round_to_dec(float num, float digit){
	return round(num * pow(10.0, digit)) / pow(10.0, digit);
}

float random (vec2 uv) {
    return fract(sin(dot(uv.xy,
        vec2(12.9898,78.233))) * 43758.5453123);
}

//varying vec3 world_position;

varying float prev_pos;
void vertex() {
	//world_position = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
	//float ints = 4.0;
	//VERTEX.x += random(vec2(world_position.x,world_position.y))*ints;
	//VERTEX.y += random(vec2(world_position.y,world_position.z))*ints;s
	//VERTEX.z += random(vec2(world_position.z,world_position.x))*ints;0.5

	float random_pos = random(vec2(UV*round_to_dec(TIME,0.1)));
	VERTEX.y = mix(VERTEX.y, random_pos, 0.06);
	prev_pos = VERTEX.y;
}

void fragment() {
	ALBEDO = vec3(0.0,0.05,0.03);
	ALPHA = 0.9;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
