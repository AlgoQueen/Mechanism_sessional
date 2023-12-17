%FOUR BAR LINKAGE MECHANISM
%BY ELHUSSEIN SHATA (HUSSEIN SHATA)

clear all
close all

L0 = 2.5;
L1 = 3.0;
L2 = 7.0;
L3 = 6.7;

L_AP = 2.9;
alpha = 150;

theta2 = 60:1:240;
figure(1);
hold on; % Add this to keep the plot open for the path tracing

% Initialize arrays to store the path of point P
path_Px = [];
path_Py = [];

for i = 1:length(theta2)
    
  if theta2(i) > 360
   theta2(i) = theta2(i)-360;
  end
  
   AC(i) = sqrt(L0^2 + L1^2 - 2*L0*L1*cosd(theta2(i)));
   beta(i) = acosd((L0^2 + AC(i)^2 - L1^2) / (2*L0*AC(i)));
   psi(i) = acosd((L2^2 + AC(i)^2 - L3^2) / (2*L2*AC(i)));
   lamda(i) = acosd((L3^2 + AC(i)^2 - L2^2) / (2*L3*AC(i)));
   
   theta3(i) = psi(i) - beta(i);
   theta4(i) = 180 - lamda(i) - beta(i);
   
   if theta2(i) > 180
       theta3(i) = psi(i) + beta(i);
       theta4(i) = 180 - lamda(i) + beta(i);
   end
   
   %Define the joints position
   Ox(i) = 0;
   Oy(i) = 0;
   
   Ax(i) = Ox(i) + L1*cosd(theta2(i));
   Ay(i) = Oy(i) + L1*sind(theta2(i));
   
   Bx(i) = Ox(i) + Ax(i) + L2*cosd(theta3(i));
   By(i) = Oy(i) + Ay(i) + L2*sind(theta3(i));
   
   Cx(i) = L0;
   Cy(i) = 0;
   
   Px(i) = Ox(i) + Ax(i) + L_AP*cosd(alpha+theta3(i));
   Py(i) = Oy(i) + Ay(i) + L_AP*sind(alpha+theta3(i));

   %Store the point P coordinates in the path arrays
   path_Px = [path_Px, Px(i)];
   path_Py = [path_Py, Py(i)];
   
   
   r = [ L2*cosd(theta3(i)), -L3*cosd(theta4(i));...
         L2*sind(theta3(i)), -L3*sind(theta4(i)) ];
    
   v = [ -L1*alpha*cosd(theta2(i)); -L1*alpha*sind(theta2(i))];
   
   w(i,:) = inv(r)*v;
   om2(i) = w(i,1);
   om4(i) = w(i,2);
   
   alpha_dot(i) = - (L1*om2(i)*cosd(theta2(i)) - L3*om4(i)*cosd(theta4(i)))/ ...
                    (L2*cosd(alpha) + L_AP*cosd(alpha));
                
   V_Px(i) = alpha_dot(i)*Px(i);
   V_Py(i) = alpha_dot(i)*Py(i);

   plot( [Ox(i) Ax(i)], [Oy(i) Ay(i)], [Ax(i) Bx(i)], [Ay(i) By(i)] ...
       , [Bx(i) Cx(i)], [By(i) Cy(i)], 'LineWidth',3)
   hold on;
   plot( [Ax(i) Px(i)], [Ay(i) Py(i)],'LineWidth',3)
   plot( [Bx(i) Px(i)], [By(i) Py(i)],'LineWidth',3)
   % Add a line plot to trace the path of point P
   plot(path_Px, path_Py, 'k'); % 'r' for a red path
   plot( [Ox(i) Cx(i)], [Oy(i) Cy(i)],'k','LineWidth',3);
    grid;
    axis equal;
    axis([-10 15 -10 10]);
    drawnow;
    hold off;
    
end

