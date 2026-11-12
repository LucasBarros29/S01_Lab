
data Esboco = Esboco
    { titulo  :: String
    , tecnica :: String
    , horas   :: Int
    } deriving (Show)

esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente [] = "O caderno esta vazio!"
esbocoMaisRecente (e:_) =
    titulo e ++ " - " ++ tecnica e

contarEsbocos :: [Esboco] -> Int
contarEsbocos [] = 0
contarEsbocos (_:resto) =
    1 + contarEsbocos resto

horasDesenhando :: [Esboco] -> Int
horasDesenhando [] = 0
horasDesenhando (e:resto) =
    horas e + horasDesenhando resto

main :: IO ()
main = do
    let caderno =
            [ Esboco "Dragao" "Carvao" 3
            , Esboco "Castelo" "Grafite" 2
            , Esboco "Floresta" "Nanquim" 4
            ]

    putStrLn "=== CADERNO DE ESBOCOS ==="

    putStrLn (esbocoMaisRecente caderno)

    putStrLn ("Quantidade de esbocos: " ++
        show (contarEsbocos caderno))

    putStrLn ("Total de horas: " ++
        show (horasDesenhando caderno))

    let cadernoVazio = []

    putStrLn (esbocoMaisRecente cadernoVazio)

    let novoCaderno =
            Esboco "Fantasma" "Nanquim" 5 : caderno

    putStrLn "\n=== NOVO CADERNO ==="

    putStrLn (esbocoMaisRecente novoCaderno)

    putStrLn ("Quantidade de esbocos: " ++
        show (contarEsbocos novoCaderno))

    putStrLn ("Total de horas: " ++
        show (horasDesenhando novoCaderno))

