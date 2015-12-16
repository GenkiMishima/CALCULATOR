#!/usr/bin/python
import os

print "plot"
os.system("""
gnuplot <<EOF
set grid
set xlabel "x"
set ylabel "y"
#set xrange [0:1]
#set yrange [0:1]
set terminal png
set key below
set output "result.png"
p "in.d" w p, "out.d" w l
EOF""" )





#for i in range(1,5):
#   print "data/Mach_%2.2i.d" % (i)
#   os.system("""
#gnuplot <<EOF
#set grid
#set xlabel "x"
#set ylabel "Mach Number"
#set xrange [0:1]
#set yrange [0:1]
#set terminal png
#set key below
#set output "png/Mach_%2.2i.png"
#set yrange [0:1]
#p "data/Mach_%2.2i.d" w lp
#EOF""" % (i,i))
