class Alkene {
  //Fields
  int numOfCarbons; //number of carbons
  int doubleBondLocation; //location of the double bond
  float xCarbon = 20; //x coordinate of the carbon(initially 20)
  float yCarbon = 250; //y coordinate of the carbon(initially 250)
  float deltaY; //change in y used to change the y coordinate to form a zig zag pattern
  
  //Constructor that takes in the number of carbons and the location of the double bond
  Alkene(int numC, int locant) {
    this.numOfCarbons = numC;
    this.doubleBondLocation = locant;
  }
  
  //Methods
  
  //function that draws the alkene
  void drawAlkene() {
    xCarbon = 20; //sets x coordinate to 20 initially as alkenes are always a reactant
    yCarbon = 250;
    fill(0);
    for(int i=0; i < this.numOfCarbons-1; i++) {
      if(yCarbon == height/2) { //if the current y coordinate of the carbon is the lower end, then make the deltaY negative so that the next line is drawn upwards
        deltaY = -40; 
      } else if(yCarbon == height/2-40) { //if the current y coordinate of the carbon is the upper end, then make the deltaY positive so that the next line is drawn downwards
        deltaY = 40;
      }
      if(i == this.doubleBondLocation-1) { //uses a for loop to iterare through the carbons until it finds the one that has the double bond
        if(i%2 == 0) { //if the carbon is even, it will draw the second bond facing down
        line(xCarbon+5, yCarbon-1, xCarbon+42, yCarbon+deltaY+2);
        } else { //otherwise if odd, it will draw the second bond facing up
          line(xCarbon+4, yCarbon, xCarbon+42, yCarbon+deltaY-2);
        }  
      }
      
      line(xCarbon, yCarbon, xCarbon+40, yCarbon+deltaY); //draws the line which represents the single bond between two carbons
      xCarbon += 40; //increments the x coordinate of the carbon each time by a constant
      yCarbon += deltaY; //increments the y coordinate of the carbon
    }
  }
  
  //function for the hydrogenation reaction of alkenes
  void hydrogenation() {
    drawAlkene(); //draws the alkene
    fill(0);
    textSize(20);
    //uses text to draw the hydrogen as a reactant, and the addition symbol and the arrow(no catalysts in this reaction)
    text("+     H₂     →", 20+40*(this.numOfCarbons), height/2);
    fill(0);
    
    //hydrogenation removes the double bond from an alkene, so this for loop simply draws the same alkene without the double bond
    for(int i=0; i < this.numOfCarbons-1; i++) {
      if(yCarbon == height/2) {
        deltaY = -40;
      } 
      else if(yCarbon == height/2-40) {
        deltaY = 40;
      }    
      line(xCarbon+200, yCarbon, xCarbon+240, yCarbon+deltaY);
      xCarbon += 40;
      yCarbon += deltaY;
    }  
  }
  
  //function for the hydration reaction of alkenes
  void hydration() {
    drawAlkene(); //draws the alkene
    fill(0);
    textSize(20);
    //uses text to draw the water as a reactant, and the addition symbol and the arrow(no catalysts in this reaction)
    text("+     H₂O     →", xCarbon+50, height/2); 
    fill(0);
    Alcohol product = new Alcohol(this.numOfCarbons, this.doubleBondLocation); //creates a new alcohol using the same number of carbons as the alkene, and with the hydroxyl group location as the location of the double bond of the alkene
    product.drawAlcohol(xCarbon+200); //draws the alcohol with the last x coordinate of the alkene +200 so that it appears to the right  
  }
}
