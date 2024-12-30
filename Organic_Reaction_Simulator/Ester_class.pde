class Ester {
  //Fields

  float xCarbon; //x coordinate of the carbon
  float yCarbon = 250; //y coordinate of the carbon(initially 250)
  float deltaY; //change in y used to change the y coordinate to form a zig zag pattern
  float parentChainLength; //number of carbons in the parent chain
  float branchChainLength; //number of carbons in the branch chain
  
  //Constructor that takes in the parent chain length, branch chain length and x coordinate(for when ester is a product)
  Ester(float pcl, float bcl, float x) {
    this.parentChainLength = pcl;
    this.branchChainLength = bcl;
    this.xCarbon = x;
  }
  
  //Constructor that takes in only the parent chain length and branch chain length(for when ester is a reactant)
  Ester(float pcl, float bcl) {
    this.parentChainLength = pcl;
    this.branchChainLength = bcl;
  }
  
  //Methods
  
  //function that draws the ester
  void drawEster(float initialX) {
    xCarbon = 20+initialX; //adds the initial x value so that it can appear to the right when used as a product(if it is a reactant than initialX will be 0 so that it appears on the left)
    yCarbon = 250; //sets y coordinate of carbon as 250 so that it starts at the lower end
    fill(0);
    textSize(20);
    
    for(int i=0; i < this.parentChainLength+this.branchChainLength; i++) {
      if(i == this.parentChainLength-1) { //uses a for loop to iterate through the number of carbons to find when the parent chain ends
        if (this.parentChainLength % 2 == 0) { //if it ends on an even carbon, draw the double bonded oxygen facing up
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
      
      line(xCarbon, yCarbon, xCarbon+40, yCarbon+deltaY); //draws the line which represents the single bond between two carbons
      
      if(i == this.parentChainLength) { //checks if the current carbon is the last in the parent chain
        if(this.branchChainLength%2 == 0) { //if the last carbon is even draw the following facing down
          fill(255);
          noStroke();
          circle(xCarbon+1, yCarbon, 20); //draws a white circle(same color as background) to cover up the ends of the two bonds near the end of the current carbon
          fill(0);
          text("O", xCarbon-5, yCarbon+6); //draws an oxygen in the middle of the white circle
        } else { //otherwise if odd, draw the same circle and oxygen just facing up
          fill(255);
          noStroke();
          circle(xCarbon-1, yCarbon, 20);
          fill(0);
          text("O", xCarbon-7, yCarbon+6);
        }
      }
      
      stroke(0);
      xCarbon += 40; //increments the x coordinate of the carbon each time by a constant
      yCarbon += deltaY; //increments the y coordinate of the carbon
    }
  }
  
  //function for the hydrolysis reaction of esters
  void hydrolysis() {
    drawEster(20); //draws the ester on the left side of the screen
    CarboxyllicAcid product1 = new CarboxyllicAcid(this.parentChainLength, xCarbon+200); //creates a new carboxyllic acid with the number of carbons being the same as the length of the parent chain of the ester
   //all of the lines below use text to draw the addition symbols, catalysts and water(H₂O) as it is a reactant
    text("+     H₂O     -----→", xCarbon+50, height/2);
    textSize(15);
    text("H₂SO₄", xCarbon+135, height/2-16);
    text("△", xCarbon+145, height/2+15);
    product1.drawCarboxyllicAcid("OH", xCarbon+200); //draws the carboxyllic acid to the right of the last x coordinate of the ester with a hydroxyl group
    textSize(20); 
    text("+", product1.getLastXCarbonOfCarboxyllicAcid()+60, height/2);
    Alcohol product2 = new Alcohol(this.branchChainLength, 1, product1.getLastXCarbonOfCarboxyllicAcid()); //creates a new alcohol with the number of carbons being the same as the length of the branch chain of the ester, it's hydroxyl group is on carbon 1 and it starts to the right of the last x coordinate of the carboxyllic acid
    product2.drawAlcohol(product1.getLastXCarbonOfCarboxyllicAcid()+100); //draws the alcohol
  }
  
  //function for the saponification reaction of esters
  void saponification() {
    drawEster(20); //draws the ester
   //all of the lines below use text to draw the addition symbols, catalysts and NaOH as it is a reactant
    text("+     NaOH     -----→", xCarbon+50, height/2);
    textSize(15);
    text("△", xCarbon+165, height/2-15);
    CarboxyllicAcid product1 = new CarboxyllicAcid(this.parentChainLength, xCarbon+225); //creates a new carboxyllic acid with the number of carbons being the same as the length of the parent chain of the ester
    product1.drawCarboxyllicAcid("ONa", xCarbon+225); //draws the carboxyllic acid with an "ONa" group and to the right of the last x coordinate of the ester
    Alcohol product2 = new Alcohol(this.branchChainLength, 1); //creates a new alcohol with the number of carbons being the same as the length of the branch chain of the ester, it's hydroxyl group is on carbon 1
    product2.drawAlcohol(product1.getLastXCarbonOfCarboxyllicAcid()+120); //draws the alcohol to the right of the last x coordinate of the carboxyllic acid
    textSize(20);
    text("+", product1.getLastXCarbonOfCarboxyllicAcid()+70, height/2);
  }
  
  //public function that returns the x coordinate of the last carbon of the ester to be used in other reactions
  public float getLastXCarbonOfEster() {
    return xCarbon+40*(this.parentChainLength+this.branchChainLength); //gets the last x carbon by taking the initial x carbon and adding multiple of 40(increment value of the x coordinates) based on the sum of the parent and branch chain length
  }
}
