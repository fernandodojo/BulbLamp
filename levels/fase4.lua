function fase4_load()
	mx, my = 0, 0

	--Coordenadas e Raio
	xC1, yC1, rC1 = 220, 400, 32--Segundo Circle
	xC2, yC2, rC2 = 450, 400, 32--Terceiro Circle
	xC3, yC3, rC3 = 600, 400, 32--Quarto Circle
	xC4, yC4, rC4 = 720, 550, 32-- Circle next
  xC5, yC5, rC5 = 50, 400, 32--Primeiro Circle
  xC6, yC6, rC6 = 765,400,32--Quinto Circle

	backcircle = {x = 80, y = 550,	r = 32}


--Valor booleano do C1, C2, C3, C5, C6
	bool1, bool2, bool3, bool4,bool5 = false, false, true, false, false
--Adição de imagens de cada Círculo e Lampada
	green = love.graphics.newImage("images/green.png")
	green2= love.graphics.newImage("images/green2.png")
	red = love.graphics.newImage("images/red.png")
	yellow = love.graphics.newImage("images/yellow.png")

	lamp1 = love.graphics.newImage("images/lampada1.png")
	lamp2 = love.graphics.newImage("images/lampada2.png")

--Definição de fonte e tamanho
	love.graphics.setFont(font)

end

function fase4_update(dt)
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
        if checaToqueC(mx, my, xC6, yC6, rC6) then
					bool5 = boolean(bool5)
				end
				if checaToqueC(mx, my, backcircle.x, backcircle.y, backcircle.r) then
					fase3()
				end
		end
	end
end


function fase4_draw()

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

  if  bool5==true then
    love.graphics.draw(green,xC6-32,yC6-32)
  else
    love.graphics.draw(red,xC6-32,yC6-32)
  end

--Fase4 - Acendimento da lampada quando condições são verdadeiras, assim como ativação do botão next.
	if  (bool4 or bool1) and not(bool2) and not(bool3) and bool5 then
		love.graphics.draw(lamp2, 336, 36)
		love.graphics.draw(green, xC4-32,yC4-32)
		if checaToqueC(mx, my, xC4, yC4, rC4) then
			theend()
		end
	else
		love.graphics.draw(lamp1, 336, 36)
		love.graphics.draw(green2, xC4-32,yC4-32)
	end

--Impressão dos botões
  love.graphics.print(tostring(bool1), 188, 385)
	love.graphics.print(tostring(bool2), 418, 385)
	love.graphics.print(tostring(bool3), 568, 385)
  love.graphics.print(tostring(bool4), 20, 385)
  love.graphics.print(tostring(bool5), 732, 385)
	love.graphics.draw(yellow,backcircle.x-32,backcircle.y-32)

	love.graphics.printf("NEXT", 693, 535, 400)
	love.graphics.printf("BACK", backcircle.x -29, 535, 400)


-- Impressões de interação com usuário(fase)
	love.graphics.printf("Level 4", 10, 10, 400)
  love.graphics.printf("OR", 115, 385,400)
	love.graphics.printf("AND", 270, 385, 400)
	love.graphics.printf("NOT (", 350, 385, 400)
	love.graphics.printf("AND", 505, 385, 400)
  love.graphics.printf(") AND", 650, 385, 400)


end

function fase3()
	gamestate = "fase3"
	fase3_load()
end

function theend()
  gamestate = "theend"
  theend_load()
end
