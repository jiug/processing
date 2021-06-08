from Star import Star
from NearbyStar import NearbyStar
import re

Stars = []
N_Stars = []
colors = []

def setup():
    fullScreen()
    star_colors = open("star_colors_code.txt", 'r')
    for star_color in star_colors:
        star_color = star_color.rstrip()
        colors.append(star_color)

    for i in range(200):
        Stars.append(Star(random(width),random(height),1,colors[int(random(len(colors)))]))
        
    for i in range(100):    
        N_Stars.append(NearbyStar(random(width),random(height),5,colors[int(random(len(colors)))]))
        
def draw():
    background(0,0,0,10)

    for star in Stars:
        star.display()
        star.move()
        star.edges()
        star.pilot()


        
    for N_star in N_Stars:
        N_star.display()
        N_star.move()
        N_star.edges()
        N_star.pilot()
    
