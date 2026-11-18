// can=0 after confirming: blocks moving the cursor or confirming again during the fade
if can=0 exit

var rows = [170, 186, 202]; // GAME START, GAME LOAD, OPTION MODE
var n = array_length(rows);

if ctrl.down_pressed {global.selecter = global.selecter mod n + 1; sound_effect=snd_select}
if ctrl.up_pressed {global.selecter = (global.selecter + n - 2) mod n + 1; sound_effect=snd_select}
y = rows[global.selecter - 1]

if ctrl.pause_pressed or ctrl.shot_pressed or ctrl.jump_pressed
{
can=0
sound_effect=armorputsnd
if global.selecter=1 {sound_out=1; global.nextrooms2=testingroom}
else if global.selecter=2 {sound_out=1; global.nextrooms2=vsflameburst}
else {global.nextrooms2=OptionsMenu}
global.nextrooms=NowLoading
instance_create_depth(x,y,depth,TransitionBlack)
}
