import math
from threading import Thread

x = 0
y = 1
menor = math.inf



def distância(ponto1 : tuple , ponto2: tuple) -> float:
    global x, y 

    x1_aux = ponto1[x]
    x2_aux = ponto2[x]
    y1_aux = ponto1[y]
    y2_aux = ponto2[y]

    x_aux = x1_aux - x2_aux
    y_aux = y1_aux - y2_aux

    dist =  (x_aux * x_aux) + (y_aux * y_aux)
   

    return math.sqrt(dist)

def merge_point(lista: list) -> float:
    global menor

    if len(lista) <= 1:
        return lista
    
    metade  = int(len(lista)/2)
    esq : list = lista[:metade]
    dir_ : list = lista[metade:]
    
    esqTread = Thread(target=merge_point, args=[esq])
    dirTread = Thread(target=merge_point, args=[dir_])
    esqTread.start
    dirTread.start
    esqTread.join


    for aux in esq:
        for aux2 in dir_:
            dist = distância(aux, aux2)
            if  dist < menor:
                menor = dist
    
    return menor

def interface(pontos : list, quantidade : int, i : int):
    while quantidade != 0:
        pontos.append([]) 
        if 0 <= quantidade <= 10000:
            pass
        else:
            exit()
        
        contador : int = 0

        while contador < quantidade: 
            cordenadaXY = input().split()
            x = int(cordenadaXY[0])
            y = int(cordenadaXY[-1])
            pontos[i] += [(x,y)]
            contador += 1
        i += 1 
        quantidade = int(input())

def main():

    pontos : list = []
    quantidade = int(input())
    i : int = 0

    interface(pontos, quantidade, i)

    for aux in pontos:
        if len(aux) > 1:
            distância = merge_point(aux)
            if distância > 10000.0:
                print("INFINITY")
            else:
                print(distância)    
        else:
            print("0.0")
        
                

if __name__ =='__main__':
    main()

