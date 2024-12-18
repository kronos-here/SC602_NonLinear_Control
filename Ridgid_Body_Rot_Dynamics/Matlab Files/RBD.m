function dydt = RBD(t,y)

   % Since my Roll number: 213230011,  ends with 11 the overall matrices that come out are as follows 
   J = [20.11,1.2,0.9; 1.2 , 17.11, 1.4; 0.9, 1.4, 15.11];

   % Declating the initial value as vectors
   r = [y(1), y(2), y(3)]';
   w = [y(4), y(5), y(6)]';
   jw = J*w;
   r_cross = [0, -r(3), r(2); r(3), 0, -r(1); -r(2), r(1), 0];
   dwdr = (2/(1+(r')*r))*((r') + (r')*r_cross + (r')*r*(r'));
    
   rdot = w + cross(r,w) + r*r'*w ;
   v = -w;
   wdot = inv(J)*(-1*cross(w,jw) + v - dwdr' ); %#ok<MINV> 
   dydt = [rdot(1);rdot(2);rdot(3);wdot(1);wdot(2);wdot(3)];
end