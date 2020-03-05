from random import randint
import math


def create_list(tam: int):
    lista : list = []
    for aux in range(tam):
        lista.append(randint(0,100000))
    return lista

def paridade(tamanho: int) -> int:
    if tamanho % 2 == 0:
        return 0
    else:
        return 1
    

def merge_sort(lista: list, inicio=0, fim=None, tam=None):
    
    metade = (fim + inicio) // 2

    if inicio == fim - 1 or tam <= 1:
        return lista
    
    elementos = tam // 2
    sobra = paridade(tam // 2)
    
    esquerda = merge_sort(lista, inicio=0, fim=metade, tam=elementos)
    direita = merge_sort(lista, inicio=metade, fim=fim, tam=elementos+sobra)
    

    while (inicio < fim) and (inicio+1 < fim):
        if lista[inicio] > lista[inicio+1]:
            aux: int = lista[inicio]
            lista[inicio] = lista[inicio+1]
            lista[inicio+1] = aux
            inicio += 1
        else:
            inicio += 1
    
    return lista


lista = [15933, 33015, 35654, 23235, 40759, 11722, 65520, 83096, 96673]

def main():
    global lista
    merge_sort(lista, fim=len(lista), tam=len(lista))
    print("Ordenado: ", lista)

if __name__ == "__main__":
    main()



