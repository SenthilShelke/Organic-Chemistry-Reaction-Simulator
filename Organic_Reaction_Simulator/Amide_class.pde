class Amide {
  //Fields
  float xCarbon; //x coordinate of the carbon
  float yCarbon = 250; //y coordinate of the carbon(initially 250)
  float deltaY; //change in y used to change the y coordinate to form a zig zag pattern
  float parentChainLength; //number of carbons in the parent chain
  float branchChainLength; //number of carbons in the branch chain
  
  //Constructor that takes in the length of the parent chain, lenght of the branch chain and x coordinate
  Amide(float pcl, float bcl, float x) {
    this.parentChainLength = pcl;
    this.branchChainLength = bcl;
    this.xCarbon = x;
  }
  
  //Methods
  
  //function that draws the amide
  void drawAmide(float initialX) {
    xCarbon = 20+initialX; //adds the initial x value so that it can appear to the right when used as a product(if it is a reactant than initialX will be 0 so that it appears on the left)
    yCarbon = 250; //sets y coordinate of carbon as 250 so that it starts at the lower end
    fill(0);
    textSize(20);
    for(int i=0; i < this.parentChainLength; i++) { 
      if(i == this.parentChainLength-1) { //uses a for loop to iterate through the number of carbons to find when the parent chain ends
        if(this.parentChainLength%2 == 0) { //if it ends on an even carbon, draw the double bonded oxygen facing up
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
      } 
      else if(yCarbon == height/2-40) { //if the current y coordinate of the carbon is the upper end, then make the deltaY positive so that the next line is drawn downwards
        deltaY = 40;
      }   
      
      line(xCarbon, yCarbon, xCarbon+40, yCarbon+deltaY); //draws the line which represents the single bond between two carbons
      xCarbon += 40; //increments the x coordinate of the carbon each time by a constant
      yCarbon += deltaY; //increments the y coordinate of the carbon
    }
    
    if(this.parentChainLength%2 == 0) { //if the end of the parent chain if even, draw the nitrogen and hydrogen and single bond facing down
      text("N", xCarbon, yCarbon+17);
      text("H", xCarbon, yCarbon+40*sqrt(2)+35);
      line(xCarbon+6, yCarbon+20, xCarbon+6, yCarbon+40*sqrt(2)+20);
    } else { //otherwise, draw them facing up
      text("N", xCarbon, yCarbon);
      text("H", xCarbon, yCarbon-40*sqrt(2)-17);
      line(xCarbon+6, yCarbon-15, xCarbon+6, yCarbon-40*sqrt(2)-15);
    }
    
    //draws the rest of the branch chain using the same process as drawing the parent chain
    for(int i=0; i < this.branchChainLength; i++) {
      if(yCarbon == height/2) {
        deltaY = -40;
      } 
      else if(yCarbon == height/2-40) {
        deltaY = 40;
      } 
      
      line(xCarbon+15, yCarbon, xCarbon+55, yCarbon+deltaY);
      xCarbon += 40;
      yCarbon += deltaY;
    }
  }
  
  //function for the hydrolysis reaction of amides
  void hydrolysis() {
    drawAmide(0); //draws the amide
    CarboxyllicAcid product1 = new CarboxyllicAcid(this.parentChainLength); //creates a new carboxyllic acid(one of the products) with the number of carbons being the same as the parent chain length of the amide
    //all of the lines below use text to draw the addition symbols, reactions arrows, catalysts and water as a reactant
    text("+     H₂O     -----→", xCarbon+50, height/2);
    textSize(15);
    text("H₂SO₄", xCarbon+135, height/2-16);
    text("△", xCarbon+145, height/2+15);
    product1.drawCarboxyllicAcid("OH", xCarbon+200); //draws the carboxyllic acid with a hydroxyl group and starting at the last x coordinate of the amide +200 so that it starts to the right
    Amine product2 = new Amine(this.branchChainLength); //creates a new amine(second product) with the number of carbons being the same as the branch chain length of the amide
    product2.drawAmine(product1.getLastXCarbonOfCarboxyllicAcid()+50); //draws the amine starting at the last x coordinate of the carboxyllic acid +50 so that it is to the right of it
  } 
  
  //public function that returns the x coordinate of the last carbon of the amide to be used in hydrolysis
  public float getLastXCarbonOfAmideForHydrolysis() {
    return xCarbon+40*(this.parentChainLength+this.branchChainLength);
  }
  
  //public function that returns the x coordinate of the last carbon of the amide to be used in condensation
  public float getLastXCarbonOfAmideForCondensation() {
    return xCarbon;
  }
}
  
