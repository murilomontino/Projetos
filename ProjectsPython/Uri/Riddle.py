import math

Lista_float = [2.0, 1.6, 1.7, 10.0, 23.6, -1.0, -5.8, 12.9, 18.8, 0.0]
Lista_int = [4, 2, 1, 1, 10, 23, -1, 2000, -5, 12, 50, 75, 18, 0]
#            0  1  2  3  4    5   6   7   8   9  10  11  12 

def Riddle(array : list):
    n : int = len(array) 
    if n == 1:
        return array[0]
    else:
        temp : float = Riddle(array[:n-1])
        if temp <= array[-1]:
            return temp
        else:
            return array[-1]

def maiorELemento(lista : list, inicio=0, fim=None) -> list:
    metade : int = len(lista)//2
    meio: int  = (inicio+fim)//2

    if len(lista) == 1:
        return lista[0], meio

    esquerda : tuple = maiorELemento(lista[:metade], inicio=inicio, fim=meio) 
    direita : tuple =  maiorELemento(lista[metade:], inicio=meio, fim=fim)
    if  esquerda[0] > direita[0]:
        return esquerda
    else:
        return direita
    
#T(n) = 2T(n/2) + O(1)
#O(log n)
print( maiorELemento(Lista_int, fim=len(Lista_int)))
