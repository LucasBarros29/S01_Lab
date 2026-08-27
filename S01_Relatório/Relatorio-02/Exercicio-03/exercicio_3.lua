function filtrarMaiores(tabela, limite)
    local resultado = {}

    for i = 1, #tabela do
        if tabela[i] > limite then
            table.insert(resultado, tabela[i])
        end
    end

    return resultado
end

print("Digite a quantidade de elementos da tabela:")
local N = tonumber(io.read())

local numeros = {}

for i = 1, N do
    print("Digite o elemento " .. i .. ":")
    numeros[i] = tonumber(io.read())
end

print("Digite o limite (K):")
local K = tonumber(io.read())

local maiores = filtrarMaiores(numeros, K)

print("Elementos maiores que " .. K .. ":")

for i = 1, #maiores do
    print(maiores[i])
end
