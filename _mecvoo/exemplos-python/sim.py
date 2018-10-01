#!/usr/bin/env python3

"""Exemplo de simulação de equações diferenciais ordinárias com Scipy/Numpy."""


import numpy as np
from matplotlib import pyplot
from scipy import integrate


def f(x, u):
    """Função de simulação do oscilador de Duffing."""
    
    # Define os parâmetros do sistema
    a = 1 
    b = -1
    d = 0.2
    
    # Desempacota os vetores
    x1, x2 = x
    u1, = u
    
    # Calcula a derivada das variáveis de estado
    x1ponto = x2
    x2ponto = -d*x2 - b*x1 - a*x1**3 + u1
    
    # Monta o vetor x ponto, saída da função
    return [x1ponto, x2ponto]
    

def fp_ent_sen(t, x):
    """Função de simulação para entrada senoidal."""
    u = [0.3 * np.cos(t)]
    return f(x, u)


def fp_ent_nula(t, x):
    """Função de simulação para entrada nula."""
    u = [0]
    return f(x, u)


if __name__ == '__main__':
    # Simula os sistemas
    t_interv = [0, 30]
    x_inicial = [0, 1]
    options = {'max_step': 0.05}
    sol_nula = integrate.solve_ivp(fp_ent_nula, t_interv, x_inicial, **options)
    sol_sen = integrate.solve_ivp(fp_ent_sen, t_interv, x_inicial, **options)

    # Plota os gráficos
    pyplot.plot(sol_nula.y[0], sol_nula.y[1],
                sol_sen.y[0], sol_sen.y[1])
    pyplot.xlabel('t [s]')
    pyplot.title('Evolução temporal dos estados')
    pyplot.legend(['$u=0$', '$u=0.3 \cos(t)$'])
    
    # Salva o gráfico
    pyplot.savefig('sim-duffing-py.svg')
    

