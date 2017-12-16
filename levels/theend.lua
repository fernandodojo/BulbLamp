function theend_load()
  mx, my = 0, 0

--Coordenadas e Raio
  xC4, yC4, rC4 = 720, 550, 32

	backcircle = {x = 80, y = 550,	r = 32}

--Definição de fonte e tamanho
  fonttitle = love.graphics.setNewFont("backlash.ttf", 53)
  fonttext  = love.graphics.setNewFont("backlash.ttf", 32)

--Adição de imagens de cada Círculo
  yellow = love.graphics.newImage("images/yellow.png")
  red = love.graphics.newImage("images/red.png")
  image = love.graphics.newImage("images/ballon.jpg")
end

function theend_update(dt)
	function love.mousepressed( x, y, button )
		if button == 1 then
			mx = x
			my = y
      if checaToqueC(mx, my, xC4, yC4, rC4) then-- detecção de toque apenas quando ocorrer click do mouse
				love.event.quit() --Função para sair do jogo
			end
			if checaToqueC(mx, my, backcircle.x, backcircle.y, backcircle.r) then
				fase4()
			end
		end
	end
end

function theend_draw()

  love.graphics.draw(image, 0, 0)

--Impressão dos botões e sua fonte
  love.graphics.setFont(fonttext)
  love.graphics.draw(yellow,backcircle.x-32,backcircle.y-32)
  love.graphics.draw(red,xC4-32,yC4-32)
  love.graphics.printf("EXIT", 693, 535, 400)
  love.graphics.printf("BACK", backcircle.x -29, 535, 400)


--Texto e sua fonte
  love.graphics.setFont(fonttitle)
  love.graphics.printf("Congratulations!!!!!!!!", 210, 250, 400)

end


function fase4()
	gamestate = "fase4"
	fase4_load()
end
