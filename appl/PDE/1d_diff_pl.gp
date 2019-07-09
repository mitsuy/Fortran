set term postscript eps enhanced color "Times-Roman" 25


set title "1D thermal diffusion"

set grid
set xlabel"x"
set ylabel"Temp"

set output "1d_thermal.eps"
plot \
     "1d_diff.dat" every :::0::0 u 2:3 w lp \
     ps 2 title "t=0.0",\
     "1d_diff.dat" every :::2::2 u 2:3 w lp \
     ps 2 title "t=0.02",\
     "1d_diff.dat" every :::5::5 u 2:3 w lp \
     ps 2 title "t=0.05",\
     "1d_diff.dat" every :::9::9 u 2:3 w lp \
     ps 2 title "t=0.09"\


     