import math

x = 0
y = 1

def distância(ponto1 : tuple , ponto2: tuple):
    global x, y 

    x1_aux = ponto1[x]
    x2_aux = ponto2[x]
    y1_aux = ponto1[y]
    y2_aux = ponto2[y]

    x_aux = x1_aux - x2_aux
    y_aux = y1_aux - y2_aux

    dist =  (x_aux * x_aux) + (y_aux * y_aux)
   

    return math.sqrt(dist)

def par_próximo(pontos : list ) -> float:
    global x, y
    
    tam : int = len(pontos)
    
    if tam <= 1:
        return 0.0

    pontos.sort()
    j : int = 1
    i : int = 0

    menor_distancia = math.inf

    while j < tam:
        ponto_a = (pontos[i][x], pontos[i][y])
        ponto_b = (pontos[j][x], pontos[j][y])
        
        menor : float = distância(ponto_a, ponto_b)

        if menor < menor_distancia: 
            menor_distancia = menor 
        j += 1
        i += 1

    return menor_distancia

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
        distância = par_próximo(aux)
        if distância > 10000:
            print("INFINITY")
        else:
            print(distância)    
                

if __name__ =='__main__':
    main()

