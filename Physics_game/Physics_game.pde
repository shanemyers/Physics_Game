import org.jbox2d.common.*;
import org.jbox2d.collision.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.PolygonShape;


World world;
float timeStep = 1.0/30;

GSPlay gsPlay;
GSTitle gsTitle;
GSOver gsOver;


void setup()
{
  size(800, 800);
  strokeWeight(8);
  
  //                             gravity
  world = new World(new Vec2(0, 200));

  SwitchToTitle();
}

void Update()
{
  world.step(timeStep, 6, 2);
  // cam.Update();
}

void draw()
{

  background(123);


  if (gsPlay != null)
  {

    gsPlay.Update();
    gsPlay.Draw();
  }

  if (gsTitle != null)
  {

    gsTitle.Update();

    if (gsTitle != null)
    {
      gsTitle.Draw();
    }
  }
}

void SwitchToTitle()
{
  gsPlay = null;
  gsTitle = new GSTitle();
  gsOver = null;
}

void SwitchToOver()
{
  gsPlay = null;
  gsTitle = null;
  gsOver = new GSOver();
}

void SwitchToPlay()
{
  gsPlay = new GSPlay();
  gsTitle = null;
  gsOver = null;
}


