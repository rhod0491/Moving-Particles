ArrayList<PImage> skins = new ArrayList<PImage>();
ArrayList<Ball> balls = new ArrayList<Ball>();
int framectr = 0;

// dimensions of the canvas
int FRAME_WIDTH = 800;
int FRAME_HEIGHT = 500;
int FRAME_DEPTH = 2000;

/**
 * The setup function which is run once at the beginning of the application.
 * Draws the walls and balls to the screen.
 */
void setup() {
  // default size
  size(800, 500, P3D);
  
  surface.setTitle("Moving Particles");
  surface.setSize(FRAME_WIDTH, FRAME_HEIGHT);
  
  String projectDirectory = sketchPath() + "/texture_pool";

  File textureDirectory = new File(projectDirectory);

  for (File curFile : textureDirectory.listFiles()) {
    String curTexturePath = curFile.getAbsolutePath();
    
    if(curTexturePath.endsWith(".jpg")) {
      PImage currTexture = loadImage(curTexturePath);
      skins.add(currTexture);
    }
  }
}

/**
 * The infinite looping function which starts after setup() has executed.
 * Sets the canvas dimensions and loads the texture pool images into memory.
 */
void draw() {
  
  // back wall
  background(255);

  // left wall
  beginShape();
  vertex(0, 0, 0);
  vertex(0, 0, -FRAME_DEPTH);
  vertex(0, FRAME_HEIGHT, -FRAME_DEPTH);
  vertex(0, FRAME_HEIGHT, 0);
  endShape();

  // roof
  beginShape(); 
  vertex(0, 0, 0);
  vertex(0, 0, -FRAME_DEPTH);
  vertex(FRAME_WIDTH, 0, -FRAME_DEPTH);
  vertex(FRAME_WIDTH, 0, 0);
  endShape();

  // right wall
  beginShape(); 
  vertex(FRAME_WIDTH, 0, 0);
  vertex(FRAME_WIDTH, 0, -FRAME_DEPTH);
  vertex(FRAME_WIDTH, FRAME_HEIGHT, -FRAME_DEPTH);
  vertex(FRAME_WIDTH, FRAME_HEIGHT, 0);
  endShape();

  // floor
  beginShape(); 
  vertex(0, FRAME_HEIGHT, 0);
  vertex(0, FRAME_HEIGHT, -FRAME_DEPTH);
  vertex(FRAME_WIDTH, FRAME_HEIGHT, -FRAME_DEPTH);
  vertex(FRAME_WIDTH, FRAME_HEIGHT, 0);
  endShape();

  for (Ball ball : balls) {
    ball.render();
  }

  framectr++;
}

/**
 * Creates a new ball at the cursor positoon whenever the mouse button is pressed.
 */
void mouseClicked() {
  balls.add(new Ball());
}
