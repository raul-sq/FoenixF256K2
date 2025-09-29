```
100   dim tan#(25)
110   for m=1 to 25
120   read r#
130   tan#(m)=r#
140   next 
150   dim arctan#(25)
160   for a=1 to 25
170   read r#
180   arctan#(a)=r#
190   next 
200   dim cos#(25)
210   for b=1 to 25
220   read r#
230   cos#(b)=r#
240   next 
250   print "LUTs populated."
260   input "Enter an angle in degrees (float with five decimals):";d#
270   cordic(d#):end 
280   proc cordic(t#)
290   quadrant=1:a#=t#
300   if (180.0-t#<90.0)&(180.0-t#>=0):t#=180.0-t#:quadrant=2:endif 
310   if (270.0-t#<90.0)&(270.0-t#>=0):t#=270.0-t#:quadrant=3:endif 
320   if (360.0-t#<90.0)&(360.0-t#>=0):t#=360.0-t#:quadrant=4:endif 
330   print a#,t#,quadrant
340   ang1#=arctan#(1):ang2#=0.00000:k#=1:x#=1:y#=0:n=1:z#=tan#(1)
350   while t#<>ang1#
355   if n=25:ang1#=t#:endif 
360   x1#=x#
370   x#=x#-(y#*z#)
380   y#=y#+(x1#*z#)
390   k#=k#*cos#(n)
410   if ang1#>t#:ang2#=-arctan#(n+1):z#=-tan#(n+1):endif 
420   if ang1#<t#:ang2#=arctan#(n+1):z#=tan#(n+1):endif 
430   ang1#=ang1#+ang2#
440   n=n+1
450   wend 
460   x#=x#*k#
470   y#=y#*k#
480   sine#=y#:cosine#=x#:sine3q#=sine#
490   if quadrant=2:cosine#=-cosine#:endif 
500   if quadrant=3:sine#=-cosine#:cosine#=-sine3q#:endif 
510   if quadrant=4:sine#=-sine#:endif 
515   tangent#=sine#/cosine#
520   print sine#,cosine#,tangent#
530   endproc 
1000  rem "tan(theta)"
1010  data 1.00000,0.50000,0.25000,0.12500,0.06250
1020  data 0.03125,0.01563,0.00781,0.00391,0.00195
1030  data 0.00098,0.00049,0.00024,0.00012,0.00006
1040  data 0.00003,0.00002,0.00001,0.00000,0.00000
1050  data 0.00000,0.00000,0.00000,0.00000,0.00000
1100  rem "arctan(theta) in degrees"
1110  data 45.00000,26.56505,14.03624,7.12502,3.57633
1120  data 1.78991,0.89517,0.44761,0.22381,0.11191
1130  data 0.05595,0.02798,0.01399,0.00699,0.00350
1140  data 0.00175,0.00087,0.00044,0.00022,0.00011
1150  data 0.00005,0.00003,0.00001,0.00001,0.00000
1200  rem "cos(theta)"
1210  data 0.70711,0.89443,0.97014,0.99228,0.99805
1220  data 0.99951,0.99988,0.99997,0.99999,1.00000
1230  data 1.00000,1.00000,1.00000,1.00000,1.00000
1240  data 1.00000,1.00000,1.00000,1.00000,1.00000
1250  data 1.00000,1.00000,1.00000,1.00000,1.00000
```
