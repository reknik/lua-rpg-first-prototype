
function love.load()
  require("load/resurse")
  require("load/player")
  require("load/harti")
end

function love.update(dt)

  maps[i][j].harta:update(dt)
  jucator:update(dt)
   exista=false
  if love.keyboard.isDown("space") and exista==false then
    exista=true
    maps[i][j].world:add(jucator_space,jucator.x+23,jucator.y+23,jucator.latime,jucator.inaltime)
    maps[i][j].world:remove(jucator_space)
  end
  if jucator.x<-20 then
      j=j-1
      jucator.x=600
      maps:load()

  elseif jucator.x>650 then
      j=j+1
      jucator.x=0
      maps:load()
  elseif jucator.y>650 then
      i=i+1
      jucator.y=0
      maps:load()
  elseif jucator.y<-10 then
      i=i-1
      jucator.y=600
      maps:load()
  else
      movePlayer(jucator,dt)
  end
end

function love.draw()

  love.graphics.setColor(1, 1, 1)

    maps[i][j].harta:draw()



end
