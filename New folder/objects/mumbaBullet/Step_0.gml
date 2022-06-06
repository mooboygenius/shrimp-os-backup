//if live_call() return live_result;

hitEnemy=false;

event_inherited();

life--;
if coolOff<=0 {
	var inst=instance_place(x, y, mumbaLivingObject);
	if inst {
		if inst.object_index!=mumbaPlayer && !inst.invulnerable {
			hitEnemy=true;
			hurt(inst, damage);
			if inst.maximumHp>1 {
				var d=90+random_range(-1, 1)*30,
				spd=2,
				h=lengthdir_x(spd, d),
				v=lengthdir_y(spd, d);
				with createMumbaTextEffect(x, y, concat("-", damage), $7B2FCC, BLACK_COLOR, 30, h, v, .1) {
					squish=-.5;
					minimumLife=10;
					angle=random_range(-1, 1)*10;
				}
			}
			with inst {
				var m=.2;
				horizontalKnockback=other.horizontalSpeed*m;
				verticalKnockback=other.verticalSpeed*m;
			}
			if penetrates || inst.passThrough {
				coolOff=5;
			} else {
				life=-1;
			}
		}
	}
}

coolOff--;

if (place_meeting(x, y, mumbaWall) && destroyOnImpact) || life<0 {
	instance_destroy();
}