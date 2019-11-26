// https://en.wikipedia.org/wiki/Barnsley_fern

// coefs
float[] a = {0, 0.85, 0.2, -0.15};
float[] b = {0, 0.04, -0.26, 0.28};
float[] c = {0, -0.04, 0.23, 0.26};
float[] d = {0.16, 0.85, 0.22, 0.24};
float[] e = {0, 0, 0, 0};
float[] f = {0, 1.6, 1.6, 0.44};

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
  
  if(rand < 1) {
    return 0;
  } else if (rand < 1 + 85) {
    return 1;
  } else if (rand < 1 + 85 + 7) {
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
    point(round(width/2 + 150*x), round(height - 90*y));
}
