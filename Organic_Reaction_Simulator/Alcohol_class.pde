class Alcohol {
  //Fields
  float numOfCarbons; //number of carbons 
  float xCarbon; //x coordinate of the carbon
  float yCarbon = 250; //y coordinate of the carbon(initially 250)
  float deltaY; //change in y used to change the y coordinate to form a zig zag pattern
  float OHlocant; //location of the hydroxyl group(where the "OH" is found)
  
  //Constructor for the alcohol with only number of carbons and location of hydroxyl group(used for when the alcohol is the first reactant)
  Alcohol(float numC, float locant) {
    this.numOfCarbons = numC;
    this.OHlocant = locant;
  }
  
  //Constructor for the alcohol with number of carbons, location of double bond and the initial x coordinate(used for when the alcohol is a product)
  Alcohol(float numC, float locant, float initialX) {
    this.numOfCarbons = numC;
    this.OHlocant = locant;
    this.xCarbon = initialX;
  }
  
  //Methods
  
  //function that draws the alcohol
  void drawAlcohol(float xValue) { //takes in a paramter of an x value for where it begins
    yCarbon = 250; //sets y coordinate of carbon as 250 so that it starts at the lower end
    fill(0);
    textSize(20);
    
    for(int i=0; i < this.numOfCarbons-1; i++) { 
      if(i == this.OHlocant-1) { //uses a for loop to find the location of the hydroxyl group by iterating through the number of carbons until it finds the location 
        if(i%2 == 0) { //checks if the current carbon is an even number, if it is then it will draw the hydroxyl group facing up
        line(xValue, yCarbon, xValue, yCarbon+40*sqrt(2));
        text("OH", xValue-12, yCarbon+72);
        } else { //otherwise if it is odd, draw the hydroxyl group facing down
          line(xValue, yCarbon, xValue, yCarbon-40*sqrt(2));
          text("OH", xValue-13, yCarbon-60);
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
  
  //function for the oxidation reaction of alcohols
  void oxidation() {
    drawAlcohol(20); //draws the alcohol with a beginning x coordinate of 20 so that it starts on the left hand side because alcohols are a reactant in this reaction
    Aldehyde product = new Aldehyde(this.numOfCarbons, xCarbon+200); //creates a new aldehyde(the product of this reaction) with the same number of carbons as the alcohol, and with the last x coordinate of the carbon of the alcohol + 200 so that it appears to the right of the alcohol
    product.drawAldehyde(xCarbon+200); //draws the aldehyde made in the previous line
    //all of the lines below use text to draw the addition symbols, reactions arrows, catalysts and water(H₂O) as it is a product
    textSize(20);
    text("+     [O]     -----→", xCarbon+50, height/2);
    textSize(15);
    text("KMnO₄", xCarbon+125, height/2-16);
    text("△", xCarbon+150, height/2+15);
    text("H  ,", xCarbon+125, height/2+15);
    text("+", xCarbon+135, height/2+10);
    textSize(20);
    text("+     H₂O", product.getLastXCarbonOfAldehyde()+30, height/2);
  }
  
  //function for the condensation reaction of alcohols
  void condensation(Alcohol a) { //takes in another alcohol as a parameter as this reaction is an alcohol + another alcohol
    drawAlcohol(20); //draws the alcohol with a beginning x coordinate of 20 so that it starts on the left hand side because alcohols are a reactant in this reaction
    a.drawAlcohol(xCarbon+100); //draws the second alcohol with the last x coordinate of the first alclohol +100 so that it is to the right
    Ether product = new Ether(this.numOfCarbons, a.getNumCarbons(), a.getLastXCarbonOfAlcohol()+120); //creates an ether(the product of this reaction) with the parent chain being the same number of carbons as the first alcohol, the branch chain being the same number of carbons as the second alcohol, and starting at the last x coordinate of the second alcohol + 100 so that it starts to the right of it
    product.drawEther(); //draws the ether made in the previous line
    //all of the lines below use text to draw the addition symbols, reactions arrows, catalysts and water(H₂O) as it is a product
    text("+", xCarbon+50, height/2);
    text("-----→", a.getLastXCarbonOfAlcohol()+50, height/2);
    textSize(15);
    text("H", a.getLastXCarbonOfAlcohol()+65, height/2-10);
    text("+", a.getLastXCarbonOfAlcohol()+75, height/2-15);
    textSize(20);
    text("+     H₂O", product.getLastXCarbonOfEther()+30, height/2);
  }
  
  //public function that returns the number of carbons of an alcohol to be used in reactions of other compoounds
  public float getNumCarbons() {
    return numOfCarbons;
  }
  
  //public function that returns the x coordinate of the last carbon of the alcohol to be used in reactions of other compoounds
  public float getLastXCarbonOfAlcohol() {
    return xCarbon;
  }
}  
  
