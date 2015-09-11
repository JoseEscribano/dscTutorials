% MAIN.m  --  Three Mass Periodic Orbits 
%
% This script uses bvp4c to find periodic trajectories for three
% point-masses in 3D space with newtonian gravity.
%
% The solution to this problem was discovered by Montgomery in
%
%

% Physical Parameters
P.G = 1.0;   %Gravity Constant
P.m1 = 1.0;  %mass one
P.m2 = 1.0;  %mass two
P.m3 = 1.0;  %mass three

% Create an initial guess
tInit= linspace(0,1,10);
x1 = [-1; 0.25; 0];
x2 = [1; -0.25; 0];
x3 = [0; 0; 0];
v1 = [1; 1; 0];
v2 = [-1; -1; 0];
v3 = [-1; -1; 0];
solnInit = bvpinit(tInit, [x1; x2; x3; v1; v2; v3]);

% Create function handles:
odeFun = @(t,x)( dynamics(x,P) );
bcFun = @(x0,xF)( boundaryConditions(x0,xF) );

% Options:
options = bvpset(...
    
);

% Solve with 4th-order collocation:
soln = bvp4c(odeFun,bcFun,solnInit);
