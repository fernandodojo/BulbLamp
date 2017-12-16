require "function/rectangle"
require "function/circle"

function menu_load()
	mx = 0
  	my = 0

 	startx = 280
  	starty = 430
  	starheight = 45
  	startwidth= 243

  	exitx = 380
  	exity = 530
  	exitheight = 30
  	exitwidth = 50

	font = love.graphics.setNewFont("backlash.ttf", 53)
	fontexit = love.graphics.setNewFont("backlash.ttf", 33)

	image = love.graphics.newImage("images/713.jpg")
	image2 = love.graphics.newImage("images/light-bulb.png")
	image3 = love.graphics.newImage("images/interrogation.png")

end

function menu_update(dt)
	function love.mousepressed(x, y, button)
		if button ==1 then
			mx = x
			my = y
			if checaToqueC(mx,my,762,42,32) then
				instruction()
			end
			if toqueretangulo(mx, my, startx, starty,startwidth,starheight ) then
				fase1()
			end
			if toqueretangulo(mx, my, exitx, exity,exitwidth,exitheight ) then
				love.event.push("quit")
			end
		end
	end
end

function menu_draw()
	love.graphics.draw(image, 0, 0)
	love.graphics.draw(image2, 272, 172)
	love.graphics.draw(image3, 730, 10)

	love.graphics.setFont(font)
	love.graphics.printf("Start Game", startx, starty, 400)

	love.graphics.setFont(fontexit)
	love.graphics.printf("Exit", exitx, exity, 200 )

	love.graphics.print(mx, 0,0)
	love.graphics.print(my, 0,35)




	--love.graphics.rectangle("fill", startx, starty, startwidth, starheight)
	--love.graphics.rectangle("fill", exitx, exity, exitwidth, exitheight)

	if toqueretangulo(mx, my, startx, starty,startwidth,starheight ) then
		love.graphics.printf("OK", 400, 0, 100)
	end
	if toqueretangulo(mx, my, exitx, exity,exitwidth,exitheight) then
		love.graphics.printf("OK2", 400, 0, 100)
	end

end

function fase1()
	gamestate="fase1"
	fase1_load()
end

function instruction()
	gamestate="instruction"
	instruction_load()
end
