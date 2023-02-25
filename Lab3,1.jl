using OrdinaryDiffEq
using Plots


#начальные условия
x0 = 80000#численность первой армии
y0 = 60000#численность второй армии
a = 0.267#константа, характеризующая степень влияния различных факторов на потери
b = 0.687#эффективность боевых действий армии у
c = 0.349#эффективность боевых действий армии х
h = 0.491#константа, характеризующая степень влияния различных факторов на потери
tspan = (0.0, 10)


#Система дифференциальных уравнений
function f(dy, y, p, t)
    P = sin(2t)
    Q = cos(t)
    dy[1] = - a*y[1] - b*y[2] + abs(P)#изменение численности первой армии
    dy[2] = - c*y[2] - h*y[2] + 2*abs(Q)#изменение численности второй армии
end


v0 = [x0;y0]#Вектор начальных условий
#Решение системы
prob = ODEProblem(f, v0, tspan)
sol = solve(prob,Tsit5())
#Построение графиков решений

plot(sol,linewidth=2,title="Сражение",
     xaxis="Время",yaxis="Численность армии",label="Армия") # legend=false