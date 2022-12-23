set term png 
set output "P4-20-21-c2-ﬁg1.png"

set title "Gràfica dels errors per la primera integral"
set xlabel "h" 
set ylabel "Errors (km)"
!set key outside 
set grid xtics
set grid ytics
set logscale x
set logscale y
set key inside left top
set key spacing 1.5
a=1376.3*10**6 
b=542.617*10**6
valor_real =  pi*a*b

set format x "%1.0tx10^{%S}" ; set format y "%1.0tx10^{%S}"

plot "P4-20-21-c2.dat" index 0 using 1:(abs(($2)-valor_real)) title "Error trapezis" w p pointtype 7 pointsize 1.5 lt rgb "violet", "P4-20-21-c2.dat" index 0 using 1:(abs(valor_real-($3))) title "Error simpson" w p pointtype 7 pointsize 1.5 lt rgb "red", (10.**4.85)*x**(3./2.) title "10^{4.85}x^{3/2}", (10.**4.5)*x**(3./2.) title "10^{4.5}x^{3/2}"
