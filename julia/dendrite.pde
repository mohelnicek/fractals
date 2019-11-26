int MAX_ITER = 500;


float w = 4;
float h;

float dx, dy;

void setup () {
  size (1000, 700);
  background(255);

  h = (w * height) / width;

  dx = w / width;
  dy = h / height;
  
  loadPixels();
  mandelbrot();
}

float a;
float b;

void mandelbrot () {
  int iter;
  float x = -w / 2;
  for (int i = 0; i < width; i++) {
    float y = -h / 2;
    for (int j = 0; j < height; j++) {
        iter = 0;
        a = x;
        b = y;
        while (iter < MAX_ITER) {
          // compute next values
          float aa = a * a;
          float bb = b * b;
          float ab = a * b;
          
          // break loop if we reached infinity
          if (aa == Float.POSITIVE_INFINITY) {
            break;
          }
          if (bb == Float.POSITIVE_INFINITY) {
            break;
          }
          
          // use next values
          a = a * a - b * b;
          b = 2 * ab - 1;
          iter++;
        }

        if(iter == MAX_ITER) {
          pixels[i + j * width] = color(0);
        } else {
          pixels[i + j * width] = color(255 * log(iter) / log(MAX_ITER), 0, 50); // log scale color

        }
        y += dy;
    }
    x += dx;
  }
  updatePixels();
}
