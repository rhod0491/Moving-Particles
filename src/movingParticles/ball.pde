public class Ball {
  
  private PShape sphere;
  private int radius;
  
  private int xPosition;
  private int yPosition;
  private int zPosition;

  private float xSpeed;
  private float ySpeed;
  private float zSpeed;

  private int spinDirection = 1;
  
  static final float gravity = 1;
  static final float decay = 0.88;

  public Ball() {
    
    radius = int(random(10, 50));
                
    xPosition = mouseX;
    yPosition = mouseY;
    zPosition = 0;

    xSpeed = random(-10, 10);
    ySpeed = random(-10, 10);
    zSpeed = random(-10, -1);

    // randomly select a texture and create the ball
    PImage skin = skins.get(int(random(0, skins.size())));
    
    sphere = createShape(SPHERE, radius);
    sphere.setStroke(false);
    sphere.setTexture(skin);
  }

  private void updatePosition() {
    
    xPosition += xSpeed;
    yPosition += ySpeed;
    zPosition += zSpeed;
    
    ySpeed += gravity;
    
    // ball hits left wall
    if ((xPosition - radius) < 0) {
      xPosition = radius;
      xSpeed = -xSpeed;
    }
    
    // ball hits right wall
    if ((xPosition + radius) > FRAME_WIDTH) {
      xPosition = FRAME_WIDTH - radius;
      xSpeed = -xSpeed;
    }

    // ball hits roof
    if ((yPosition - radius) < 0) {
      yPosition = radius;
      ySpeed = -ySpeed;
    }

    // ball hits floor
    if ((yPosition + radius) > FRAME_HEIGHT) {
      yPosition = FRAME_HEIGHT - radius;
      float decaySpeed = ySpeed * decay;      
      ySpeed = -decaySpeed;
    }

    // ball hits back wall
    if ((zPosition - radius) < -FRAME_DEPTH) {
      zPosition = -FRAME_DEPTH + radius;
      zSpeed = -zSpeed;
      spinDirection = -1;
    }
    
    // ball hits front wall (where camera lies)
    if ((zPosition + radius) > 0) {
      zPosition = -radius;
      zSpeed = -zSpeed;
      spinDirection = 1;
    } 
  }
  
  public void render() {

    updatePosition();

    pushMatrix();       
    translate(xPosition, yPosition, zPosition); 
    rotateX(framectr * PI / 15.0 * spinDirection); 
    shape(sphere);      
    popMatrix();
  }
  
}
