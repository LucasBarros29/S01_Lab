function contarOcorrencias(tabela, alvo)
    local contador = 0

    for i = 1, #tabela do
        if tabela[i] == alvo then
            contador = contador + 1
        end
    end

    return contador
end

print("Digite a quantidade de elementos da tabela:")
local N = tonumber(io.read())

local numeros = {}

for i = 1, N do
    print("Digite o elemento " .. i .. ":")
    numeros[i] = tonumber(io.read())
end

print("Digite o número a ser buscado:")
local X = tonumber(io.read())

local quantidade = contarOcorrencias(numeros, X)

print("O número " .. X .. " aparece " .. quantidade .. " vez(es) na tabela.")
