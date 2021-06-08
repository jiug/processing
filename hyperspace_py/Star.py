#Default background stars without growth

class Star:
    
    def __init__(self,a,b,c,d):
        self.x = a
        self.y = b
        self.sz = c
        self.focal_x = width/2
        self.focal_y = height/2
        self.col = d
        self.warp = 0
        self.away = dist(self.x,self.y,self.focal_x,self.focal_y)
        
        #Code used if there's only one star class
        # self.growth = 0
        # if dist(self.focal_x,self.focal_y,self.x,self.y) <= 50:
        #     self.growth = 0.2
        # elif dist(self.focal_x,self.focal_y,self.x,self.y) <= 75:
        #     self.growth = 0.1
      
    # Cartesian movement (has problems at high slopes)
    # def move(self):
    #     self.speed = (self.y-self.focal_y)/(self.x-self.focal_x)
    #     self.n = self.y-self.speed*self.x
    #     if self.x < self.focal_x:
    #         self.x -= self.warp + self.sz#*sqrt(1/(20*(pow(self.speed,2)+1))) 
    #         self.y = self.speed*self.x + self.n
    #     elif self.x >= self.focal_x:
    #         self.x += self.warp + self.sz#*sqrt(1/(20*(pow(self.speed,2)+1))) '''
    #         self.y = self.speed * self.x + self.n
    
    
    #Polar movement (rotation is broken)
    def move(self):
        self.cang = (self.x-self.focal_x)/self.away
        self.sang = (self.y-self.focal_y)/self.away
        self.away += self.warp + self.sz
        self.x = self.away*self.cang + self.focal_x
        self.y = self.away*self.sang + self.focal_y
        
    def display(self):
        fill(self.col)
        ellipse(self.x,self.y,self.sz,self.sz)
        
        # Code used if there's only one star class
        # self.sz += self.growth
        
    def edges(self):
        if self.x >= width or self.x <= 0 or self.y >= height or self.y <= 0:
            self.x = random(self.focal_x-width/2,self.focal_x+width/2)
            self.y = random(self.focal_y-height/2, self.focal_y+height/2)
            self.away = dist(self.x,self.y,self.focal_x,self.focal_y)
             
            #Code used if there's only one star class
            # if self.sz <= 3:
            #     self.x = random(self.focal_x-width/2,self.focal_x+width/2)
            #     self.y = random(self.focal_y-height/2, self.focal_y+height/2)
            #     self.sz = random(1,2)
            # else:
            #     self.x = random(self.focal_x-width/6,self.focal_x+width/6)
            #     self.y = random(self.focal_y-height/6,self.focal_y+height/6)
            #     self.sz = random(2,8)
                
    def pilot(self):
        if keyPressed: 
            noCursor()
            if key == "a":
                #self.x += 1  
                self.focal_x = width/4
            elif key == "w":
                #self.y += 1
                self.focal_y = height/4
            elif key == "s":
                #self.y -= 1
                self.focal_y = 3*height/4
            elif key == "d":
                #self.x -= 1
                self.focal_x = 3*width/4

            # Still not working properly   
            # elif key == "e":
            #     self.sang = sin(asin(self.sang)+1)
            #     self.cang = cos(acos(self.cang)+1)
                
                # self.rot = (self.x-width/2) + (self.y-height/2j)
                # print(self.rot)
                # self.new = self.rot * 1j
                # print(self.new)
                # self.x  = self.new.real + width/2
                # self.y  = self.new.imag + height/2
                
            elif key == " ":
                self.warp = 10
        else :
            self.focal_x = width/2
            self.focal_y = height/2
            self.warp = 0

        
