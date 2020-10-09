a=3;
b=6;
t=0:0.05:10;
omega=2*pi;
theta=omega*t;
d=((2*a*cos(theta))+sqrt((2*a*cos(theta))-4*(a^2-b^2)))/2;
p1=[0;0];
p2=a*[cos(theta);sin(theta)];
p4=[d;zeros(1,length(d))];
p2_x=p2(1,:);
p2_y=p2(2,:);
p2_vx=diff(p2_x)./diff(t);
p2_vy=diff(p2_y)./diff(t);
p2_v=sqrt(p2_vx.^2+p2_vy.^2);
for i=1:length(t)
    plot1=subplot(2,1,1);
    p1_circle=viscircles(p1',0.1);
    p2_circle=viscircles(p2(:,i)',0.1);
    p4_circle=viscircles(p4(:,i)',0.1);
    link_a=line([p1(1) p2(1,i)],[p1(2) p2(2,i)]);
    link_c=line([p2(1,i) p4(1,i)],[p2(2,i) p4(2,i)]);
    axis(plot1,'equal');
    xlim([-10 10]);
    ylim([-10 10]);
    pause(0.005);
    if(i<length(t))
        delete(p1_circle);
        delete(p2_circle);
        delete(p4_circle);
        delete(link_a);
        delete(link_c);
        plot2=subplot(2,1,2);
        plot(plot2,t(1:i),p2_v(1:i));
        axis([0 t(end) 0 25]);
        grid on;
    end
end