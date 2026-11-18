keyused[0]=global.op_keyboard_up
keyused[1]=global.op_keyboard_down
keyused[2]=global.op_keyboard_left
keyused[3]=global.op_keyboard_right
keyused[4]=global.op_keyboard_shot
keyused[5]=global.op_keyboard_jump
keyused[6]=global.op_keyboard_dash
keyused[7]=global.op_keyboard_special
keyused[8]=global.op_keyboard_changes
keyused[9]=global.op_keyboard_pause
keyused[10]=global.op_keyboard_selec

gamepadused[4]=global.op_gamepad_shot
gamepadused[5]=global.op_gamepad_jump
gamepadused[6]=global.op_gamepad_dash
gamepadused[7]=global.op_gamepad_special
gamepadused[8]=global.op_gamepad_changes
gamepadused[9]=global.op_gamepad_pause
gamepadused[10]=global.op_gamepad_selec

dinputused[4]=global.op_dinput_shot
dinputused[5]=global.op_dinput_jump
dinputused[6]=global.op_dinput_dash
dinputused[7]=global.op_dinput_special
dinputused[8]=global.op_dinput_changes
dinputused[9]=global.op_dinput_pause
dinputused[10]=global.op_dinput_selec

if locked=0
{
if ctrl.up_pressed && selecter>0 {selecter--; sound_effect=snd_select} 
if ctrl.down_pressed && selecter<12 {selecter++; sound_effect=snd_select} 
}

if locked=1
{
    if gamepad_is_connected(0)
    {
        if check_joybtn(0)
        {
            e=0
            repeat(10)
            {
            if check_joybtn(0)=gamepadused[e] {locked=0; nope=1}
            e+=1
            }
            if nope=0
            {
            if selecter=0 {}
            if selecter=1 {}
            if selecter=2 {}
            if selecter=3 {}
            if selecter=4 {global.op_gamepad_shot=check_joybtn(0)}
            if selecter=5 {global.op_gamepad_jump=check_joybtn(0)}
            if selecter=6 {global.op_gamepad_dash=check_joybtn(0)}
            if selecter=7 {global.op_gamepad_special=check_joybtn(0)}
            if selecter=8 {global.op_gamepad_changes=check_joybtn(0)}
            if selecter=9 {global.op_gamepad_pause=check_joybtn(0)}
            if selecter=10 {global.op_gamepad_selec=check_joybtn(0)}
            alarm[0]=5
            locked=2
            save_options()
        }
        else {nope=0; alarm[0]=5; locked=2}
        }
        
    }
    else if joystick_exists(0)
    {
        if check_joybtn(0)
        {
            e=0
            repeat(10)
            {
            if check_joybtn(0)=dinputused[e] {locked=0; nope=1}
            e+=1
            }
            if nope=0
            {
            if selecter=0 {}
            if selecter=1 {}
            if selecter=2 {}
            if selecter=3 {}
            if selecter=4 {global.op_dinput_shot=check_joybtn(0)}
            if selecter=5 {global.op_dinput_jump=check_joybtn(0)}
            if selecter=6 {global.op_dinput_dash=check_joybtn(0)}
            if selecter=7 {global.op_dinput_special=check_joybtn(0)}
            if selecter=8 {global.op_dinput_changes=check_joybtn(0)}
            if selecter=9 {global.op_dinput_pause=check_joybtn(0)}
            if selecter=10 {global.op_dinput_selec=check_joybtn(0)}
            alarm[0]=5
            locked=2
            save_options()
        }
        else {nope=0; alarm[0]=5; locked=2}
        }
    }
    else
    {
        if keyboard_check_pressed(vk_anykey)
        {
            // same order as keyused[]
            var names = ["up","down","left","right","shot","jump","dash","special","changes","pause","selec"];
            if selecter<=10
            {
            var target = "op_keyboard_" + names[selecter];
            var old = variable_global_get(target);
            // key already taken: swap, the other action gets this action's old key (nothing left unbound)
            for (var k=0; k<=10; k++) {if keyused[k]=keyboard_key {variable_global_set("op_keyboard_" + names[k], old)}}
            variable_global_set(target, keyboard_key);
            save_options()
            }
            alarm[0]=5
            locked=2
        }
    }
}

if ctrl.pause_released
{
    if locked=0
    {
        if gamepad_is_connected(0)
        {
            if selecter=0 {} 
            else if selecter=1 {} 
            else if selecter=2 {} 
            else if selecter=3 {}
            else if selecter=11 
            {
                if file_exists("config.ini") 
                {
                ini_open("config.ini")
                ini_section_delete("Control")
                ini_close()
                load_options()
                }
            } 
            else if selecter=12
            {
                save_options()
                sound_effect=armorputsnd
                global.nextrooms2=MainMenu
                global.nextrooms=NowLoading
                instance_create_depth(x,y,depth,TransitionBlack)
            } 
            else {locked=1}
        }
        else if joystick_exists(0)
        {
        if selecter=0 {} 
        else if selecter=1 {} 
        else if selecter=2 {} 
        else if selecter=3 {} 
        else if selecter=11 
        {
        if file_exists("config.ini") 
            {
            ini_open("config.ini")
            ini_section_delete("Control")
            ini_close()
            load_options()
            }
        }
        else if selecter=12
        {
            save_options()
            sound_effect=armorputsnd
            global.nextrooms2=MainMenu
            global.nextrooms=NowLoading
            instance_create_depth(x,y,depth,TransitionBlack)
        } 
        else {locked=1}
        }
        else 
        {
        if selecter=11 
        {
        if file_exists("config.ini") 
            {
            ini_open("config.ini")
            ini_section_delete("Control")
            ini_close()
            load_options()
            }
        }
        else if selecter=12
        {
            save_options()
            sound_effect=armorputsnd
            global.nextrooms2=MainMenu
            global.nextrooms=NowLoading
            instance_create_depth(x,y,depth,TransitionBlack)
        } 
        else {locked=1}
        }
    }
}


