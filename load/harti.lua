sti = require "libraries/sti"
maps = {}
    for i=0,4 do
      maps[i] = {}
      for j=0,2 do
        maps[i][j]={}
      end
    end
i=4
j=1
maps[i][j].harta = sti("harti/harta" .. i .. j .. ".lua",{"box2d"})
love.physics.setMeter(16)
maps[i][j].world= love.physics.newWorld()
maps[i][j].harta:box2d_init(maps[i][j].world)
maps[i][j].harta:addCustomLayer("Sprite layer",3)
jucator:createBody(jucator,maps[i][j].world)

spriteLayer = maps[i][j].harta.layers["Sprite layer"]
function spriteLayer:draw()
    jucator.anim:draw(sprites.plansa_mers,jucator.x,jucator.y)
end

function maps:load()
  maps[i][j].harta = sti("harti/harta" .. i .. j .. ".lua",{"bump"})
  maps[i][j].world= love.physics.newWorld(16)
  maps[i][j].harta:bump_init(maps[i][j].world)
  maps[i][j].harta:addCustomLayer("Sprite layer",3)
  maps[i][j].world:add(jucator,jucator.x,jucator.y,jucator.latime,jucator.inaltime)
  spriteLayer = maps[i][j].harta.layers["Sprite layer"]

  function spriteLayer:draw()
      jucator.anim:draw(sprites.plansa_mers,jucator.x,jucator.y)
  end

  maps[i][j].world:update(jucator, jucator.x, jucator.y)
end
