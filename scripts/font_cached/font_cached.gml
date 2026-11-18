/// @description Same as font_add_sprite_ext, but creates each font only once.
/// Draw events used to call font_add_sprite_ext every frame, leaking a new font per frame.
function font_cached(_spr, _map, _prop, _sep) {
	static cache = {};
	var key = string(_spr) + "|" + _map + "|" + string(_prop) + "|" + string(_sep);
	if !variable_struct_exists(cache, key) {cache[$ key] = font_add_sprite_ext(_spr, _map, _prop, _sep)}
	return cache[$ key];
}
