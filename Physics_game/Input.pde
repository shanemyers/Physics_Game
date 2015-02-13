static class Input
{

  static boolean mouseDown = false;
  static boolean mouseDownPrev = false;
  static boolean keyU = false;
  static boolean keyD = false;
  static boolean keyEnter = false;
  static boolean prevKeyDown = false;

  static void Update()
  {
    mouseDownPrev = mouseDown;
  }

  static void SetMouse(boolean m)
  {
    mouseDown = m;
  }

  static void SetKey(int code)
  {

    println("l: " + code);

    switch(code)
    {
    case UP:
      keyU = true;
      break;

    case DOWN:
      keyD = true;
      break;

    case 10:
      keyEnter = true;
      break;
    }
  }

  static void KeyReset()
  {
    keyU = false;
    keyD = false;
    keyEnter = false;
  }

  static void keyDown()
  {
    prevKeyDown = true;
  }

  static void keyUp()
  {
    prevKeyDown = false;
  }
} 
void mousePressed()
{

  if (!Input.mouseDown)
  {
    Input.SetMouse(true);
  }
  else
  {
    //Input.SetMousePrev(Input.mouseDown);
  }
}

void mouseReleased()
{

  if (Input.mouseDown)
  {
    Input.SetMouse(false);
  }
}

void keyPressed() 
{
  if (!Input.prevKeyDown)
  {
    Input.SetKey(keyCode);
  }
}

void keyReleased() 
{
  Input.keyUp();
}

