q= input("Inserte magnitud de las cargas(valor absoluto)");
X1= input("Inserte posición x de las cargas positivas ");
X2= input("Inserte posición x de las cargas negativas ");
lampos = input("Inserte distancia de diferencia entre cargas positivas");
lamneg = input("Inserte distancia de diferencia entre cargas negativas");
n=5;
ypos = 0-(lampos*floor(n/2)):lampos:0+(lampos*floor(n/2));
yneg = 0-(lamneg*floor(n/2)):lamneg:0+(lamneg*floor(n/2));
d= abs(X1-X2);
if X1 < X2
    xs= X1-d:0.1:X2+d;
else
    xs = X2-d:0.1:X1+d;
end
if lampos > lamneg
    ys = -lampos*n-(d/2):0.1:lampos*n+(d/2);
else
    ys = -lamneg*n-(d/2):0.1:lamneg*n+(d/2);
end

[x,y]=meshgrid(xs,ys);
k=9e9;
Extot=0;
Eytot=0;
for i=1:n
Expos= k.*(((x-X1).*q)./(((x-X1).^2+(y-ypos(i)).^2).^(3/2)));
Eypos= q.*k.*(y-ypos(i)).*(1./(((x-X1).^2+(y-ypos(i)).^2).^(3/2)));
Exneg= k.*(((x-X2).*(-q))./(((x-X2).^2+(y-yneg(i)).^2).^(3/2)));
Eyneg= -q.*k.*(y-yneg(i)).*(1./(((x-X2).^2+(y-yneg(i)).^2).^(3/2)));
Extot= Extot+Expos+Exneg;
Eytot= Eytot+Eypos+Eyneg;
end
magnitud = (Extot.^2+Eytot.^2).^(1/2);
Extot= Extot./magnitud;
Eytot=Eytot./magnitud;

quiver(x,y,Extot,Eytot)

r=0.1;
t=0:0.1:2*pi;

grid on;
for i=1:n
xc=r*cos(t)+X1;
yc=r*sin(t)+ypos(i);
patch(xc,yc,'red')
xc=r*cos(t)+X2;
yc=r*sin(t)+yneg(i);
patch(xc,yc,'black')
end
