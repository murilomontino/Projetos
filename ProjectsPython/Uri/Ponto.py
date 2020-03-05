import math

class Ponto(tuple):
    def __init__(self, x : float, y: float):
        self._x = x
        self._y = y
    
    @property
    def x(self):
        return x
    
    @property
    def y(self):
        return y
    @setattr
    def x(self, value):
        self._x = value

    @setattr
    def y(self, value):
        self._y = value
    
    def __iter__(self):
        return super().__iter__()

    
    @staticmethod
    def euclides(self, ponto_a: Ponto, ponto_b: Ponto) -> float:
        x = ponto_b.x - ponto_a.x
        y = ponto_b.y - ponto_a.y
        resul = pow(x, 2) - pow(y, 2)
        return resul



def pegando_pontos():
    pontos: list = []
    quantidade = int(input())
    input



def calculando():
    pass

def main():
    Lista_de_pontos = pegando_pontos()

if __name__ == "__main__":
    main()