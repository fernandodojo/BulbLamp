function instruction_load()
  mx, my=0, 0

--Coordenadas e raio
  backcircle = {x = 80, y = 550,	r = 32}

--Adição de imagens de cada Círculo e Lampada
  yellow = love.graphics.newImage("images/yellow.png")
  green = love.graphics.newImage("images/green.png")
  red = love.graphics.newImage("images/red.png")
  image = love.graphics.newImage("images/713.jpg")
  lampon = love.graphics.newImage("images/lampon.png")

--Definição de fonte e tamanho
  fonttitle = love.graphics.setNewFont("backlash.ttf", 53)
	fonttext  = love.graphics.setNewFont("backlash.ttf", 32)

end

function instruction_update(dt)
	function love.mousepressed( x, y, button )
		if button == 1 then
			mx = x
			my = y
			if checaToqueC(mx, my, backcircle.x, backcircle.y, backcircle.r) then -- Detecção de toque apenas quando ocorrer click do mouse
        menu() --Havendo click na Coordenadas do botão back, volta para o menu
			end
		end
	end
end


function instruction_draw()

love.graphics.draw(image, 0, 0) -- imagem de fundo

--Impressão do botão back para voltar ao menu
love.graphics.draw(yellow, backcircle.x-32, backcircle.y-32)
love.graphics.printf("BACK", backcircle.x -29, 535, 400)

--Fontes e textos impressos na tela
love.graphics.setFont(fonttitle)
love.graphics.printf("Instruction", 285, 0, 400)
love.graphics.setFont(fonttext)
love.graphics.printf("O objetivo eh usar a logica booleana para acender a lampada. Eh necessario que tudo seja 'true' para ser acesa.",230,170,400)

-- Impressões de interação com usuário(fase)
love.graphics.draw(lampon, 150, 450)
love.graphics.printf("=", 210, 470, 400)
love.graphics.printf("NOT",250, 465, 400)
love.graphics.draw(red, 300, 450)
love.graphics.printf("false", 302, 465, 400)
love.graphics.printf("AND", 400, 465, 400)
love.graphics.draw(green, 480, 450)
love.graphics.printf("true", 485, 465, 400)
love.graphics.printf("OR", 585, 465, 400)
love.graphics.draw(red, 650, 450)
love.graphics.printf("false", 652, 465, 400)


end

function menu() -- Função para ser empregada a volta para o menu
	gamestate="menu"
	menu_load()
end
