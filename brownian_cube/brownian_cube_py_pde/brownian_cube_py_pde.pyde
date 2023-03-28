add_library('peasycam')

x = 0
y = 0 
z = 0
n = 10000

points = []


def setup():
             size(1080,720,P3D)
             colorMode(HSB)
             for i in range(n):
                 x = random(-100,100)
                 y = random(-100,100)
                 z = random(-100,100)
                 points.append([x,y,z])

def draw():
            hu = 0
            background(0)
            strokeWeight(3)
            noFill()
            beginShape()
            for p in points:
                hu = sqrt(p[1]*p[1]+p[2]*p[2]+p[3]*p[3]) 
                if hu > 255:
                    hu = 0
                
                stroke(hu,255,255)
                point(p[1],p[2],p[3])
                offset = [random(-1,1),random(-1,1),random(-1,1)]
                p.add(offset)
            
