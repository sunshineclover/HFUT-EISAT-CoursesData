function 7.28(htext,str1,z,vchk1,vchk2)
cla,set(htext, 'string' ,[str1,sprintf( '%1.4g\' ,z)]); % 更新静态文本框内容 <2>
dt=0.1;t=0:dt:15;N=length(t);y=step(1,[1 2*z 1],t);plot(t,y);
if vchk1 % 假如峰值框被选中 <4>
[ym,km]=max(y);
if km<(N-3) % 假如在设定时间范围内能插值 <6>
k1=km-3;k2=km+3;k12=k1:k2;tt=t(k12);
yy=spline(t(k12),y(k12),tt); % 局部样条插值 <8>
[yym,kkm]=max(yy); % 求更精确的峰值位置
line(tt(kkm),yym, 'marker' , '.' , ... % 画峰值点 <10>
'markeredgecolor' , 'r' , 'markersize' ,20);
ystr=[ 'ymax = ' ,sprintf( '%1.4g\' ,yym)];
tstr=[ 'tmax = ' ,sprintf( '%1.4g\' ,tt(kkm))];
text(tt(kkm),1.05*yym,{ystr;tstr})
else % 假如在设定时间范围内不能插值 <15>
text(10,0.4*y(end),{ 'ymax --> 1' ; 'tmax --> inf' })
end