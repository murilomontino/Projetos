
def main():

    pontos : list = []
    quantidade : int = int(input())
    
    
    while quantidade != 0:

        if 0 <= quantidade <= 10000:
            pass
        else:
            exit()
        
        contador : int = 0

        while contador < quantidade:
            cordenadasXY : list = input().split
            cordenadasXY[0] = int(cordenadasXY[0])
            cordenadasXY[-1] = int(cordenadasXY[-1])
            pontos.append(cordenadasXY)
            contador += 1
        
        

if __name__ =='__main__':
    main()

