function [alpha_v,alpha_h,psi_pp,Fy_v,Fy_h,Fx_h,Fz_v,Fz_h]=single_track_model(delta_v,vx,ax,ay)
  %delta_v=0.5;

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
  M=19;
  Z=M/r_dyn;
  F_r=0;
  F_k=0;
  Fx_h = Z-F_r-Ft_k-F_k


  %Schwimmwinkel
  %beta=delta_h-alpha_h+(lh/r)
  %beta=delta_v-alpha_v-(lv/r)
  %klein Schwimmwinkel so sin(beta)=beta   &   cos(beta)=1
  
   %Schräglaufwinkel_Vorne
  alpha_v=(1/(F_zf+(Cf_v*sin(delta_v))))*(Fx_h+(F_zf*delta_v)-(F_zf*(lv/r))-(m*v_p))

 %Seitenkraft Berechnung_Vorne
  Fy_v=alpha_v*Cf_v


 %Schräglaufwinkel_hinten

 alpha_h=(1/((m*v_p)+Cf_h))*(F_zf-(Fx_v*sin(delta_v))-(Fy_v*cos(delta_v))+(m*v_p*(lh/r)))
  


  %Seitenkraft Berechnung_Hinten
  Fy_h=alpha_h*Cf_h

  %psi_pp- Gierbeschleunigung Berechnung
  psi_pp=((Fy_v*cos(delta_v)*lv)+(Fx_v*sin(delta_v)*lv)-(Fy_h*lh))/Jz

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







