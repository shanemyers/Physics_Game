class GSTitle 
{

  int choice = 0;

  void Update()
  {

    if (Input.keyU && !Input.prevKeyDown)
    {

      println("K" + choice);
      if (choice != 0)
      {
        choice--;
      } else
      {
        choice = 2;
      }

      Input.keyDown();
    }


    if (Input.keyD && !Input.prevKeyDown)
    {
      println(choice);

      if (choice != 2)
      {
        choice++;
      } else
      {
        choice = 0;
      }

      Input.keyDown();
    }


    if (Input.keyEnter)
    {
      if (choice == 0)
      {
        SwitchToPlay();
      }
      
    }

    Input.KeyReset();
  }


  void Draw()
  {


    switch(choice)
    {

    case 0:
      stroke(255, 0, 0);
      ellipse(width / 2, height/2, 20, 20);

      stroke(0);
      ellipse(width / 2, height/2 + 40, 20, 20);
      ellipse(width / 2, height/2 + 80, 20, 20);
      break;

    case 1:

      stroke(255, 0, 0);
      ellipse(width / 2, height/2 + 40, 20, 20);

      stroke(0);
      ellipse(width / 2, height/2 + 80, 20, 20);
      ellipse(width / 2, height/2, 20, 20);
      break;

    case 2:
      stroke(0);
      ellipse(width / 2, height/2, 20, 20);
      ellipse(width / 2, height/2 + 40, 20, 20);

      stroke(255, 0, 0);
      ellipse(width / 2, height/2 + 80, 20, 20);
      break;
    }
  }
}

