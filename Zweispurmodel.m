function [beta,alpha_1,alpha_2,alpha_3,alpha_4,psi_pp,Fy_1,Fy_2,Fy_3,Fy_4,Fz_v,Fz_h]=Zweispurmodel(delta_1,delta_2,delta_3,delta_4,vx,ax,ay)
  %delta_1=0.5;
  %delta_2=0.3;
  %delta_3=0.2;
  %delta_4=0.2;

  Jz=146.827;
  v=vx;
  v_p=ax;
  a_quer=ay;
  Cf_v=165000;
  Cf_h=165000;
  m=230;
  g=10;
  lv=0.813;
  lh=0.787;
  l=lv+lh;

  %Trackwidth
  S_v=1.242;
  S_h=1.203;
  delta_h=0;
  G=m*g;
  r=v^2/a_quer;
  
  %zentrifugalkraft
  F_zf=m*(v^2/r);

   %Longitudinal_Krafft Berechnung
  Fx_v = 0;
  Ft_k=v_p*m;
  
  %zugkraft_Berechnung
  r_dyn=0.214;
  
  %Moment
  M1=19;
  M2=17;
  M3=12;
  M4=9;
  Z1=M1/r_dyn;
  Z2=M2/r_dyn;
  F_r=0;
  F_k=0;
  Fx_h3 = Z1-F_r-Ft_k-F_k;
  Fx_h4 = Z2-F_r-Ft_k-F_k;


  %Schwimmwinkel
  %beta=delta_h-alpha_h+(lh/r)
  %beta=delta_v-alpha_v-(lv/r)
  %klein Schwimmwinkel so sin(beta)=beta   &   cos(beta)=1


  %Schwimmwinkel
  beta=(v-((v/r)*(S_v/2))-((v/r)*lv))*(1/v)*(1/((-Cf_h*sin(delta_1))+F_zf-(sin(delta_2)*Cf_v)+F_zf-(Cf_v*sin(delta_3))-(Cf_v*sin(delta_4))))*((m*ax)-(Fx_h3*cos(delta_3))-(Fx_h4*cos(delta_4))-(F_zf*((delta_1+delta_2)/2))+((lv/r)*F_zf)-(sin(delta_1)*Cf_v*delta_1)+(delta_1*F_zf)-(sin(delta_2)*Cf_v*delta_2)+(delta_2*F_zf)-(Cf_v*delta_3*sin(delta_3))-(Cf_v*delta_4*sin(delta_4)))
  
  %Schräglaufwinkel - alpha_1
  alpha_1=delta_1-atan(((v*sin(beta))+((v*lv)/r))/((v*cos(beta))-((v*S_v)/(2*r))))

    %Schräglaufwinkel - alpha_2
  alpha_2=delta_2-atan(((v*sin(beta))+((v*lv)/r))/((v*cos(beta))-((v*S_v)/(2*r))))

    %Schräglaufwinkel - alpha_3
  alpha_3=delta_3-atan(((v*sin(beta))+((v*lv)/r))/((v*cos(beta))-((v*S_v)/(2*r))))

    %Schräglaufwinkel - alpha_4
  alpha_4=delta_4-atan(((v*sin(beta))+((v*lv)/r))/((v*cos(beta))-((v*S_v)/(2*r))))


 %Seitenkraft Berechnung Fy_1
  Fy_1=alpha_1*Cf_v

 %Seitenkraft Berechnung Fy_2
  Fy_2=alpha_2*Cf_v

 %Seitenkraft Berechnung Fy_3
  Fy_3=alpha_3*Cf_v

 %Seitenkraft Berechnung Fy_4
  Fy_4=alpha_4*Cf_v


 %Lateral acceleration ay
 %ay=(1/m)*((Fx_h3*sin(delta_3))+(Fx_h4*sin(delta_4))+(Fy_1*cos(delta_1))+(Fy_2*cos(delta_2))+(Fy_3*cos(delta_3))+(Fy_4*cos(delta_4))+(m*ax*sin(beta)))
 
  


  

  %psi_pp- Gierbeschleunigung Berechnung
  psi_pp=(1/Jz)*((lv*Fy_1*cos(delta_1))+(lv*Fy_2*cos(delta_2))-(lh*Fy_3*cos(delta_3))-(lh*Fy_4*cos(delta_4))-(lh*Fx_h3*sin(delta_3))-(lh*Fx_h4*sin(delta_4))+((S_v/2)*((Fy_2*sin(delta_2))-(Fy_1*sin(delta_1))))+((S_h/2)*((Fx_h4*cos(delta_4))-(Fx_h3*cos(delta_3))+(Fy_4*sin(delta_4))-(Fy_3*sin(delta_3))))-(M1+M2+M3+M4))

  %Radlast Berechnung
  Fz_v=(lh/l)*G
  Fz_h=(lv/l)*G









end



%Longitudinal_Kraft F_x Berechnung
%Zugkraft  _ Z M/r_wheel
%Trägheitskraft    Ft_k = v_p*m
%Reibung_Wiederstand   F_r =0
%kurvenwiederstand    F_k =0
%beta-Schwimmwinkel =
%delta_v Lenkrad_winkel_vorne
%delta_h Lenkrad_winkel_hinten
%Jz_Trägheitsmoment







