draw_self();

// author credit
draw_set_font(font_cached(mmx_font, "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!?<>:;.,",true, 1));
draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_text(__view_get( e__VW.XView, 0 )+VIEWSIZE_X/2, __view_get( e__VW.YView, 0 )+226, "BY FAYCRAX");
draw_set_halign(fa_left);
