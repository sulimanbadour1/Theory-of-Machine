clear;clc;
% Enter given datum
l1=100;
l2=300;
e=0;
hd=pi/180;
du=180/pi;
omega1=10;
alpha1=0;
theta1=zeros(720);
% Use slider_crank to compute the required quantities
for n1=1:720
    theta1(n1)=(n1-1)*hd;
    [theta2(n1),s3(n1),omega2(n1),v3(n1),alpha2(n1),a3(n1)]=slider_crank(...
        theta1(n1),omega1,alpha1,l1,l2,e);
end
figure(1);
n1=1:720;

subplot(2,2,1);  %Plot the displacement figure;
[AX,H1,H2]=plotyy(theta1*du,theta2*du,theta1*du,s3);
set(get(AX(1),'ylabel'),'String','Angular displacement of link 2/\circ');
set(get(AX(2),'ylabel'),'String','Displacement of slider 3/mm');
xlabel('Angular displacement of crank 1\theta_1/\circ');
title('Displacement Figure');
grid on;

subplot(2,2,2); %Plot velocity figure;
[AX,H1,H2]=plotyy(theta1*du,omega2,theta1*du,v3);
set(get(AX(1),'ylabel'),'String','Angular velocity of link 2 /rad\cdots^{-1}');
set(get(AX(2),'ylabel'),'String','Velocity of slider 3/mm\cdots^{-1}');
xlabel('Angular displacement of crank 1\theta_1/\circ');
title('Velocity Figure');
grid on;

subplot(2,2,3);  %Plot acceleration figure;
[AX,H1,H2]=plotyy(theta1*du,alpha2,theta1*du,a3);
set(get(AX(1),'ylabel'),'String','Angular acceleration of link 2 /rad\cdots^{-2}');
set(get(AX(2),'ylabel'),'String','Acceleration of slider 3/mm\cdots^{-2}');
xlabel('Angular displacement of crank 1\theta_1/\circ');
title('Acceleration Figure');
grid on;

subplot(2,2,4); %Plot kinematic diagram of the machanism;
x(1)=0;
y(1)=0;
x(2)=l1*cos(70*hd);
y(2)=l1*sin(70*hd);
x(3)=s3(70);
y(3)=e;
x(4)=s3(70);
y(4)=0;
x(5)=0
y(5)=0;
x(6)=x(3)-40;
y(6)=y(3)+10;
x(7)=x(3)+40;
y(7)=y(3)+10;
x(8)=x(3)+40;
y(8)=y(3)-10;
x(9)=x(3)-40;
y(9)=y(3)-10;
x(10)=x(3)-40;
y(10)=y(3)+10;

i=1:5;
plot(x(i),y(i));
grid on;
hold on;
i=6:10;
plot(x(i),y(i));
title('crank-slider machanism');
grid on;
hold on;
xlabel('mm');
ylabel('mm');
axis([-50 400 -20 130]);
i=1:3;
plot(x(i),y(i),'o');

% simulation of crank-slider machanism
figure(2);

j=0;

for n1=1:5:360
    j=j+1;
    clf;
    x(1)=0;
    y(1)=0;
    x(2)=l1*cos(n1*hd);
    y(2)=l1*sin(n1*hd);
    x(3)=s3(n1);
    y(3)=e;
    x(4)=(l1+l2+50);
    y(4)=0;
    x(5)=0;
    y(5)=0;
    x(6)=x(3)-40;
    y(6)=y(3)+10;
    x(7)=x(3)+40;
    y(7)=y(3)+10;
    x(8)=x(3)+40;
    y(8)=y(3)-10;
    x(9)=x(3)-40;
    y(9)=y(3)-10;
    x(10)=x(3)-40;
    y(10)=y(3)+10;
    
    i=1:3;
    plot(x(i),y(i));
    grid on;
    hold on;
    i=4:5;
    plot(x(i),y(i));
    i=6:10;
    plot(x(i),y(i));
    i=1:3;
    plot(x(i),y(i),'o');
    title('crank-slider machanism');
    xlabel('mm');
    ylabel('mm');
    axis equal;
    axis([-150 450 -150 150]);
    m(j)=getframe;
end
movie(m,100);
movie2avi(m,'crank-slider.avi');




        
