#set term postscript eps enhanced color "Times-Roman" 25
set grid
set xlabel"x"
set ylabel"Temp"

set term gif animate delay 5 optimize size 640,480
set output "1d_thermal.gif"

dt=0.01

do for [i=0: 1000]{
set title sprintf("Time=%12.6f",i*dt)
plot [-0.5:0.5][0:2.0] "1d_diff.dat" every :::i::i u 2:3 w lp lc 7 ps 2 pt 6 notitle
}

#set output