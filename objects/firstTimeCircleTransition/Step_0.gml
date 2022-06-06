if live_call() return live_result;

circleRadius+=circleAdd;
circleRadius=max(circleRadius, 0);
if (circleAdd<0 && circleRadius<circleDestroy) || (circleAdd>0 && circleRadius>circleDestroy) {
	instance_destroy();
}