function fase3_load()
	mx, my = 0, 0

	--Coordenadas e Raio
	xC1, yC1, rC1 = 250, 400, 32--Segundo Circle
	xC2, yC2, rC2 = 450, 400, 32--Terceiro Circle
	xC3, yC3, rC3 = 700, 400, 32--Quarto Circle
	xC4, yC4, rC4 = 720, 550, 32-- Circle next
  xC5, yC5, rC5 = 50, 400, 32--Primeiro Circle

	backcircle = {x = 80, y = 550,	r = 32}


--Valor booleano do C1, C2, C3, C5
	bool1, bool2, bool3, bool4 = false, false, true, false
--Adição de imagens de cada Círculo e Lampada
	green = love.graphics.newImage("images/green.png")
	green2= love.graphics.newImage("images/green2.png")
	red = love.graphics.newImage("images/red.png")
	yellow = love.graphics.newImage("images/yellow.png")

	lamp1 = love.graphics.newImage("images/lampada1.png")
	lamp2 = love.graphics.newImage("images/lampada2.png")

--Definição de fonte e tamanho
	font  = love.graphics.setNewFont("backlash.ttf", 32)
	love.graphics.setFont(font)

end

function fase3_update(dt)
	function love.mousepressed( x, y, button )
		if button == 1 then
			mx = x
			my = y
				if checaToqueC(mx, my, xC1, yC1, rC1) then -- detecção de toque apenas quando ocorrer click do mouse
					bool1 = boolean(bool1) --função para mudança de valor booleano oposto apenas quando for detectado toque no botão
				end
				if checaToqueC(mx, my, xC2, yC2, rC2) then
					bool2 = boolean(bool2)
				end
				if checaToqueC(mx, my, xC3, yC3, rC3) then
					bool3 = boolean(bool3)
				end
				if checaToqueC(mx, my, xC5, yC5, rC5) then
					bool4 = boolean(bool4)
				end
				if checaToqueC(mx, my, backcircle.x, backcircle.y, backcircle.r) then
					fase2()
				end

		end
	end
end


function fase3_draw()

	love.graphics.setBackgroundColor(91, 148, 239)-- fundo azul

	if bool1 == false then -- define a utilização da imagem vermelha quando verdadeiro
		love.graphics.draw(red,xC1-32,yC1-32)
	else -- define a utilização da imagem verde quando falso
		love.graphics.draw(green,xC1-32,yC1-32)
	end

	if bool2 == true then
    love.graphics.draw(green,xC2-32,yC2-32)

	else
		love.graphics.draw(red,xC2-32,yC2-32)
	end

	if  bool3==false then
		love.graphics.draw(red,xC3-32,yC3-32)
	else
		love.graphics.draw(green,xC3-32,yC3-32)
	end

  if  bool4==true then
    love.graphics.draw(green,xC5-32,yC5-32)
  else
    love.graphics.draw(red,xC5-32,yC5-32)
  end


--Fase3 - Acendimento da lampada quando condições são verdadeiras, assim como ativação do botão next.
	if  bool4 and not(bool1) and bool2 and not(bool3) then
		love.graphics.draw(lamp2, 336, 36)
		love.graphics.draw(green, xC4-32,yC4-32)
		if checaToqueC(mx, my, xC4, yC4, rC4) then
			fase4()
		end
	else
		love.graphics.draw(lamp1, 336, 36)
		love.graphics.draw(green2, xC4-32,yC4-32)
	end

--Impressão dos botões
  love.graphics.print(tostring(bool4), 20, 385)
  love.graphics.print(tostring(bool1), 218, 385)
	love.graphics.print(tostring(bool2), 418, 385)
	love.graphics.print(tostring(bool3), 668, 385)
	love.graphics.draw(yellow,backcircle.x-32,backcircle.y-32)

	love.graphics.printf("NEXT", 693, 535, 400)
	love.graphics.printf("BACK", backcircle.x -29, 535, 400)


-- Impressões de interação com usuário(fase)
	love.graphics.printf("Level 3", 10, 10, 400)
  love.graphics.printf("AND", 95, 385,400)
	love.graphics.printf("NOT", 155, 385, 400)
	love.graphics.printf("AND", 330, 385, 400)
	love.graphics.printf("NOT", 600, 385, 400)
	love.graphics.printf("AND", 510, 385, 400)


end

function fase4()
	gamestate = "fase4"
	fase4_load()
end

function fase2()
	gamestate = "fase2"
	fase2_load()
end
