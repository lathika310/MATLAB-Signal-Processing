% Lathika Sooriyapperuma 500904706 | ELE532 Signals and Systems 1 | Lab 1 |
% Section 01

clc;

%% Problem A.1
clear;

f = @(t) exp(-t).*cos(2*pi*t);
t=(-2:2);
f(t);
figure(); plot(t,f(t)); xlabel('t'); ylabel('f(t)'); grid;
t = (-2:0.01:2);
figure(); plot(t,f(t)); xlabel('t'); ylabel('f(t)'); grid;

%% Problem A.2
clear;

t = [-2:2];
f = @(t) exp(-t);
figure(); plot(t, f(t));
xlabel('t'); ylabel('f(t)'); grid;

%Problem A.3

% The resultant graph is identical to that of fig 1.46. This is a result of
% the period of the cos function(T=1), which results the cos piece being
% 1 at each of the intervals that are plotted as a result of using t(-2:2),
% which only contains integers.

%% Problem B.1
clear;

p = @(t) 1.0*((t>=0)&(t<1));
t=(-2:0.01:2);
figure(); plot(t,p(t));
xlabel('t'); ylabel('p(t) = u(t)-u(t-1)'); axis([-1 2 -.1 1.1]);

%% Problem B.2
clear;

t=(-2:0.01:4);
p = @(t) 1.0.*((t>=0)&(t<1));
r = @(t) t.*p(t);
n = @(t) r(t) + r(-t+2);

figure('Name','r(t)'); plot(t,r(t)); 
xlabel('t'); ylabel('r(t)'); grid;
axis([-1 3 -.1 1.1]);

figure('Name','n(t)'); plot(t,n(t));
xlabel('t'); ylabel('n(t)'); grid;
axis([-1 3 -.1 1.1]);

%% Probelm B.3
clear;

t=(-3:0.01:5);
p = @(t) 1.0.*((t>=0)&(t<1));
r = @(t) t.*p(t);
n = @(t) r(t) + r(-t+2);

n1 = @(t) n(0.5.*t);
n2 = @(t) n1(t+0.5);

figure('Name','n1(t)'); plot(t,n1(t)); 
xlabel('t'); ylabel('n1(t)'); grid;
axis([-3 5 -.1 1.1]);

figure('Name','n2(t)'); plot(t,n2(t)); 
xlabel('t'); ylabel('n2(t)'); grid;
axis([-3 5 -.1 1.1]);

%% Problem B.4
clear;

t=(-3:0.01:5);
p = @(t) 1.0.*((t>=0)&(t<1));
r = @(t) t.*p(t);
n = @(t) r(t) + r(-t+2);

n3 = @(t) n(t+0.25);
n4 = @(t) n3(0.5.*t);

figure('Name','n3(t)'); plot(t,n3(t)); 
xlabel('t'); ylabel('n3(t)'); grid;
axis([-3 5 -.1 1.1]);

figure('Name','n4(t)'); plot(t,n4(t)); 
xlabel('t'); ylabel('n4(t)'); grid;
axis([-3 5 -.1 1.1]);

%Problem B.5

%The graphs are the same as we would expect since when the horizontal shift
%is performed before the horizontal stretch, the horizontal resulting
%horizontal shift (when compared to an un altered graph of the function
%with no transformations) will also be stretched. Since the it was 1/4, it
% became 1/2 just like in graph n2, resulting in the n2 and n4 being
% identical.

%% C.1 
clear;

f = @(t) exp((-2).*t).*cos((4*pi).*t);
u = @(t) 1.0.*(t>=0);
g = @(t) f(t).*u(t);
t = (-2:0.01:4);

figure(); plot(t,g(t));
xlabel('t'); ylabel('g(t) = f(t)u(t)'); axis([-1 3 -1.1 1.1]); grid;

%% C.2 
%using the equation explicity defined ( not g(t+1) ).
clear;

u = @(t) 1.0.*(t>=0);
t = (-2:0.01:4);

s = @(t) exp(-2).*exp(-2*t).*cos(4*pi*t).*u(t);

figure(); plot(t,s(t));
xlabel('t'); ylabel('s(t) = (e^-2)(e^-2t)cos(4pi*t)u(t+1)'); grid;

%% C.3
clear;

t = (0:0.01:4);
u = @(t) 1.0.*(t>=0);

for al= [1 3 5 7]
    s = @(t) exp(-2).*exp(-al*t).*cos(4*pi*t).*u(t);
    plot(t,s(t));
    hold on;
end

xlabel('t'); ylabel('s(t)'); grid;

%Problem C.4. | Lathika Sooriyapperuma 500904706

% The size of matrix effectively generated is |alpha|x|t|, which is 4x401.

%% D.1
clear;
load('ELE532_Lab1_Data.mat');

A(:)    
%Returns all elements in a column vector.
%In the order of (0,0), ... , (0,n-1), (1,0), ..., (1, n-1), ..., (m-1,n-1)
%for an element with indicies (a,b) where a is the row and b is the column, 
%and m is the number of rows the matrix has and n is the number of columns

A([2 4 7 ]) 
%returns the 2nd 4th and 7th elements in the column vector described above

[ A >= 0.2 ]
%If each element is greater or equal to 0.2, its corresponding element will
%be 1 to indicate true, and if it is not, it will be 0 to indicate false

A([ A >= 0.2]) 
%returns all of the elements greater or equal to 0.2

A([ A >= 0.2]) = 0
%Sets all those elements greater or equal to 0.2 to 0

%% D.2
clear;
load('ELE532_Lab1_Data.mat');

%a) -----------------------------------------------------------------------
tic;
for n = 1:1024
    for m = 1:100 
        if abs(B(n,m)) < 0.01
            B(n,m)=0;
        end
    end
end
toc

%b)------------------------------------------------------------------------
clear;
load('ELE532_Lab1_Data.mat');

tic;
B([abs(B)<0.01])=0;
toc

%c)------------------------------------------------------------------------

% Following a test on my Lenovo Thinkpad T470,

%   Nested Loop: 0.004144 seconds
%   Command: 0.001145 seconds

% The in-built command was far quicker, and consistently was upon
% subsequent tests.

%% D.3
clear;

load('ELE532_Lab1_Data.mat');
y = x_audio;
y([ abs(y) <= 0.03]) = 0;
sound(y,8000)
NumberOfZeroes = height(y([ y == 0])) 
