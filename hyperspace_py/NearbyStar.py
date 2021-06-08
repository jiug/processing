#Foreground faster stars subject to size growth

from Star import Star

def growth_rate(a):
    if a <= 50:
        return(1.02)
    elif a <= 75:
        return(1.01)
    else:
        return(1)

class NearbyStar(Star):
        
    def __init__(self,a,b,c,d):
        self.x = a
        self.y = b
        self.sz = c
        self.focal_x = width/2
        self.focal_y = height/2
        self.col = d
        self.away = dist(self.x,self.y,self.focal_x,self.focal_y)
        self.warp = 1
        self.growth = growth_rate(self.away)
            
    def display(self):
        strokeWeight(2)
        stroke(self.col)
        ellipse(self.x,self.y,self.sz,self.sz)
        self.sz *= self.growth

    def edges(self):
        if self.x >= width or self.x <= 0 or self.y >= height or self.y <= 0:
            self.x = random(self.focal_x-width/8,self.focal_x+width/8)
            self.y = random(self.focal_y-height/8, self.focal_y+height/8)
            self.away = dist(self.x,self.y,self.focal_x,self.focal_y)    
            self.sz = 2
            self.growth = growth_rate(self.away)
