from random import randint

def create_list(lista : list):
    for aux in range(100):
        lista.append(randint(0,100000))
    return lista

def quick_sort(lista: list):
    
    if len(lista) <= 1:
        return lista
    
    esq : list = []
    dir_ : list = []
    pivo : int = lista[randint(0, len(lista)-1 )]
    
    for aux in lista:
        if aux < pivo:
            esq.append(aux)
        else:
            dir_.append(aux)

    esq = quick_sort(esq)
    
    dir_ = quick_sort(dir_)

    return esq + dir_

def main():
    queijo : list = []
    create_list(queijo)
    queijo = quick_sort(queijo)
    print("Ordenado: ", queijo)

if __name__ == "__main__":
    main()



