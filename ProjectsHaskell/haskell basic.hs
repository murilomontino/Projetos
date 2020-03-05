type Matriz = [[Float]]
type Linhas = Int
type Colunas = Int

{-
ALUNOS:
 - MURILO DOS ANJOS MONTINO (201600017098)
 - EDUARDO JUNIO SANTOS MACEDO (201600016690)
-}

{- 
Questões: 1,2,3,4,5,6,7,8,10,11 (pra tu se orientar melhor)
 -}
 
{-
A função é bem simples, ela compara a primeira lista da matriz
com todas as listas da matriz, exceto a primeira, retornando uma lista
de Bool. A função and retorna True se todos os elementos dessa lista
for True, caso contrário retorna False.
-}

formato :: Matriz -> Bool
formato (x:xs) = and [compareLinha x y | y <- xs] 

  {- Verifica se é uma matriz de ordem quadrada-} 
quadrada :: Matriz -> Bool 
quadrada [] = False
quadrada (x:xs)
 | length (x:xs) == length x = True
 | otherwise = False
 
 
  {- Verifica se as linhas possuem a mesma quantidade de elementos -}
compareLinha :: [Float] -> [Float] -> Bool
compareLinha x y
  | length x == length y = True
  | otherwise = False

 
 
  {- Gera colunas -}
geradorColuna :: Colunas -> Float -> [Float]
geradorColuna 0 _ = []
geradorColuna x y =  (++) [y] (geradorColuna (x-1) y)


  {- Gera Linhas -}
geradorLinhas :: Linhas -> [Float] -> Matriz
geradorLinhas 0 _ = []
geradorLinhas x y =  (++) [y] (geradorLinhas (x-1) y)


  {- Gera uma matriz de n x m de valores 0 -}
zeros :: Linhas -> Colunas -> Matriz
zeros 0 _ = []
zeros _ 0 = []
zeros x y = geradorLinhas x (geradorColuna y 0)

  {- Gera uma matriz de n x m de valores 1 -}
uns :: Linhas -> Colunas -> Matriz
uns 0 _ = []
uns _ 0 = []
uns x y = geradorLinhas x (geradorColuna y 1)

{-
Usamos a função fromEnum, que retorna 1 para True e 0 para False,
como uma matriz identidade é caracterizada pela sua diagonal principal
ser 1, temos que sempre que i == j queremos por 1, e 0 caso contrário.
Então usamos o haskell para gerar a matriz seguindo a regra especificada
-}
identidade :: Int -> Matriz
identidade n = [ [paraFloat (fromEnum $ i == j) | i <- [1..n]] | j <- [1..n]]

{- Retorna um vetor linha com os valores da diagonal principal da matriz. -}

diag :: Matriz -> Matriz
diag [] = []
diag (x:xs) = diagonal (x:xs) 0  

diagonal :: Matriz -> Int -> Matriz
diagonal [] _ = []
diagonal (x:xs) y = if ( (length x) > y ) 
  then (++) [ (elemLinha x y ) ] (diagonal xs (y+1) )
  else []

elemLinha :: [Float] -> Colunas -> [Float]
elemLinha [] _ = []
elemLinha x y = [(!!) x y ]

paraFloat :: Int -> Float
paraFloat x = fromInteger y
  where y = toInteger x




 {- Matrizes de ordem diferentes resultam em uma matriz nula, pois não é possível somar-}
soma :: Matriz -> Matriz -> Matriz
soma [] [] = []
soma [] m = []
soma n [] = []
soma (x:xs) (y:ys)
 | (length x == 1) && (length (y:ys) > 1)  = somaEscalar (y:ys) (firstElem x)
 | (length y == 1) && (length (x:xs) > 1)  = somaEscalar (x:xs) (firstElem y)
 | verificarOrdem (x:xs) (y:ys) = (++) [(somaElementos x y)] (soma xs ys)
 | otherwise = []

{- Soma de um elemento a todos os membros da matriz-} 
somaEscalar :: Matriz -> Float -> Matriz
somaEscalar [] y = []
somaEscalar (x:xs) y = (++) [(somaElemEscar x y)] (somaEscalar xs y) 

somaElemEscar :: [Float] -> Float -> [Float]
somaElemEscar [] y = []
somaElemEscar (x:xs) y = (++) [(x+y)] (somaElemEscar xs y)

firstElem :: [Float] -> Float
firstElem [] = 0
firstElem (x:xs) = x

{- Soma elementos individualmente de uma matriz-}
somaElementos :: [Float] -> [Float] -> [Float]
somaElementos m [] = []
somaElementos [] n = []
somaElementos (x:xs) (y:ys)  = (++) [x+y] (somaElementos xs ys) 

  {- Verifica a ordem das matrizes-}
verificarOrdem :: Matriz -> Matriz -> Bool
verificarOrdem [] [] = True
verificarOrdem (x:xs) (y:ys)
 | length (x:xs) == length (y:ys) && length x == length y = True 
 | otherwise = False
  
  
 

 
 {- Matrizes de ordem diferentes resultam em uma matriz nula, pois não é possível subtrair-}
subtrai :: Matriz -> Matriz -> Matriz
subtrai [] [] = []
subtrai m [] = m
subtrai [] n = n
subtrai (x:xs) (y:ys)
 | (length x == 1) && (length (y:ys) > 1) = subEscalar (y:ys) (firstElem x)
 | (length y == 1) && (length (x:xs) > 1) = subEscalar (x:xs) (firstElem y)
 | verificarOrdem (x:xs) (y:ys) = (++) [(subtraiElementos x y)] (subtrai xs ys)
 | otherwise = []
 
{- Subtraí de um elemento a todos os membros da matriz-} 
subEscalar :: Matriz -> Float -> Matriz
subEscalar [] y = []
subEscalar (x:xs) y = (++) [(subElemEscar x y)] (subEscalar xs y) 

subElemEscar :: [Float] -> Float -> [Float]
subElemEscar [] y = []
subElemEscar (x:xs) y = (++) [(x-y)] (subElemEscar xs y)

 
 
 {- Subtraí elementos individualmente de uma matriz-}
subtraiElementos :: [Float] -> [Float] -> [Float]
subtraiElementos m [] = []
subtraiElementos [] n = []
subtraiElementos (x:xs) (y:ys) = (++) [x-y] (subtraiElementos xs ys) 
 
