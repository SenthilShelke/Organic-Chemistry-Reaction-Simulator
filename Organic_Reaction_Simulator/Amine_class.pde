class Amine {
  //Fields
  float xCarbon; //x coordinate of the carbon
  float yCarbon = 250; //y coordinate of the carbon(initially 250)
  float deltaY; //change in y used to change the y coordinate to form a zig zag pattern
  float numOfCarbons; //number of carbons
  
  //Constructor that takes in the number of carbons
  Amine(float nC) {
    this.numOfCarbons = nC;
  }
  
  //Methods
  
  //function to draw the amine that takes in an x coordinate of where it begins
  void drawAmine(float xValue) {
    yCarbon = 250; //sets y coordinate of carbon as 250 so that it starts at the lower end
    fill(0);
    textSize(20);
    text("+    H₂N", xValue, height/2); //the beginning of an amine will always have a nitrogen bonded to two hydrogens, which is why it is drawn here using the x value in the parameter
    for(int i=0; i < this.numOfCarbons; i++) { 
      if(yCarbon == height/2) { //if the current y coordinate of the carbon is the lower end, then make the deltaY negative so that the next line is drawn upwards
        deltaY = -40;
      } 
      else if(yCarbon == height/2-40) { //if the current y coordinate of the carbon is the upper end, then make the deltaY positive so that the next line is drawn downwards
        deltaY = 40;
      } 
      
      line(xValue+60, yCarbon-10, xValue+100, yCarbon+deltaY-10); //draws the line which represents the single bond between two carbons
      xValue += 40; //increments the x coordinate of the carbon each time by a constant
      yCarbon += deltaY; //increments the y coordinate of the carbon
      xCarbon = xValue; //sets the xValue used in this function to the value of xCarbon so that it can be used in the functions in this tab
    }
  }
  
  //public function that returns the x coordinate of the last carbon of the amine to be used in reactions of other compoounds
  public float getLastXCarbonOfAmine() {
    return xCarbon;
  }
  
  //public function that returns the number of carbons of an amine to be used in reactions of other compoounds
  public float getNumCarbons() {
    return numOfCarbons;
  }
}
