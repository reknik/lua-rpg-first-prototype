sti = require "libraries/sti"
bump = require "libraries/bump"
maps = {}
    for i=0,0 do
      maps[i] = {}
      for j=0,1 do
        maps[i][j]={}
      end
    end
i=0
j=1
maps[i][j].harta = sti("harti/harta" .. i .. j .. ".lua",{"bump"})
maps[i][j].world= bump.newWorld(16)
maps[i][j].harta:bump_init(maps[i][j].world)
maps[i][j].harta:addCustomLayer("Sprite layer",3)
maps[i][j].world:add(jucator,jucator.x,jucator.y,jucator.latime,jucator.inaltime)

spriteLayer = maps[i][j].harta.layers["Sprite layer"]
function spriteLayer:draw()
    jucator.anim:draw(sprites.plansa_mers,jucator.x,jucator.y)
end

function maps:load()
  jucator.x=40
  jucator.y=40
  j=j-1
  maps[i][j].harta = sti("harti/harta" .. i .. j .. ".lua",{"bump"})
  maps[i][j].world= bump.newWorld(16)
  maps[i][j].harta:bump_init(maps[i][j].world)
  maps[i][j].harta:addCustomLayer("Sprite layer",3)
  maps[i][j].world:add(jucator,jucator.x,jucator.y,jucator.latime,jucator.inaltime)
  spriteLayer = maps[i][j].harta.layers["Sprite layer"]

  function spriteLayer:draw()
      jucator.anim:draw(sprites.plansa_mers,jucator.x,jucator.y)
  end

  maps[i][j].world:update(jucator, jucator.x, jucator.y)
end
