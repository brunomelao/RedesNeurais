clear; close all; clc;
format long; 

% Declaração de entradas e saidas conhecidas
x0=ones(1,30);
x=(load('dadosEntrada.mat').x)';
d=(load('dadosSaida.mat').d)';

% Inicializar pesos de maneira aleatória
w=rand(1,3);
b=rand(1,1);

% Aplicando o Neuronio Artificial pela primeira vez, usando funcao sinal
u=w*x+b*x0;
y=sign(u);

% Cálculo do Erro
Erro=(sum(d-y)^2)/2;

%Definindo a tolerancia,a taxa de aprendizagem e a epoca do treinamento do
%neuronio
tol=0;
taxaAprend=0.01;
epoca=0;

%Loop para encontrar os melhores pesos e bias
while Erro>tol
    epoca=epoca+1;
    
    %Cálculo do gradiente do Erro em relação a w e b
    delta=-(d-y)*(1); % delta = dE/dy*dy/du 
    dEw=delta*x'; 
    dEb=delta*x0';
    
    %Atualizacao dos pesos e bias
    w=w-taxaAprend*dEw;
    b=b-taxaAprend*dEb;
    
    %Novo calculo do neuronio 
    u=w*x+b*x0;
    y=sign(u);
    
    %Atualização do erro
    Erro=(sum(d-y)^2)/2;
    
end

disp('Pesos do menor erro:');
disp(w);
disp('Bias do menor erro:');
disp(b);
disp('Época com o menor erro:');
disp(epoca);
disp('Menor erro encontrado:');
disp(Erro);

%Testes com pesos calculados pelo neuronio
x=[-1.3970
0.7141
4.9263
];
u=w*x+b*1;
y=sign(u)
if(y==-1)
    disp('Classe 1');
end
if (y==1)
    disp('Classe 2');
end
