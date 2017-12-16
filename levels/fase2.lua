function fase2_load()
	mx, my = 0, 0

	--Coordenadas e Raio
	xC1, yC1, rC1 = 200, 400, 32 --Circle 1
	xC2, yC2, rC2 = 500, 400, 32 -- Circle 2
	xC3, yC3, rC3 = 700, 400, 32 -- Circle 3
	xC4, yC4, rC4 = 720, 550, 32 -- Circle Next

	backcircle = {x = 80, y = 550,	r = 32}


--Valor booleano do C1, C2, C3
	bool1, bool2, bool3 = true, false, false
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

function fase2_update(dt)
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
				if checaToqueC(mx, my, backcircle.x, backcircle.y, backcircle.r) then
					fase1()
				end
		end
	end
end


function fase2_draw()

	love.graphics.setBackgroundColor(91, 148, 239)-- fundo azul

	if bool1 == true then -- define a utilização da imagem verde quando verdadeiro
		love.graphics.draw(green,xC1-32,yC1-32)
	else -- define a utilização da imagem vermelha quando falso
		love.graphics.draw(red,xC1-32,yC1-32)
	end

	if bool2 == true then
		love.graphics.draw(green,xC2-32,yC2-32)
	else
		love.graphics.draw(red,xC2-32,yC2-32)
	end

	if bool3 == false then
		love.graphics.draw(red,xC3-32,yC3-32)
	else
		love.graphics.draw(green,xC3-32,yC3-32)
	end


--Fase2 - Acendimento da lampada quando condições são verdadeiras, assim como ativação do botão next.
	if  not (bool1) and (bool2 and bool3) then
		love.graphics.draw(lamp2, 336, 36)
		love.graphics.draw(green, xC4-32,yC4-32)
		if checaToqueC(mx, my, xC4, yC4, rC4) then
			fase3()
		end
	else
		love.graphics.draw(lamp1, 336, 36)
		love.graphics.draw(green2, xC4-32,yC4-32)
	end

--Impressão dos botões
	love.graphics.print(tostring(bool1), 168, 385)
	love.graphics.print(tostring(bool2), 468, 385)
	love.graphics.print(tostring(bool3), 668, 385)
	love.graphics.draw(yellow,backcircle.x-32,backcircle.y-32)

	love.graphics.printf("NEXT", 693, 535, 400)
	love.graphics.printf("BACK", backcircle.x -29, 535, 400)


-- Impressões de interação com usuário(fase)
	love.graphics.printf("Level 2", 10, 10, 400)
	love.graphics.printf("NOT", 100, 385, 400)
	love.graphics.printf("AND", 300, 385, 400)
	love.graphics.printf("(", 400, 385, 400)
	love.graphics.printf(")", 750, 385, 400)
	love.graphics.printf("AND", 570, 385, 400)


end

function fase1()
	gamestate = "fase1"
	fase1_load()
end

function fase3()
	gamestate = "fase3"
	fase3_load()
end
