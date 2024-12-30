class Ether {
  //Fields 
  float xCarbon; //x coordinate of the carbon
  float yCarbon = 250; //y coordinate of the carbon(initially 250)
  float deltaY; //change in y used to change the y coordinate to form a zig zag pattern
  float parentChainLength; //number of carbons in the parent chain
  float branchChainLength; //number of carbons in the branch chain
  
  //Constructor that takes in the parent chain length, branch chain length and x coordinate as ethers are always a product
  Ether(float pcl, float bcl, float x) {
    this.parentChainLength = pcl;
    this.branchChainLength = bcl;
    this.xCarbon = x;
  }
  
  //Methods
  
  //function to draw the ether
  void drawEther() {
    fill(0);
    textSize(20);
    
    for(int i=0; i < this.parentChainLength+this.branchChainLength; i++) { //for loop that goes till the end of the sum of the parent and branch chain length to draw the structure
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
  
  //public function that returns the x coordinate of the last carbon of the ether to be used in other reactions
  public float getLastXCarbonOfEther() {
    return xCarbon;
  }
}
