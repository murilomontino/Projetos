import csv
import os

#cria uma lista com o nome dos arquivos, encontrados na pasta raiz, com extensão '.csv'
lista_csv : list = [aux for aux in os.listdir() if '.csv' in aux] 


#pega cada arquivo, um por vez, e executa o código abaixo:
for nome_arq in lista_csv:

    #abre o arquivo com respectivo nome
    arquivo = open(nome_arq)
    #transforma os elementos do arquivo em uma lista de string
    lista : list = list(csv.reader(arquivo, delimiter=';'))
    #deleta as linhas inúteis 
    del(lista[:4])
    #criei essa lista para ter apenas os valores que serão importantes (frequencia, impedância real, impedância imaginária)
    resul : list = []

    #Para cada linha da lista ele faz:
    for linha in lista:
        #adiciona os elementos na lista 'resul', sendo apenas as principais colunas = (frequencia, impiedância real, inpiedância imaginária)
        # 4,10, 11 são as colunas que estavam os respectivos valores ditos acima e na ordem.
        resul += [   [   linha[4], linha[10], linha[11]  ]  ]
        
    #converte para txt
    valor_str = nome_arq.replace('csv', 'txt')

    #salva todos os elemntos no arquivo txt, se não houver, ele cria um:
    try:
        arquivo = open(valor_str, 'w+')
        for aux in resul:
            #junta os elementos, separandos por espaço = ' ' e finaliza a linha com uma quebra = '\n'
            linha : str = [' '.join(aux) + '\n']
            #escreve o que foi modulado no arquivo
            arquivo.writelines(linha)
            
    except FileNotFoundError:
        
        arquivo = open(valor_str, 'w+')

        for aux in resul:
            #junta os elementos, separandos por espaço = ' ' e finaliza a linha com uma quebra = '\n'
            linha : str = [' '.join(aux) + '\n']
            #escreve o que foi modulado no arquivo
            arquivo.writelines(linha)
        
    arquivo.close()


