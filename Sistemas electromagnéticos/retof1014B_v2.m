clear,cla

h = 1; %Diferencial
a = 3; %Radio de la espira
mu0 = (4*pi)*(10^-7); %Permeabilidad del espacio libre
I = 5*(10^7); %Magnitud de la corriente

%Creamos arreglos para los valores de Y y Z, calcularemos el campo hasta 3 veces el radio de la espira
[y,z] = deal(0:h:3*a);

%Hacemos una cuadrícula creando 2 matrices para Y y Z
[j,k] = meshgrid(y,z);

%Definimos 2 matrices para los campos
Byt = zeros(length(j),length(j));
Bzt = zeros(length(j),length(j));

%Creamos un ciclo for para evaluar la integral de la espira desde 0 hasta 2π
for t = 0:0.01:pi/2

    %Se obtiene el valor de r
    r = sqrt(((a.*cos(t)).^2)+((j-a.*sin(t)).^2) + k.^2);

    %Se implementa la ecuación para los campos magnéticos
    By = (mu0*I/(4*pi)).*k.*a.*(cos(t)./(r.^3));
    Bz = (mu0*I/(4*pi)).*a.*( (a./(r.^3)) - ((j.*sin(t)./(r.^3)))); 

    %Acumulamos los valores para la integral
    Byt = Byt + By; 
    Bzt = Bzt + Bz; 

end

%Se obtiene la magnitud del campo magnético
B = sqrt((Byt.^2)+(Bzt.^2)); 

%Se normalizan los campos magnéticos
Byn = h.*Byt./(1.2.*B); 
Bzn = h.*Bzt./(1.2.*B); 

%Creamos la espira circular 
ex = a*cos(0:0.1:2*pi); 
ey = 0.1*a*sin(0:0.1:2*pi);

%Dividimos el plot
ax = subplot(1,2,1);
hold on

%Se gráfica la espira en el eje (0,0) en la gráfica resultante
plot(ax,ex,ey,'DisplayName','Espira'); 

%Se gráfica el campo magnético en (y,z) para los cuatro cuadrantes
quiver(ax,y,z,Byn,Bzn,'DisplayName','Primer Cuadrante') 
quiver(ax,-y,z,-Byn,Bzn,'DisplayName','Segundo Cuadrante') 
quiver(ax,-y,-z,Byn,Bzn,'DisplayName','Tercer Cuadrante') 
quiver(ax, y,-z,-Byn,Bzn,'DisplayName','Cuarto Cuadrante')

%Formateamos la gráfica
title(ax,"Campo magnético")
xlabel(ax,"Eje Y (metros)")
ylabel(ax,"Eje Z (metros)")
legend(ax)


hold off

%Dividimos el plot
ax = subplot(1,2,2);
hold on

%Se grafica la espira en el eje (0,0) en la gráfica resultante
plot(ax,ex,ey,'DisplayName','Espira');

%Se gráfica el campo magnético en (y,z) para el primer cuadrante
quiver(ax,y,z,Byn,Bzn,'DisplayName','Campo Magnético')
axis(ax,[0 3*a 0 3*a])

%Formateamos la gráfica
title(ax,"Primer cuadrante del campo magnético")
xlabel(ax,"Eje Y (metros)")
ylabel(ax,"Eje Z (metros)")
legend(ax)

hold off
