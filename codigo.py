n = 4  # Valor adecuado de n
X = [0] * n  # Se inicializa X como una lista de ceros de longitud n
L1 = [[0] * n for _ in range(n)]  # Matriz L1
L2 = [[0] * n for _ in range(n)]  # Matriz L2
exito = False

def GrafosIguales(k, index):
    global exito
    if index == n:
        exito = True
        return
    for vertice in range(1, n + 1):
        X[k] = vertice
        if Valido(k):
            GrafosIguales(k + 1, index + 1)

def Valido(k):
    for i in range(1, k):
        if X[i] == X[k]:
            return False
    if NumArcos(L1, k) != NumArcos(L2, X[k]):
        return False
    for i in range(1, k):
        if (L2[X[i] - 1][X[k] - 1] != L1[i - 1][k - 1]) or (L2[X[k] - 1][X[i] - 1] != L1[k - 1][i - 1]):
            return False
    return True

def NumArcos(L, k):
    suma = 0
    for i in range(n):
        if (i != k) and (L[i][k - 1] < float('inf')):
            suma += 1
        if (i != k) and (L[k - 1][i] < float('inf')):
            suma += 1
    return suma

GrafosIguales(0, 0)
if exito:
    print("Los grafos son iguales")
else:
    print("Los grafos no son iguales")