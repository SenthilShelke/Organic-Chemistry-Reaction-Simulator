class Aldehyde {
  //Fields
  float numOfCarbons; //number of carbons
  float xCarbon = 20; //x coordinate of the carbon(initially 20)
  float yCarbon = 250; //y coordinate of the carbon(initially 250)
  float deltaY; //change in y used to change the y coordinate to form a zig zag pattern
  
  //Constructor that takes in the number of carbons and the x coordinate of the carbon
  Aldehyde(float nC, float x) {
    this.numOfCarbons = nC;
    this.xCarbon = x;
  }
  
  //Methods
  
  //function that draws the aldehyde, taking in the initial x value of the carbon
  void drawAldehyde(float initialX) {
    xCarbon = 20+initialX; //adds the initial x value so that it can appear to the right when used as a product(if it is a reactant than initialX will be 0 so that it appears on the left)
    yCarbon = 250; //sets y coordinate of carbon as 250 so that it starts at the lower end
     fill(0);
     textSize(20);
     
     for(int i=0; i < this.numOfCarbons-1; i++) {
       if(i == this.numOfCarbons-2) { //checks if the current carbon is the last one
        if ((this.numOfCarbons-2) % 2 == 0) { //checks if the last carbon is an even number, if it is then draw the double bonded oxygen facing up
          //these two lines draw the double bond with slight adjustments to the x and y coordinates to make them look nice
          line(xCarbon-3+40, yCarbon-38, xCarbon-3+40, yCarbon-40*sqrt(2)+2-38);
          line(xCarbon+40, yCarbon+2-41, xCarbon+40, yCarbon-40*sqrt(2)+2-38);
          //draws the oxygen at the end of the double bonds
          text("O", xCarbon-8+40, yCarbon-40*sqrt(2)-38);
        } else { //otherwise if it is odd draw the same things just facing down instead
          line(xCarbon-3+40, yCarbon+38, xCarbon-3+40, yCarbon+40*sqrt(2)+40);
          line(xCarbon+40, yCarbon+40, xCarbon+40, yCarbon+40*sqrt(2)+40);
          text("O", xCarbon+32.5, yCarbon+40*sqrt(2)+55);     
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
  }
 
  //function for the oxidation reaction of aldehydes
  void oxidation() {
    drawAldehyde(20); //draws the aldehyde with a beginning x coordinate of 20 so that it starts on the left hand side because aldehydes are a reactant in this reaction
    CarboxyllicAcid product = new CarboxyllicAcid(this.numOfCarbons); //creates a carboxyllic acid(the product of this reaction) with the same number of carbons as the aldehyde
    product.drawCarboxyllicAcid("OH", xCarbon+200); //draws the carboxyllic acid with a hydroxyl group and starting at the last x coordinate of the aldehyde +200 so it starts to the right 
    //all of the lines below use text to draw the addition symbols, reactions arrows, catalysts and water(H₂O) as it is a product
    textSize(20);
    text("+     [O]     -----→", xCarbon+50, height/2);
    textSize(15);
    text("KMnO₄", xCarbon+125, height/2-16);
    text("△", xCarbon+150, height/2+15);
    text("H  ,", xCarbon+125, height/2+15);
    text("+", xCarbon+135, height/2+10);
    textSize(20);
    text("+     H₂O", product.getLastXCarbonOfCarboxyllicAcid()+50, height/2);
  }
    
  //function for the reduction reaction of aldehydes
  void reduction() {
    drawAldehyde(20); //draws the aldehyde with a beginning x coordinate of 20 so that it starts on the left hand side because aldehydes are a reactant in this reaction
    Alcohol product = new Alcohol(this.numOfCarbons, 1); //creates a new alcohol with the same number of carbons as the aldehyde with the hydroxyl group being on carbon 1
    product.drawAlcohol(xCarbon+200); //draws the alcohol with the lat x coordinate of the aldehyde so it starts to the right
    //all of the lines below use text to draw the addition symbols, reactions arrows, catalysts and water(H₂O) as it is a product
    textSize(20);
    text("+     [H]     -----→", xCarbon+50, height/2);
    textSize(15);
    text("LiAlH₄", xCarbon+125, height/2-16);
    text("△", xCarbon+150, height/2+15);
    text("H  ,", xCarbon+125, height/2+15);
    text("+", xCarbon+135, height/2+10);   
  }
  
  //public function that returns the x coordinate of the last carbon of the aldehyde to be used in reactions of other compoounds
  public float getLastXCarbonOfAldehyde() {
    return xCarbon;
  }
}
