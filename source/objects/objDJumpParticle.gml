#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
life=irandom_range(10,20)
time=0

hspeed = random_range(-0.2,0.2)
vspeed = random_range(0.1,0.4)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
time+=1

image_alpha=1-time/life

if (time>=life) instance_destroy()
