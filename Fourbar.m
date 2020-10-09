%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Solution for Inverse relation of four bar mechanism
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all  % 
clc     %   
close all
d1=15;   % Incomplete Linkage LINK 1
d2=18;   % Incomplete Linkage LINK 2
d3=13;   % open KInematic chain LINK 1
d4=16;   % Open Kinematic chain LINK 2
x1=0;
y1=0;
x4=d4;
y4=0;
l5=15;
l6=15;
omega=2*pi;
j=1; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
hFig = figure(1);
set(hFig, 'Position', [0.1 0.7 900 700]);     
m=moviein(400);
for t=0:0.01:1
    theta3(j)=omega*t;  
    t_vect(j)=t;
    k1=sin(theta3(j));
    k2=(d4/d3)+cos(theta3(j));
    k3=(d4/d1)*cos(theta3(j))+(d4^2+d3^2+d1^2-d2^2)/(2*d3*d1);
    theta1(j)=2*atan((k1+sqrt(k1^2+k2^2-k3^2))/(k2+k3));   
    theta1_2(j)=2*atan((k1-sqrt(k1^2+k2^2-k3^2))/(k2+k3));
    theta1_d=theta1.*180/pi;
    theta3_d=theta3.*180/pi;
    GC=k1^2+k2^2-k3^2;    
    if GC<0 
        continue            
     end  
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
    x2(j)=d1*cos((theta1(j)));
    y2(j)=d1*sin((theta1(j)));
    x3(j)=x4+d3*cos(theta3(j));
    y3(j)=y4+d3*sin(theta3(j)); 
    x5(j)=x1-l5;
    y5(j)=y1;
    x6(j)=x3(j)+l6*cos(theta3(j));
    y6(j)=y3(j)+l6*sin(theta3(j));
    
    %%%%%%%    Start simulation    
    subplot(2,2,4);          
    x12=[x1,x2(j)];
    y12=[y1,y2(j)];
    x23=[x2(j),x3(j)];
    y23=[y2(j),y3(j)];
    x34=[x3(j),x4];
    y34=[y3(j),y4];
    x41=[x4,x1];
    y41=[y4,y1];
    x15=[x1,x5(j)];
    y15=[y1,y5(j)];
    x36=[x3(j),x6(j)];
    y36=[y3(j),y6(j)];
    line(x12, y12,'linewidth',4,'color','k')  
    line(x23, y23,'linewidth',4,'color','k')
    line(x34, y34,'linewidth',4,'color','b')
    line(x41, y41,'linewidth',4,'color','b')
%     line(x15,y15,'linewidth',4,'color','b')
%     line(x36,y36,'linewidth',4,'color','b')
    axis([-20 40 -20 40]);  
    title('Simulation');
    grid on;
    hold on;
    xlabel('mm')
    ylabel('mm')
    plot(x1,y1,'o','linewidth',5);
    plot(x2(j),y2(j),'o','linewidth',5);
    plot(x3(j),y3(j),'o','linewidth',5);
    plot(x4,y4,'o','linewidth',5); 
    text(x3(j),y3(j),[' (',num2str(x3(j),3),',',num2str(y3(j),3),')'])
    text(x2(j),y2(j),[' (',num2str(x2(j),3),',',num2str(y2(j),3),')'])
    m(j)=getframe;    
    clf; 
    j=j+1; 
    
    subplot(2,2,1);
    plot(theta3.*180/pi,theta1.*180/pi,'linewidth',1) % plot theta 1 VS theta 3
    title('Fig.a (Inverse relation \theta_1 as function of \theta_3)')
    xlabel('\theta_3 in deg.','linewidth',5)
    ylabel('\theta_1=f(\theta_3)')
    axis([0 400 0 200])
    grid on;     
    subplot(2,2,2);
    plot(t_vect,theta1.*180/pi,'linewidth',3);
    hold on;
    title('Fig.b (\theta_1 as function of time)')
    xlabel('time','linewidth',3)
    ylabel('\theta_1 in degree')
    axis([ 0 1 0 200]);
    grid on;
    subplot(2,2,3);
    plot(theta3.*180/pi,theta1_2.*180/pi,'linewidth',3) % plot theta 1 VS theta 3
    title('Fig.c (Negative square root of \theta_1 as function of \theta_3)')
    xlabel('\theta_3 in deg.','linewidth',5)
    ylabel('\theta_1=f(\theta_3)')
    axis([0 400 -200 0])
    grid on;  
   
end 
% movie(m)
% movie2avi(m,'fourbar.avi');
  


    