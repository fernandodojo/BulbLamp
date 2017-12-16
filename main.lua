--http://www.iconsdb.com/orange-icons/circle-icon.html

io.stdout:setvbuf("no")
io.stdout:setvbuf "no"


require "function/boolean"
require "function/circle"
require "function/menu"
require "function/instruction"
require "levels/fase1"
require "levels/fase2"
require "levels/fase3"
require "levels/fase4"
require "levels/theend"

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	end
end

function love.load()
	gamestate = "menu"
	menu_load()
end

function love.update(dt)
	if gamestate == "menu" then
		menu_update(dt)
	elseif gamestate == "instruction" then
		instruction_update(dt)
	elseif gamestate == "fase1" then
		fase1_update(dt)
	elseif gamestate == "fase2" then
		fase2_update(dt)
	elseif gamestate == "fase3" then
		fase3_update(dt)
	elseif gamestate == "fase4" then
		fase4_update(dt)
	elseif gamestate == "theend" then
		theend_update(dt)
	end
end

function love.draw()

	if gamestate == "menu" then
		menu_draw()
	elseif gamestate == "instruction" then
		instruction_draw()
	elseif gamestate == "fase1" then
		fase1_draw()
	elseif gamestate == "fase2" then
		fase2_draw()
	elseif gamestate == "fase3" then
		fase3_draw()
	elseif gamestate == "fase4" then
		fase4_draw()
	elseif gamestate == "theend" then
		theend_draw()
	end
end
