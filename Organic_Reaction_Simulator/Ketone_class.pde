class Ketone {
  //Fields
  float numOfCarbons; //number of carbons
  float xCarbon; //x coordinate of the carbon
  float yCarbon = 250; //y coordinate of the carbon(initially 250)
  float deltaY; //change in y used to change the y coordinate to form a zig zag pattern
  float Olocant; //location of the carbonyl group(where the "O" is found)
  
  //Constructor that takes in only the number of numbers and carbonyl group location(for when ketone is a reactant)
  Ketone(float numC, float locant) {
    this.numOfCarbons = numC;
    this.Olocant = locant;
  }
  
  //Constructor that takes in number of numbers, starting x coordinate and carbonyl group location(for when ketone is a product)
  Ketone(float numC, float locant, float x) {
    this.numOfCarbons = numC;
    this.Olocant = locant;
    this.xCarbon = x;
  }
  
  //Methods
  
  //function to draw the ketone
  void drawKetone(float xValue) {
    yCarbon = 250; //sets y coordinate of carbon as 250 so that it starts at the lower end
    fill(0);
    textSize(20);
    
    for(int i=0; i < this.numOfCarbons-1; i++) {
      if(i == this.Olocant-1) { //uses a for loop to find the location of the carbonyl group by iterating through the number of carbons until it finds the location
        if(this.Olocant%2 == 0) { //checks if the current carbon is an even number, if it is then it will draw the carbonyl group facing up
          //these two lines draw the double bond with slight adjustments to the x and y coordinates to make them look nice
          line(xCarbon-3, yCarbon+2, xCarbon-3, yCarbon-40*sqrt(2)+2);
          line(xCarbon+3, yCarbon+2, xCarbon+3, yCarbon-40*sqrt(2)+2);
          text("O", xCarbon-6, yCarbon-40*sqrt(2)); //draws the oxygen at the end of the double bonds
        } else { //otherwise if it is odd draw the same things just facing down instead
          line(xCarbon-3, yCarbon-2, xCarbon-3, yCarbon+40*sqrt(2)+2);
          line(xCarbon+3, yCarbon-2, xCarbon+3, yCarbon+40*sqrt(2)+2);
          text("O", xCarbon-6, yCarbon+40*sqrt(2)+17);
        }
      }
      
      if(yCarbon == height/2) { //if the current y coordinate of the carbon is the lower end, then make the deltaY negative so that the next line is drawn upwards
        deltaY = -40;
      } else if(yCarbon == height/2-40) { //if the current y coordinate of the carbon is the upper end, then make the deltaY positive so that the next line is drawn downwards
        deltaY = 40;
      } 
      
      line(xValue, yCarbon, xValue+40, yCarbon+deltaY); //draws the line which represents the single bond between two carbons
      xValue += 40; //increments the x coordinate of the carbon each time by a constant
      yCarbon += deltaY; //increments the y coordinate of the carbon
      xCarbon = xValue; //sets the xValue used in this function to the value of xCarbon so that it can be used in the functions in this tab
    }
  }
  
  //function for the reduction reaction of ketones
  void reduction() {
    drawKetone(20); //draws the ketones
    Alcohol product = new Alcohol(this.numOfCarbons, this.Olocant); //creates a new alcohol with the number of carbons being the same as the number of carbons as the ketones, and the location of the hydroxyl group being the location of the carbonyl group on the ketone
    product.drawAlcohol(xCarbon+200); //draws the alcohol
    textSize(20);
    //all of the lines below use text to draw the addition symbols, reactions arrows, catalysts 
    text("+     [H]     -----→", xCarbon+50, height/2);
    textSize(15);
    text("Pt", xCarbon+140, height/2-16);
    text("△", xCarbon+150, height/2+15);
    text("H  ,", xCarbon+125, height/2+15);
    text("+", xCarbon+135, height/2+10);
  }  
}
