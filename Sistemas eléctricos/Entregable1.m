%q = input("Inserte el valor de la carga (C):");
%x1= input("Inserte el valor de el punto en x en el que se encuentra la carga (m):");
%y1=input("Inserte el valor de el punto en y en el que se encuentra la carga(m):");
%disp("En esta instancia se toma que la segunda carga se encuentra a una distancia d en el eje x");
%d = input("Inserte el valor de distancia d (m)");
q=1.6e-19;
x1=2;
y1=2;
d=0.5;
x2=x1+d;

k=9e9;
[x,y]=meshgrid((x1-d/2):0.1:(x2+d/2),y1-d:0.1:y1+d);
Ex= k.*(((x-x1).*q)./(((x-x1).^2+(y-y1).^2).^(3/2))-(q.*(x-x2))./((x-x2).^2+(y-y1).^2).^(3/2) );
Ey= q.*k.*(y-y1).*(1./(((x-x1).^2+(y-y1).^2).^(3/2)) - 1./(((x-x2).^2+(y-y1).^2).^(3/2)));

magnitud = (Ex.^2+Ey.^2).^(1/2);
Ex= Ex./magnitud;
Ey=Ey./magnitud;
quiver(x,y,Ex,Ey)

r=0.1;
t=0:0.1:2*pi;
xc=r*cos(t)+x1;
yc=r*sin(t)+y1;
patch(xc,yc,'red')
patch(xc+d,yc,'black')
grid on;


