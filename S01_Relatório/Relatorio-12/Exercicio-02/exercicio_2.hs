pesoMaximo :: Double
pesoMaximo = 10.0

data Encomenda = Encomenda String Double Double
    deriving (Show)


descrever :: Encomenda -> String
descrever (Encomenda destinatario peso frete) =
    "Destinatario: " ++ destinatario ++
    " | Peso: " ++ show peso ++ " kg" ++
    " | Frete: R$ " ++ show frete

cabeNaVassoura :: [Encomenda] -> [Encomenda]
cabeNaVassoura encomendas =
    filter (\(Encomenda _ peso _) -> peso <= pesoMaximo) encomendas

totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas =
    sum (map (\(Encomenda _ _ frete) -> frete) encomendas)

main :: IO ()
main = do
    let encomendas =
            [ Encomenda "Sophie" 3.0 15.0
            , Encomenda "Tombo" 5.0 20.0
            , Encomenda "Ursula" 12.0 35.0
            , Encomenda "Fio" 8.0 25.0
            , Encomenda "Madame" 15.0 40.0
            ]

    putStrLn "=== TODAS AS ENCOMENDAS ==="
    mapM_ (putStrLn . descrever) encomendas

    let entregas = cabeNaVassoura encomendas

    putStrLn "\n=== ENCOMENDAS QUE CABEM ==="
    mapM_ (putStrLn . descrever) entregas

    putStrLn "\n=== TOTAL DOS FRETES ==="
    print (totalDeFretes entregas)

