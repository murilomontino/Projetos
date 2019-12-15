#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <time.h>


using namespace std;


int* quick(int* lista, int tam, int inicio){

    int metade = (tam+inicio)/2;
    int pivo = lista[metade];
    int left = inicio;
    int right = tam-1;

    int contador = inicio;
    while(contador < tam){
        if(lista[contador]< pivo){

           int aux = lista[left];
           lista[left] = lista[contador];
           lista[contador] = aux;
           left++;


        }
        else{
           int aux = lista[right];
           lista[right] = lista[contador];
           lista[contador] = aux;
           right--;
           contador++;

        }

    }

return lista;


}

int* sorted(int lista[], int fim, int start, int tam){
    int metade = (fim+start)/2;
    if (tam <= 1){
        return lista;
    }

    lista = quick(lista, tam, start);

    sorted(lista, metade, start, (tam/2));
    sorted(lista, fim, metade-1, (tam/2));
    return lista;

}

int main() {
    // cout << ("digite um numero: \n");
    // cin >> numero >> queijo ;
    srand(time(NULL));
    int tam = 8 ;
    int lista[tam] = {2,-2, 3, 6, 0, -1, 3, -2};
    //quick(lista,tam, 0);
    sorted(lista, tam, 0, tam);
    for(int i = 0; i < tam; i++){
        cout << lista[i] << endl;
        }

return 0;
}
