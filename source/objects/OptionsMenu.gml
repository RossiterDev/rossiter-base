#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sel=0

xdraw=global.width/2-276
ydraw=132
xsep=550
ysep=21

numoptions=ds_list_size(global.optlist)
for (i=0;i<numoptions;i+=1) {
    script_execute(ds_list_find_value(global.optlist,i),opt_begin)
}

image_speed=0.2*dt
xcursor=xdraw-18
ycursor=ydraw+(ysep*sel)+18
sprite=sprPlayerIdle

angle=0
dead=0

event_step()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xcursor=xdraw-18
ycursor=approach(ycursor,ydraw+(ysep*sel)+18,16*dt)

v=macro_updown(vi_pressed)

if (key_shoot(vi_pressed)) {
    sound_kind_stop(0)
    room_goto(rmMenu)
    exit
} else if (v!=0) {
    sound_play("sndJump")
    script_execute(ds_list_find_value(global.optlist,sel),opt_end)
    sel=modwrap(sel+v,0,numoptions)
} else {
    script_execute(ds_list_find_value(global.optlist,sel),opt_step)
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///save settings
settings_write()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_color(global.text_color)

draw_set_halign(1)
draw_set_font(fntOptions)
draw_text(global.width/2,40,lang("optionsmenu"))

for (i=0;i<numoptions;i+=1) {
    draw_set_halign(0)
    draw_text(xdraw,ydraw+(ysep*i),script_execute(ds_list_find_value(global.optlist,i),opt_text))
    draw_set_halign(2)
    draw_text(xdraw+xsep,ydraw+(ysep*i),script_execute(ds_list_find_value(global.optlist,i),opt_value))
}

if (!dead) draw_sprite_ext(sprite,floor(image_index),xcursor,ycursor,1,1,angle,$ffffff,1)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
switch sel
{
    case 0:
        draw_text_outline(400,100,"Adjust the volume of the background music.",c_white,c_black)
        break;
    case 1:
        draw_text_outline(400,100,"Adjust the volume of the game's sound effects.",c_white,c_black)
        break;
    case 2:
        draw_text_outline(400,100,"When enabled, all music and sounds#pause when the game is paused.",c_white,c_black)
        break;
    case 3:
        draw_text_outline(400,100,"Set whether the game is in fullscreen or not.",c_white,c_black)
        break;
    case 4:
        draw_text_outline(400,100,"If the game is windowed, set the#percent scale of the window size.",c_white,c_black)
        break;
    case 5:
        draw_text_outline(400,100,"Set the screen filter used when the game#window is scaled up. Recommended is Sharp.",c_white,c_black)
        break;
    case 6:
        draw_text_outline(400,100,"If the game is fullscreen, draws the normal#window caption to the screen when enabled.",c_white,c_black)
        break;
    case 7:
        draw_text_outline(400,100,"Adjust how intense screenshake is. If you suffer#from epilepsy or motion sickness, set this to 0.",c_white,c_black)
        break;
    case 8:
        draw_text_outline(400,100,"Adjust the Kid's behavior when both#Left and Right are held simultaneously.",c_white,c_black)
        break;
    case 9:
        draw_text_outline(400,100,"If enabled, the game will automatically#reload from your last save on death.",c_white,c_black)
        break;
    case 10:
        draw_text_outline(400,100,"If enabled, the Kid will automatically#shoot when the Shoot button is held down.",c_white,c_black)
        break;
    case 11:
        draw_text_outline(400,100,"When disabled, certain disorienting#visual effects will be turned off.",c_white,c_black)
        break;
    case 12:
        draw_text_outline(400,100,"Adjust how the player behaves#when jumping off of vines.",c_white,c_black)
        break;
    case 13:
        draw_text_outline(400,100,"If enabled, the Kid's cape will turn#blue when you can't double-jump.",c_white,c_black)
        break;
    case 14:
        draw_text_outline(400,100,"If enabled, all cutscenes are automatically#skipped. Not recommended for your first playthrough.",c_white,c_black)
        break;
    case 15:
        draw_text_outline(400,100,"Set how much blood the Kid creates upon death.#Turn this down if the blood effects cause lag.",c_white,c_black)
        break;
    case 16:
        draw_text_outline(400,100,"Set what objects the Kid's blood can collide with.",c_white,c_black)
        break;
    case 17:
        draw_text_outline(400,100,"Adjust controls if you are using a keyboard.",c_white,c_black)
        break;
    case 18:
        draw_text_outline(400,100,"Adjust controls if you are using a controller.",c_white,c_black)
        break;
    default:
        draw_text_outline(400,100,"No option selected",c_white,c_black)
        break;
}
draw_set_valign(fa_top)

//button info
draw_set_font(fntFileSmall)
draw_set_halign(0)
draw_text(34,global.height-52,"["+key_shoot(vi_name)+"] "+lang("menuback"))
draw_set_halign(1)
draw_text(global.width/2,global.height-52,re_version)
draw_set_halign(2)
draw_text(global.width-34,global.height-52,"["+key_jump(vi_name)+"] "+lang("menuaccept"))
draw_set_halign(0)

draw_set_color($ffffff)
