local anim8 = require "libraries/anim8"

jucator_space={}
jucator = {}
jucator.x=320
jucator.y=500
jucator.vx=0
jucator.vy=0
jucator.inaltime=65
jucator.latime=44
jucator.grids = {}
jucator.grids.mers = anim8.newGrid(jucator.latime,jucator.inaltime, sprites.plansa_mers:getWidth(),sprites.plansa_mers:getHeight())
jucator.animatie = {}
jucator.animatie.stanga= anim8.newAnimation(jucator.grids.mers('1-2',2),0.1)
jucator.animatie.dreapta= anim8.newAnimation(jucator.grids.mers('1-2',1),0.1)
jucator.miscare=false
jucator.anim = jucator.animatie.dreapta

function movePlayer(player, dt)
  local goalX, goalY = jucator.x + jucator.vx * dt*300, jucator.y + jucator.vy * dt*300
  local actualX, actualY = maps[i][j].world:move(player, goalX, goalY)
  jucator.x, jucator.y = actualX, actualY
  maps[i][j].world:update(jucator, jucator.x, jucator.y)
end

function jucator:createBody(player,world)
  player.body= love.physics.newBody(world, player.x, player.y, "dynamic")
  player.shape= love.physics.newRectangleShape(44, 65)
  player.fixture = love.physics.newFixture(player.body, player.shape, 1)
end

function jucator:update(dt)
  jucator.vx=0
  jucator.vy=0
  if jucator.miscare then
      jucator.anim:update(dt)
  end
  jucator.miscare=false
  if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
    jucator.vy=-1
    jucator.miscare=true
  end

  if love.keyboard.isDown("down") or love.keyboard.isDown("s") then

    jucator.vy=1
    jucator.miscare=true
  end

  if love.keyboard.isDown("left") or love.keyboard.isDown("a") then

    jucator.vx=-1
    jucator.miscare=true
    jucator.anim = jucator.animatie.stanga
  end
  if love.keyboard.isDown("right") or love.keyboard.isDown("d") then

    jucator.vx=1
    jucator.miscare=true
    jucator.anim = jucator.animatie.dreapta
  end

end
