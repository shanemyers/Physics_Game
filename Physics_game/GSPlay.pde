/*
class GSPlay
 {
 
 Vec2 mousePos;
 
 void Update()
 {
 
 
 
 if (!Input.mouseDown && !Input.mouseDownPrev)
 {
 //println("in, up");
 // sets starting point of the line
 mousePos = new Vec2(mouseX, mouseY);
 
 }
 
 
 if (Input.mouseDownPrev && !Input.mouseDown)
 {
 makeLimb(new Vec2(mouseX, mouseY));
 }
 
 
 //println("xxx" + mousePos.x + "   ::  x222: " + mouseX);
 Input.Update();
 }
 
 
 void Draw()
 {
 
 if (Input.mouseDown)
 {
 stroke(0);
 line(mousePos.x, mousePos.y, mouseX, mouseY);
 }
 
 
 for (Body body = world.getBodyList(); body != null; body = body.getNext())
 {
 drawBody(body);
 }
 }
 void drawBody(Body body)
 {
 PolygonShape ps = (PolygonShape)body.getFixtureList().getShape();
 Vec2[] verts = ps.getVertices();
 Vec2 pos = body.getPosition();
 
 noStroke();
 
 pushMatrix();
 
 
 translate(pos.x, pos.y);
 rotate(body.getAngle());
 
 
 beginShape();
 
 for (int i = 0; i < ps.getVertexCount (); i++)
 {
 vertex(verts[i].x, verts[i].y);
 }
 
 endShape();
 
 popMatrix();
 }
 
 Body makeLimb(Vec2 pos)
 {
 
 BodyDef def = new BodyDef();
 
 float dis = getLineDis(pos);
 float dx = pos.x - mousePos.x;
 float dy = pos.y - mousePos.y;
 
 if(dx < 0) dx *= -1;
 if(dx == 0) dx += 8;
 
 if(dy < 0) dy *= -1;
 if(dy == 0) dy += 8;
 
 // passed in if the limb is dynamic or not, should be dynamic
 //def.type = isFixed ? BodyType.STATIC : BodyType.DYNAMIC;
 def.type = BodyType.DYNAMIC;
 
 // position of center, is half distance of length of line 
 def.position = pos;
 
 Body body = world.createBody(def);
 
 
 // shape
 PolygonShape shape = new PolygonShape();
 //shape.setAsBox(w, h);
 
 
 println("dx: " + dx + "  ::  dy: " + dy); 
 println("x: " + mouseX + "  ::  x2: " + mousePos.x); 
 
 // height should be distance of line drawn
 shape.setAsBox(dx, dy);
 //shape.setAsBox(8, 80);
 
 // fixture
 FixtureDef fixture = new FixtureDef();
 fixture.shape = shape;
 fixture.density = 1;
 fixture.friction = .5;
 fixture.restitution = 0; // how relaxed the collison detection is
 
 body.createFixture(fixture);
 
 return body;
 }
 
 float getLineDis(Vec2 v)
 {
 return (sqrt((sq(v.x - mousePos.x)) + (sq(v.y - mousePos.y))));
 }
 }
 */


class GSPlay
{

  Vec2 mousePos;
  boolean mouseOnCircle = false;

  public GSPlay()
  {
    //makeCircle(new Vec2(width / 2, height / 2), true);
    makeBox(new Vec2(width / 2, 7 * height / 8), 800, 20, true);
  }  


  void Update()
  {




    mouseOnCircle = false;

    // loop through all circles to see if the mouse is over one
    // should be in world


    CircleShape testShape = new CircleShape();
    testShape.setRadius(8);

    for (Body body = world.getBodyList(); body != null; body = body.getNext())
    {
      //if(body.getFixtureList().getShape() == testShape && mouseX < body.position.x  + 8
      //&& mouseX < position.x && mouseY - 8 < position.y + 8 && mouseY > position.y - 8)
      {
        mouseOnCircle = true;
      }
    }



    if (!Input.mouseDown && !Input.mouseDownPrev)
    {
      //println("in, up");
      // sets starting point of the line
      mousePos = new Vec2(mouseX, mouseY);
    }


    if (Input.mouseDownPrev && !Input.mouseDown)
    {
      makeLimb(new Vec2(mouseX, mouseY), false);
    }


    //println("xxx" + mousePos.x + "   ::  x222: " + mouseX);
    Input.Update();
  }


  void Draw()
  {

    if (Input.mouseDown)
    {
      stroke(0);
      line(mousePos.x, mousePos.y, mouseX, mouseY);
    }


    for (Body body = world.getBodyList(); body != null; body = body.getNext())
    {
      drawBody(body);
    }
  }
  void drawBody(Body body)
  {
    PolygonShape ps = (PolygonShape)body.getFixtureList().getShape();
    Vec2[] verts = ps.getVertices();
    Vec2 pos = body.getPosition();


    float minX = 0;
    float maxX = 0;
    float minY = 0;
    float maxY = 0;
    float avgX = 0;

    noStroke();

    pushMatrix();


    translate(pos.x, pos.y);
    rotate(body.getAngle());


    beginShape();

    for (int i = 0; i < ps.getVertexCount (); i++)
    {
      vertex(verts[i].x, verts[i].y);



      if (verts[i].x > maxX || i == 0)
      {
        maxX = verts[i].x;
      }

      if (verts[i].x < minX || i == 0)
      {
        minX = verts[i].x;
      }

      if (verts[i].y > maxY || i == 0)
      {
        maxY = verts[i].y;
      }

      if (verts[i].y < minY || i == 0)
      {
        minY = verts[i].y;
      }
    }

    endShape();

    /*
  avgX = (maxX + minX)/2;
     
     if(mouseX < maxX && mouseX < minX && mouseY < maxY + 8 && mouseY > maxY - 8)
     {
     
     fill(20, 50, 0);
     }
     else
     {
     fill(120, 50, 0);
     }
     
     ellipse(avgX, maxY, 8, 8);
     
     
     
     if(mouseX < maxX && mouseX < minX && mouseY < minY + 8 && mouseY > minY - 8)
     {
     
     fill(20, 50, 0);
     }
     else
     {
     fill(120, 50, 0);
     }
     
     ellipse((avgX, minY, 8, 8);
     
     
     
     
     fill(255);
     */

    popMatrix();
  }

  Body makeLimb(Vec2 pos, boolean isFixed)
  {

    BodyDef def = new BodyDef();

    float dis = getLineDis(pos);
    float dx = pos.x - mousePos.x;
    float dy = pos.y - mousePos.y;

    if (dx < 0) dx *= -1;
    if (dx == 0) dx += 8;

    if (dy < 0) dy *= -1;
    if (dy == 0) dy += 8;

    // passed in if the limb is dynamic or not, should be dynamic
    def.type = isFixed ? BodyType.STATIC : BodyType.DYNAMIC;
    //def.type = BodyType.DYNAMIC;

    // position of center, is half distance of length of line

    if (pos.y > mousePos.y)
    { 
      def.position = new Vec2(pos.x - dx/2, pos.y - dy/2);
    }    
    else if (pos.y < mousePos.y)
    { 
      def.position = new Vec2(pos.x - dx/2, pos.y + dy/2);
    }

    if (pos.x > mousePos.x)
    { 
      def.position = new Vec2(pos.x - dx/2, pos.y - dy/2);
    }    
    else if (pos.x < mousePos.x)
    { 
      def.position = new Vec2(pos.x + dx/2, pos.y + dy/2);
    }

    // def.setAngl();---------------------------------------------------------------------- add

    Body body = world.createBody(def);


    // shape
    PolygonShape shape = new PolygonShape();
    //shape.setAsBox(w, h);


    println("dx: " + dx + "  ::  dy: " + dy); 
    println("x: " + mouseX + "  ::  x2: " + mousePos.x); 

    // height should be distance of line drawn

    if (dx >= dy)
    {
      shape.setAsBox(dx/2, 8);  // sets the box to be the length of the line draw on its Y value
    }
    else if (dx < dy)
    {
      // issues
      shape.setAsBox(8, dy/2);  // sets the box to be the length of the line draw on its Y value
    }

    //shape.setAsBox(8, 80);

    // fixture
    FixtureDef fixture = new FixtureDef();
    fixture.shape = shape;
    fixture.density = 1;
    fixture.friction = .5;
    fixture.restitution = 0; // how relaxed the collison detection is

    body.createFixture(fixture);

    return body;
  }


  Body makeBox(Vec2 pos, float w, float h, boolean isFixed)
  {

    BodyDef def = new BodyDef();

    // passed in if the limb is dynamic or not, should be dynamic
    def.type = isFixed ? BodyType.STATIC : BodyType.DYNAMIC;


    def.position = pos;


    Body body = world.createBody(def);


    // shape
    PolygonShape shape = new PolygonShape();
    shape.setAsBox(w, h);


    // fixture
    FixtureDef fixture = new FixtureDef();
    fixture.shape = shape;
    fixture.density = 1;
    fixture.friction = .5;
    fixture.restitution = 0; // how relaxed the collison detection is

    body.createFixture(fixture);

    return body;
  }


  Body makeCircle(Vec2 pos, boolean isFixed)
  {

    BodyDef def = new BodyDef();
    def.type = isFixed ? BodyType.STATIC : BodyType.DYNAMIC;
    def.position = pos; 

    Body body = world.createBody(def);

    CircleShape shape = new CircleShape();
    shape.setRadius(8);

    // fixture
    FixtureDef fixture = new FixtureDef();
    fixture.shape = shape;
    fixture.density = 1;
    fixture.friction = .5;
    fixture.restitution = 0; // how relaxed the collison detection is


    return body;
  }

  float getLineDis(Vec2 v)
  {
    return (sqrt((sq(v.x - mousePos.x)) + (sq(v.y - mousePos.y))));
  }
}



/*

 
 b2RevoluteJointDef jointDef;
 
 jointDef.bodyA = myBodyA; // circle
 
 jointDef.bodyB = myBodyB; // limb box
 
 jointDef.anchorPoint = myBodyA->GetCenterPosition();
 
 b2RevoluteJoint* joint = (b2RevoluteJoint*)myWorld->CreateJoint(&jointDef);
 
 */
