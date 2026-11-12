data Cafe = Cafe String Double Int
    deriving (Show)


descrever :: Cafe -> String
descrever (Cafe nome preco intensidade) =
    nome ++ " - R$ " ++ show preco


forca :: Cafe -> String
forca (Cafe _ _ intensidade)
    | intensidade >= 8 = "Forte"
    | intensidade >= 5 = "Equilibrado"
    | otherwise        = "Suave"

precoComLeite :: Bool -> Cafe -> Double
precoComLeite leite (Cafe _ preco _ ) =
    if leite
        then preco + 2.0
        else preco

main :: IO ()
main = do
    let cafe1 = Cafe "Expresso" 5.50 9
        cafe2 = Cafe "Cappuccino" 8.00 6
        cafe3 = Cafe "Americano" 6.00 3

    putStrLn (descrever cafe1)
    putStrLn (forca cafe1)
    print (precoComLeite True cafe1)

    putStrLn (descrever cafe2)
    putStrLn (forca cafe2)
    print (precoComLeite False cafe2)

    putStrLn (descrever cafe3)
    putStrLn (forca cafe3)
    print (precoComLeite True cafe3)
