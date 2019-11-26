
// coefs
float[] a = {0, 0.42, 0.42, 0.1};
float[] b = {0, -0.42, 0.42, 0};
float[] c = {0, 0.42, -0.42, 0};
float[] d = {0.5, 0.42, 0.42, 0.1};
float[] e = {0, 0, 0, 0};
float[] f = {0, 0.2, 0.2, 0.2};

// index
int i;

float x = 0;
float y = 0;

void setup () {
  size(1000, 1000);
  background(0);
  stroke(255);
}

void draw () {
  for (int a = 0; a < 100; a++) {
        i = getNextIndex();
        loop();
  }
}

int getNextIndex () {
  float rand = random(100);
  
  if(rand < 5) {
    return 0;
  } else if (rand < 5 + 40) {
    return 1;
  } else if (rand < 5 + 40 + 40) {
    return 2;
  } else {
    return 3;
  }
}

void loop () {
    float tempX = x;
    float tempY = y;
    x = a[i]*tempX + b[i]*tempY + e[i];
    y = c[i]*tempX + d[i]*tempY + f[i];
    point(round(width/2 + 1800*x), round(height - 2000*y));
}
