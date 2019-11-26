// https://en.wikipedia.org/wiki/Sierpi%C5%84ski_triangle

int triHeight;
float dist;

float pointX;
float pointY;

float triX0;
float triX1;
float triX2;
float triY0;
float triY1;
float triY2;

void setup () {
    size(1200, 1100);
    
    // black background
    background(0); 
    
    
    int triSize;
    int shift = 100;
    
    // first and second triangle points
    triX0 = shift;
    triY0 = height - shift;
    triX1 = width-shift;
    triY1 = height-shift;

    // distance between first and second point and triangle height
    dist = dist(triX0, triY0, triX1, triY1);
    triHeight = int(sqrt(dist * dist * 0.75)); 
    
    // third triangle point
    triX2 = shift + dist / 2;
    triY2 = height - shift - triHeight;
    
    // draw triangle edges
    stroke(30);
    strokeWeight(1);
    line(triX0, triY0, triX1, triY1);
    line(triX1, triY1, triX2, triY2);
    line(triX2, triY2, triX0, triY0);
    
    // starting point
    pointX = triX0;
    pointY = triY0;
}

float tempX;
float tempY;
int rnd;

float red;
float blue;
float green;

void draw () {
    for(int i = 0; i < 1000; i++){ // draw multiple points per frame
        rnd = int(random(3));
        switch (rnd) { // select one of triangle vertexes
            case 0:
                tempX = triX0;
                tempY = triY0;
                break;
            case 1:
                tempX = triX1;
                tempY = triY1;
                break;
            case 2:
                tempX = triX2;
                tempY = triY2;
                break;            
            default:
                println("ERROR");
                break;
        }
        // calculate calculate next point
        pointX = (pointX + tempX) / 2;
        pointY = (pointY + tempY) / 2;
        
        // calculate color for current point
        red = 1 - dist(pointX, pointY, triX0, triY0) / dist;
        blue = 1 - dist(pointX, pointY, triX1, triY1) / dist;
        green = 1 - dist(pointX, pointY, triX2, triY2) / dist;

        stroke(red*255, blue*255, green*255); // set color of point
        point(round(pointX), round(pointY)); // rounding numbers to int removes unwanted artifacts
    }
}
