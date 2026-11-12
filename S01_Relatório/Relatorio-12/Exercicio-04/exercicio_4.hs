data Etapa = NaFila | NoBanho | Concluido
    deriving (Show, Eq)

data Atendimento = Atendimento
    { cliente :: String
    , servico :: String
    , valor   :: Double
    , etapa   :: Etapa
    } deriving (Show)

descrever :: Atendimento -> String
descrever (Atendimento c s v e) =
    c ++ " - " ++ s ++ " - " ++ show e ++
    " - R$ " ++ show v

concluir :: Atendimento -> Atendimento
concluir (Atendimento c s v _) =
    Atendimento c s v Concluido

arrecadado :: [Atendimento] -> Double
arrecadado atendimentos =
    sum (map valor (filter
        (\a -> etapa a == Concluido) atendimentos))

main :: IO ()
main = do
    let atendimento1 =
            Atendimento "Chihiro" "Limpeza espiritual" 50 NaFila

        atendimento2 =
            Atendimento "Haku" "Banho medicinal" 80 NoBanho

        atendimento3 =
            Atendimento "Sem Rosto" "Banho especial" 120 NaFila

    let atendimentos =
            [atendimento1, atendimento2, atendimento3]

    putStrLn "=== ATENDIMENTOS ORIGINAIS ==="
    mapM_ (putStrLn . descrever) atendimentos

    -- Concluir os atendimentos
    let atendimentosNovos = map concluir atendimentos

    putStrLn "\n=== ATENDIMENTOS CONCLUIDOS ==="
    mapM_ (putStrLn . descrever) atendimentosNovos

    -- Mostrar as duas listas
    putStrLn "\n=== LISTAS ==="

    print (map etapa atendimentos)
    print (map etapa atendimentosNovos)

    -- Mostrar arrecadacao
    putStrLn "\n=== ARRECADACAO ==="

    print (arrecadado atendimentos)
    print (arrecadado atendimentosNovos)
