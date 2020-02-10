
menor : float = 99999999999999

def distancia(ponto_1 : tuple , ponto_2: tuple) -> float:

    x = ponto_1[0] - ponto_2[0]
    y = ponto_1[-1] - ponto_2[-1]
    dist =  (x * x) + (y * y)

    return dist

def forcabruta(lista : list) -> int:
    ponto_a: tuple = lista[0]
    ponto_b: tuple = lista[1]
    ponto_c: tuple = lista[-1]

    if len(lista) == 3:


        a_B = distancia(ponto_a, ponto_b)
        b_C = distancia(ponto_b, ponto_c)
        c_A = distancia(ponto_a, ponto_c)

        if c_A >= a_B <= b_C:
            return a_B
        elif a_B >= b_C <= c_A:
            return b_C
        else:
            return c_A

    else:
        return distancia(ponto_a, ponto_b)


def merge_point(lista_x: list, lista_y: list):
    global menor

    if len(lista_x) <= 3:
        dist_menor = forcabruta(lista_x)
        menor = dist_menor if dist_menor < menor else menor
        return lista_x

    metade = int(len(lista_x) / 2)
    esquerda_x : list = lista_x[:metade]
    direita_x : list = lista_x[metade:]

    esquerda_y : list = [aux for aux in lista_y if aux in esquerda_x]
    direita_y : list =  [aux for aux in lista_y if aux in direita_x]

    esquerda_x = merge_point(esquerda_x, esquerda_y)
    direita_x = merge_point(direita_x, direita_y)


    for esquerda in esquerda_y:
        for direita in direita_y:
            dist_menor : float = distancia(esquerda, direita)
            if dist_menor >= menor:
                break
            else:
                menor = dist_menor


        

    return  lista_x
   

pontos : list = []
quantidade = int(input())
i : int = 0

while quantidade != 0:
        pontos += [ [] ]
        if 0 <= quantidade <= 10000:
            pass
        else:
            exit()
        
        contador : int = 0

        while contador < quantidade: 
            cordenadaXY = input().split()
            x = float(cordenadaXY[0])
            y = float(cordenadaXY[-1])
            pontos[i] += [(x,y)]
            contador += 1
      
        i += 1
        quantidade = int(input())



for aux in pontos:
        menor = 99999999999999
        if len(aux) > 1:
            OrdenadoX : list = sorted(aux)
            OrdenadoY : list = sorted(aux ,key=lambda aux: aux[1]) 
            merge_point(OrdenadoX, OrdenadoY)
            
            if menor > 100000000.0:
                print("INFINITY")
            else:
                print("%.4f" % (menor**0.5))
        else:
            print("INFINITY")
        
                

