if live_call() return live_result;

event_inherited();

addWave();
addRow(SD_DEFAULT_PADDING*3);
addEnemy(sdChode, sdChode);

addWave();
addRow(SD_DEFAULT_PADDING*2);
addEnemy(sdCardboardWorm, sdCardboardWorm, sdCardboardWorm);
addRow(SD_DEFAULT_PADDING*2);
addEnemy(sdChode, sdChode, sdChode);

addWave();
addRow(SD_DEFAULT_PADDING*3);
addEnemy(sdChode, sdLeech, sdLeech, sdLeech, sdChode);

addWave();
addRow(SD_DEFAULT_PADDING*3);
addEnemy(sdSpitWorm, sdSpitWorm);

addWave();
addRow();
addEnemy(sdWorm, sdWorm, sdSpitWorm, sdWorm, sdWorm);

addWave();
addRow(SD_DEFAULT_PADDING*3);
addEnemy(sdSpitWorm, sdSpitWorm, sdSpitWorm);
addRow(SD_DEFAULT_PADDING*2);
addEnemy(sdCardboardWorm, sdCardboardWorm, sdCardboardWorm);

addWave();
addRow();
addEnemy(sdLeech, sdLeech, sdLeech, sdLeech, sdLeech, sdLeech);
addRow();
addEnemy(sdLeech, sdLeech, sdLeech, sdLeech, sdLeech, sdLeech);

addWave();
addRow();
addEnemy(sdSpitWorm, sdSpitWorm, sdSpitWorm, sdSpitWorm);
addRow();
addEnemy(sdChode, sdChode, sdChode);

addWave();
addRow();
addEnemy(sdWorm, sdWorm, sdSpitWorm, sdWorm, sdWorm);
addRow();
addEnemy(sdLeech, sdLeech, sdLeech, sdLeech);

addWave();
addRow();
addEnemy(sdLeech, sdChode, sdSpitWorm, sdChode, sdSpitWorm, sdChode, sdLeech);
addRow(SD_DEFAULT_PADDING*3);
addEnemy(sdWorm, sdWorm, sdWorm);

addWave();
addRow();
addEnemy(sdCardboardWorm);