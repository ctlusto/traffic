Traffic traffic;
float car_density;
int fps, car_radius;
boolean running = false;

void setup() {
  size(1208, 100);
  background(255);
  noStroke();
  fill(100, 100);
  
  // set animation speed
  fps = 10;
  frameRate(fps);
  car_radius = 5;
  
  // set density of vehicles
  car_density = 0.75;
  
  // create instance of Traffic object and draw initial traffic pattern to screen
  traffic = new Traffic(width/car_radius, car_density);
  traffic.display();
}


void draw() {
  if (running == true) {
    background(255);
    traffic.display();
    traffic.update();
  }
}

// click the window to start the animation
void mouseClicked() {
  running = true;
}

// the Traffic Class
class Traffic {
int len;
float density;
int[] state;
int[] temp_state;

// create a line of 'len' vehicle positions with approximate density 'density'
Traffic(int len_, float density_) {
  len = len_;
  density = density_;
  //create an array of bits with length 'len'
  state = new int[len];
  temp_state = new int[len];
  // create a copy of the vehicle state array for updating
  for (int i=1; i<len; i++) {
    temp_state[i] = state[i];
  }
  // randomly assign car positions with approximate density 'density'
  for (int i=0; i<len; i++) {
    state[i] = random(1) < density ? 1:0;
  }
}


// apply Wolfram Rule 184 to traffic state using temporary array
void update() {
  for (int i=1; i<len-1; i++) {
    if (state[i-1]==1 && state[i]==1 && state[i+1]==1) {
      temp_state[i] = 1;
    } else if (state[i-1]==1 && state[i]==1 && state[i+1]==0) {
      temp_state[i] = 0;
    } else if (state[i-1]==1 && state[i]==0 && state[i+1]==1) {
      temp_state[i] = 1;
    } else if (state[i-1]==1 && state[i]==0 && state[i+1]==0) {
      temp_state[i] = 1;
    } else if (state[i-1]==0 && state[i]==1 && state[i+1]==1) {
      temp_state[i] = 1;
    } else {
      temp_state[i] = 0;
    }
  }
  // update 'state' array from temporary array
  for (int i=0; i<len; i++) {
    state[i] = temp_state[i];
  }
}

// draw cars at given positions in 'state' array
void display() {
  for (int i=0; i<len; i++) {
    if (state[i] == 1) {
      ellipse(car_radius*i, height/2, car_radius, car_radius);
    }
  }
}


}

