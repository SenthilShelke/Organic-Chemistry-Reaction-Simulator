class CarboxyllicAcid {
  //Fields
  float numOfCarbons; //number of carbons
  float xCarbon = 20; //x coordinate of the carbon(initially 20)
  float yCarbon = 250; //y coordinate of the carbon(initially 250)
  float deltaY; //change in y used to change the y coordinate to form a zig zag pattern
  
  //Constructor that takes in only the number of carbons(for when the carobxyllic acid is a reactant)
  CarboxyllicAcid(float numC) {
    this.numOfCarbons = numC;
  }
  
  //constructor that takes in the number of carbons and starting x coordinate(for when the carboxyllic acid is a product)
  CarboxyllicAcid(float numC, float x) {
    this.numOfCarbons = numC;
    this.xCarbon = x;
  }
  
  //Methods
  
  //function to draw the carboxyllic acid, taking in a string value for whether to write Na or OH, and the initial x coordinate
  void drawCarboxyllicAcid(String s, float xInitial) {
    xCarbon = 20+xInitial; //adds the initial x value so that it can appear to the right when used as a product(if it is a reactant than initialX will be 0 so that it appears on the left)
    yCarbon = 250; //sets y coordinate of carbon as 250 so that it starts at the lower end
    fill(0);
    textSize(20);
    
    for(int i=0; i < this.numOfCarbons; i++) {
      if(i == this.numOfCarbons-1) { //uses a for loop to iterate through the carbons and find the last one
        if(this.numOfCarbons%2 == 0) { //if the last carbon is an even one, then draw the double bonded oxygen facing up
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
    
    if(this.numOfCarbons%2 == 0) { //if last carbon is even, draw the text below the current y coordinate
      text(s, xCarbon, yCarbon+17);
    } else { //otherwise if odd, draw it on the current y coordinate
      text(s, xCarbon, yCarbon);
    } 
  }
  
  //function for the esterifcation reaction of carboxyllic acids, taking in an alcohol as a parameter
  void esterfication(Alcohol a) {
    drawCarboxyllicAcid("OH", 20); //draws the carboxyllic acid with a hydroxyl group and starting on the left of the screen
    //using test to draw the addition symbol and arrows
    text("+", xCarbon+50, height/2);
    a.drawAlcohol(xCarbon+100); //drawing the alcohol 100 units to the right as the carboxyllic acid as it is a reactant
    text("-----→", a.getLastXCarbonOfAlcohol()+30, height/2);
    Ester product = new Ester(numOfCarbons, a.getNumCarbons(), a.getLastXCarbonOfAlcohol()+100); //creates a new ester with the parent chain length being the same as the number of carbons as the carboxyllic acid, the branch chain lrngth being the same as the numbr of carbons of the alcohol, and starting at the last x coordinate of the alcohol +100 so that it appears to the right of it
   //all of the lines below use text to draw the addition symbols, catalysts and water(H₂O) as it is a product
    text("+     H₂O", product.getLastXCarbonOfEster()+50, height/2);
    textSize(15);
    text("H₂SO₄", a.getLastXCarbonOfAlcohol()+30, height/2-16);
    text("△", a.getLastXCarbonOfAlcohol()+45, height/2+15);
    
    product.drawEster(a.getLastXCarbonOfAlcohol()+100); //draws the ester starting to the right of the alcohol
  }
  
   //function for the condensation reaction of carboxyllic acids, taking in an amine as a parameter
  void condensation(Amine a) {
    drawCarboxyllicAcid("OH", 20); //draws the carboxyllic acid with a hydroxyl group and starting on the left of the screen
    a.drawAmine(xCarbon+80); //drawing the amine 100 units to the right as the carboxyllic acid as it is a reactant
    text("-----→", a.getLastXCarbonOfAmine()+90, height/2); //reaction arrow
    Amide product = new Amide(numOfCarbons, a.getNumCarbons(), a.getLastXCarbonOfAmine()+170); //creates a new amide with the parent chain length being the same as the number of carbons as the carboxyllic acid, the branch chain lrngth being the same as the numbr of carbons of the amine, and starting at the last x coordinate of the amine +100 so that it appears to the right of it
    product.drawAmide(a.getLastXCarbonOfAmine()+170); //draws the amide
    //all of the lines below use text to draw the addition symbols, catalysts and water(H₂O) as it is a product
    text("+     H₂O", product.getLastXCarbonOfAmideForCondensation()+50, height/2);
    textSize(15);
    text("H₂SO₄", a.getLastXCarbonOfAmine()+90, height/2-16);
    text("△", a.getLastXCarbonOfAmine()+105, height/2+15);
  }
  
  //public function that returns the x coordinate of the last carbon of the carobxyllic acid to be used in reactions of other compoounds
  public float getLastXCarbonOfCarboxyllicAcid() {
    return xCarbon;
  }
}
