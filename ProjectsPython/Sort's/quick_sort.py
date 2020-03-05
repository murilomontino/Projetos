from random import randint
import sys

sys.setrecursionlimit(10000)

def create_list(lista : list):
    for aux in range(10000):
        lista.append(randint(0,100000))
    return lista

def quick_sort(lista: list):
    
    if len(lista) <= 1:
        return lista
    
    esq : list = []
    dir_ : list = []
    pivo : int = lista[randint(0, len(lista)-1 )]
    
    for aux in lista:
        if aux <= pivo:
            esq.append(aux)
        else:
            dir_.append(aux)

    esq = quick_sort(esq)
    dir_ = quick_sort(dir_)

    return esq + dir_

def main():
    
    lista : list = []
    create_list(lista)
    
    lista = quick_sort(lista)
    


if __name__ == "__main__":
    main()



