if instance_exists(MegamanX)
{
if !objControl.jump {audio_stop_sound(flusnd); global.propulsion=0 ; instance_destroy()}
if global.propulsion=2 {audio_stop_sound(flusnd); global.propulsion=0 ; instance_destroy()}

y=MegamanX.y+18

}


else {audio_stop_sound(flusnd); global.propulsion=0; instance_destroy()}
