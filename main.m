

%%
% Problem: Shrimp Diet Mix

% Initial setup
clc;
clear;

% Setting up lower and upper boundaries of the problem
x1 = optimvar('x1','type','integer','LowerBound',0,'UpperBound',Inf); % Feed 1
x2 = optimvar('x2','type','integer','LowerBound',0,'UpperBound',Inf); % Feed 2
x3 = optimvar('x3','type','integer','LowerBound',0,'UpperBound',Inf); % Feed 3
x4 = optimvar('x4','type','integer','LowerBound',0,'UpperBound',Inf); % Feed 4
x5 = optimvar('x5','type','integer','LowerBound',0,'UpperBound',Inf); % Feed 5
x6 = optimvar('x6','type','integer','LowerBound',0,'UpperBound',Inf); % Feed 6
x7 = optimvar('x7','type','integer','LowerBound',0,'UpperBound',Inf); % Feed 7
x8 = optimvar('x8','type','integer','LowerBound',0,'UpperBound',Inf); % Feed 8
multiplier = 1.2
c1 = 22*multiplier
c2 = 32*multiplier
c3 = 35*multiplier
c4 = 25.4*multiplier
c5 = 32.5*multiplier
c6 = 32.5*multiplier
c7 = 30.5*multiplier
c8 = 24.6*multiplier

% Declaring objective function, problem object
prob = optimproblem('Objective', c1*x1 + c2*x2 + c3*x3 + c4*x4 + c5*x5 + c6*x6 + c7*x7 + c8*x8, 'ObjectiveSense', 'min');

% Setting up Constraints
prob.Constraints.c1 = 38*x1 + 37*x2 + 40*x3 + 36*x4 + 36*x5 + 36*x6 + 36*x7 + 35*x8 >= 45.97; % Protein Constraint
prob.Constraints.c2 = 3*x1 + 3.5*x2 + 6*x3 + 2.8*x4 + 3*x5 + 3.5*x6 + 3.5*x7 + 4*x8 >= 13.65; % Fat Constraint
prob.Constraints.c3 = 3*x1 + 4*x2 + 3*x3 + 3*x4 + 3*x5 + 4.5*x6 + 4.5*x7 + 3*x8 >= 12.3; % Fiber Constraint
prob.Constraints.c4 = 17*x1 + 15*x2 + 12*x3 + 16*x4 + 17*x5 + 17*x6 + 15*x7 + 15*x8 >= 15.32; % Ash Constraint
prob.Constraints.c5 = 13*x1 + 10*x2 + 12*x3 + 13*x4 + 12*x5 + 10*x6 + 10*x7 + 10*x8 >= 7.22; % Moisture Constraint
prob.Constraints.c6 = 26*x1 + 30.5*x2 + 27*x3 + 29.2*x4 + 29*x5 + 29*x6 + 31*x7 + 33*x8 >= 17.84; % Carbohydrate Constraint

% Converting problem object to problem structure
Prob = prob2struct(prob);

% Solving the resulting problem structure
[sol,fval,exitflag,output] = intlinprog(Prob);

sol, fval
