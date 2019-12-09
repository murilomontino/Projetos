from random import randint
import math


def create_list(tam: int):
    lista : list = []
    for aux in range(tam):
        lista.append(randint(0,100000))
    return lista

def merge_sort(lista: list):
    
    if len(lista) <= 1:
        return lista
    
    metade  = int(len(lista)/2)
    esq : list = lista[:metade]
    dir_ : list = lista[metade:]
    
    esq = merge_sort(esq)
    dir_ = merge_sort(dir_)

    ord_lista : list = []
   
    tam_esq = 0
    tam_dir = 0
    maximo = len(esq) + len(dir_)

    esq.append(math.inf)
    dir_.append(math.inf)

    while tam_esq + tam_dir < maximo:
        if esq[tam_esq] < dir_[tam_dir]:
            ord_lista.append(esq[tam_esq])
            tam_esq += 1
        else:
            ord_lista.append(dir_[tam_dir])
            tam_dir += 1



    return ord_lista

def main():
    queijo : list = create_list(100)
    queijo = merge_sort(queijo)
    print("Ordenado: ", queijo)

if __name__ == "__main__":
    main()



