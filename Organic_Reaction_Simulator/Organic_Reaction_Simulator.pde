import g4p_controls.*; //Importing the G4P GUI Builder

//Setting global variables for all the different types of reactions(these are used in the "load" functions are the bottom of this tab)
Table alkeneTable;
ArrayList<Alkene> alkenes = new ArrayList();
int alkeneIndex = 0;

Table aldehydeOxidationAndReductionTable;
ArrayList<Aldehyde> aldehydesForOxidationAndReduction = new ArrayList();
int aldehydeForOxidationAndReductionIndex = 0;

Table alcoholForOxidationTable;
ArrayList<Alcohol> alcoholsForOxidation = new ArrayList();
int alcoholForOxidationIndex = 0;

Table alcohol1ForCondensationTable;
ArrayList<Alcohol> alcohols1ForCondensation = new ArrayList();
int alcohol1ForCondensationIndex = 0;

Table alcohol2ForCondensationTable;
ArrayList<Alcohol> alcohols2ForCondensation = new ArrayList();
int alcohol2ForCondensationIndex = 0;

Table amideForHydrolysisTable;
ArrayList<Amide> amidesForHydrolysis = new ArrayList();
int amideForHydrolysisIndex = 0;

Table carboxyllicAcidForEsterficationTable;
ArrayList<CarboxyllicAcid> carboxyllicAcidsForEsterfication = new ArrayList();
int carboxyllicAcidForEsterficationIndex = 0;

Table alcoholForEsterficationTable;
ArrayList<Alcohol> alcoholsForEsterfication = new ArrayList();
int alcoholForEsterficationIndex = 0;

Table carboxyllicAcidForCondensationTable;
ArrayList<CarboxyllicAcid> carboxyllicAcidsForCondensation = new ArrayList();
int carboxyllicAcidForCondensationIndex = 0;

Table amineForCondensationTable;
ArrayList<Amine> aminesForCondensation = new ArrayList();
int amineForCondensationIndex = 0;

Table esterForHydrolysisAndSaponificationTable;
ArrayList<Ester> estersForHydrolysisAndSaponification = new ArrayList();
int esterForHydrolysisAndSaponificationIndex = 0;

Table ketoneForReductionTable;
ArrayList<Ketone> ketonesForReduction = new ArrayList();
int ketoneForReductionIndex = 0;

String selectedReaction = "Hydration"; //Setting the default reaction as hydration
String userSelectedFile = null; //Setting the default file that the user selects to nothing
String inputFile = null; //setting the input file that is used to draw the compounds to nothing
boolean reloadReactionDataNeeded = false; //global variable for the reaction data loaded function being needed 


void setup() {
    try {
      //loading all of the data files
      loadAlkenesData();
      loadAlkenesData();
      loadAldehydesForOxidationAndReductionData();
      loadKetonesForReductionData();
      loadAlcoholsForOxidationData();
      loadAlcohols1ForCondensationData();
      loadAlcohols2ForCondensationData();
      loadAmidesForHydrolysisData();
      loadCarboxyllicAcidsForEsterficationData();
      loadAlcoholsForEsterficationData();
      loadCarboxyllicAcidsForCondensationData();
      loadAminesForCondensationData();
      loadEstersForHydrolysisAndSaponificationData();
    } catch (Exception e) { //if there is an error in loading the files, then it will catch it and output an error onto the window
      textSize(20);
      fill(0);
      text("There was an error processing the file that you uploaded, please check that the format of the file matches the sample files.", 150, height/2);
    }
    createGUI(); //creating the gui
    size(1200, 500); //setting the main window size
}

void draw() {
  background(255); //white background
  noLoop(); //no loop so that the reactions aren't being animated(makes them still images)
  textSize(20);
  fill(0);
  if(userSelectedFile == null) {
    text("Displaying reactions from default files", 10, 20);
  } else {
    text("Displaying reactions from: " + userSelectedFile, 10, 20);
  }
  if(reloadReactionDataNeeded) { //so that the data is reloaded only when needed
    reloadReactionData();
    reloadReactionDataNeeded = false;
  }
  try {
  //all of these if statements check which drop down list value is selected and draws the type of reaction based on that 
    if(selectedReaction.equals("Hydration")) {
      alkenes.get(alkeneIndex).hydration();
    } 
    else if (selectedReaction.equals("Hydrogenation")) {
      alkenes.get(alkeneIndex).hydrogenation();
    } 
    else if(selectedReaction.equals("Aldehyde Reduction")) {
      aldehydesForOxidationAndReduction.get(aldehydeForOxidationAndReductionIndex).reduction(); 
    } 
    else if(selectedReaction.equals("Aldehyde Oxidation")) {
      aldehydesForOxidationAndReduction.get(aldehydeForOxidationAndReductionIndex).oxidation(); 
    } 
    else if(selectedReaction.equals("Ketone Reduction")) {
      ketonesForReduction.get(ketoneForReductionIndex).reduction();
    } 
    else if(selectedReaction.equals("Alcohol Oxidation")) {
      alcoholsForOxidation.get(alcoholForOxidationIndex).oxidation(); 
    } 
    else if(selectedReaction.equals("Alcohol Condensation")) {
      alcohols1ForCondensation.get(alcohol1ForCondensationIndex).condensation(alcohols2ForCondensation.get(alcohol2ForCondensationIndex));
    } 
    else if(selectedReaction.equals("Amide Hydrolysis")) {
      amidesForHydrolysis.get(amideForHydrolysisIndex).hydrolysis();
    } 
    else if(selectedReaction.equals("Esterfication")) {
      carboxyllicAcidsForEsterfication.get(carboxyllicAcidForEsterficationIndex).esterfication(alcoholsForEsterfication.get(alcoholForEsterficationIndex));
    } 
    else if(selectedReaction.equals("Carboxyllic Acid Condensation")) {
      carboxyllicAcidsForCondensation.get(carboxyllicAcidForCondensationIndex).condensation(aminesForCondensation.get(amineForCondensationIndex));
    } 
    else if(selectedReaction.equals("Ester Hydrolysis")) {
      estersForHydrolysisAndSaponification.get(esterForHydrolysisAndSaponificationIndex).hydrolysis();
    } 
    else if(selectedReaction.equals("Saponification")) {
      estersForHydrolysisAndSaponification.get(esterForHydrolysisAndSaponificationIndex).saponification();
    }
  } catch (Exception e) { //if there is an error in loading the files, then it will catch it and output an error onto the window
    textSize(20);
    fill(0);
    text("There was an error processing the file that you uploaded, please check that the format of the file matches the sample files.", 150, height/2);
  }
}

//all of these functions read data from the CSV files and put those values in an array list, which is iterated through when being drawn to show the same reaction with different a number of carbons
void loadAlkenesData() throws Exception { //means that this function could throw an exception
  String inputFile; //declaring a variable for this function to hold the input file
  if(userSelectedFile != null) {
    inputFile = userSelectedFile; //if the user selected file is equal to something, then set the input file equal to that file
  } else {
    inputFile = "alkenes.csv"; //otherwise, use the default file in the program
  }
  alkeneTable = loadTable(inputFile, "header"); //loads the CSV file using "loadTable"
  for (TableRow row : alkeneTable.rows()) { //iterates through the table using a for loop
    int lengthOfMolecule = row.getInt("lengthOfMolecule"); //finds the length of the molecule by finding the number under the heading called "lengthOfMolecule" in the file
    int doubleBondLocation = row.getInt("doubleBondLocation"); //finds the double bond location by finding the number under the heading called "doubleBondLocation" in the file
    if(lengthOfMolecule > 8 || doubleBondLocation > lengthOfMolecule) {
      throw new Exception("Cannot display reaction"); //will say error in the file if the molecule length is greater than 8 as the reactants and products will go far off the screen, and the double bond location cannot be higher than the length of the molecule
    }
    Alkene alkene = new Alkene(lengthOfMolecule, doubleBondLocation); //creates a new alkene using the parameters that were found in the previous two lines
    alkenes.add(alkene); //adds the alkene that was made in the previous line to the global array list of alkenes
  } 
}

//The same function as above is essentially repeated in the below functions just reading different files

void loadAldehydesForOxidationAndReductionData() throws Exception {
  String inputFile;
  if(userSelectedFile != null) {
    inputFile = userSelectedFile;
  } else {
    inputFile = "aldehydesForOxidationAndReduction.csv";
  }
  aldehydeOxidationAndReductionTable = loadTable(inputFile, "header");
  for (TableRow row : aldehydeOxidationAndReductionTable.rows()) {
    int lengthOfMolecule = row.getInt("lengthOfMolecule");
    if(lengthOfMolecule > 8) {
      throw new Exception("Cannot display reaction");
    }
    Aldehyde aldehyde = new Aldehyde(lengthOfMolecule, 20);
    aldehydesForOxidationAndReduction.add(aldehyde);
  } 
}

void loadAlcoholsForOxidationData() throws Exception {
  String inputFile;
  if(userSelectedFile != null) {
    inputFile = userSelectedFile;
  } else {
    inputFile = "alcoholsForOxidation.csv";
  }
  alcoholForOxidationTable = loadTable(inputFile, "header");
  for(TableRow row : alcoholForOxidationTable.rows()) {
    int lengthOfMolecule = row.getInt("lengthOfMolecule");
    if(lengthOfMolecule > 8) {
      throw new Exception("Cannot display reaction");
    }
    Alcohol alcohol = new Alcohol(lengthOfMolecule, 1);
    alcoholsForOxidation.add(alcohol);
  }
}

void loadAlcohols1ForCondensationData() throws Exception {
  String inputFile;
  if(userSelectedFile != null) {
    inputFile = userSelectedFile;
  } else {
    inputFile = "alcohols1ForCondensation.csv";
  }
  alcohol1ForCondensationTable = loadTable(inputFile, "header");
  for(TableRow row : alcohol1ForCondensationTable.rows()) {
    int lengthOfMolecule = row.getInt("lengthOfMolecule");
    if(lengthOfMolecule > 8) {
      throw new Exception("Cannot display reaction");
    }
    Alcohol alcohol = new Alcohol(lengthOfMolecule, 1);
    alcohols1ForCondensation.add(alcohol);
  }
}

void loadAlcohols2ForCondensationData() throws Exception {
  String inputFile;
  if(userSelectedFile != null) {
    inputFile = userSelectedFile;
  } else {
    inputFile = "alcohols2ForCondensation.csv";
  }
  alcohol2ForCondensationTable = loadTable(inputFile, "header");
  for(TableRow row : alcohol2ForCondensationTable.rows()) {
    int lengthOfMolecule = row.getInt("lengthOfMolecule");
    if(lengthOfMolecule > 8) {
      throw new Exception("Cannot display reaction");
    }
    Alcohol alcohol = new Alcohol(lengthOfMolecule, 1);
    alcohols2ForCondensation.add(alcohol);
  }
}

void loadAmidesForHydrolysisData() throws Exception {
  String inputFile;
  if(userSelectedFile != null) {
    inputFile = userSelectedFile;
  } else {
    inputFile = "amidesForHydrolysis.csv";
  }
  amideForHydrolysisTable = loadTable(inputFile, "header");
  for (TableRow row : amideForHydrolysisTable.rows()) {
    int parentChainLength = row.getInt("parentChainLength");
    int branchChainLength = row.getInt("branchChainLength");
    if(parentChainLength > 8 || branchChainLength > 8) {
      throw new Exception("cannot display reaction");
    }
    Amide amide = new Amide(parentChainLength, branchChainLength, 20);
    amidesForHydrolysis.add(amide);
  } 
}

void loadCarboxyllicAcidsForEsterficationData() throws Exception {
  String inputFile;
  if(userSelectedFile != null) {
    inputFile = userSelectedFile;
  } else {
    inputFile = "carboxyllicAcidsForEsterfication.csv";
  }
  carboxyllicAcidForEsterficationTable = loadTable(inputFile, "header");
  for(TableRow row : carboxyllicAcidForEsterficationTable.rows()) {
    int lengthOfMolecule = row.getInt("lengthOfMolecule");
    if(lengthOfMolecule > 8) {
      throw new Exception("Cannot display reaction");
    }
    CarboxyllicAcid carboxyllicAcid = new CarboxyllicAcid(lengthOfMolecule);
    carboxyllicAcidsForEsterfication.add(carboxyllicAcid);
  }
}

void loadAlcoholsForEsterficationData() throws Exception {
  String inputFile;
  if(userSelectedFile != null) {
    inputFile = userSelectedFile;
  } else {
    inputFile = "alcoholsForEsterfication.csv";
  }
  alcoholForEsterficationTable = loadTable(inputFile, "header");
  for(TableRow row : alcoholForEsterficationTable.rows()) {
    int lengthOfMolecule = row.getInt("lengthOfMolecule");
    if(lengthOfMolecule > 8) {
      throw new Exception("Cannot display reaction");
    }
    Alcohol alcohol = new Alcohol(lengthOfMolecule, 1);
    alcoholsForEsterfication.add(alcohol);
  }
}

void loadCarboxyllicAcidsForCondensationData() throws Exception {
  String inputFile;
  if(userSelectedFile != null) {
    inputFile = userSelectedFile;
  } else {
    inputFile = "carboxyllicAcidsForCondensation.csv";
  }
  carboxyllicAcidForCondensationTable = loadTable(inputFile, "header");
  for(TableRow row : carboxyllicAcidForCondensationTable.rows()) {
    int lengthOfMolecule = row.getInt("lengthOfMolecule");
    if(lengthOfMolecule > 8) {
      throw new Exception("Cannot display reaction");
    }
    CarboxyllicAcid carboxyllicAcid = new CarboxyllicAcid(lengthOfMolecule);
    carboxyllicAcidsForCondensation.add(carboxyllicAcid);
  }
}

void loadAminesForCondensationData() throws Exception {
  String inputFile;
  if(userSelectedFile != null) {
    inputFile = userSelectedFile;
  } else {
    inputFile = "aminesForCondensation.csv";
  }
  amineForCondensationTable = loadTable(inputFile, "header");
  for (TableRow row : amineForCondensationTable.rows()) {
    int lengthOfMolecule = row.getInt("lengthOfMolecule");
    if(lengthOfMolecule > 8) {
      throw new Exception("Cannot display reaction");
    }
    Amine amine = new Amine(lengthOfMolecule);
    aminesForCondensation.add(amine);
  } 
}

void loadEstersForHydrolysisAndSaponificationData() throws Exception {
  String inputFile;
  if(userSelectedFile != null) {
    inputFile = userSelectedFile;
  } else {
    inputFile = "estersForHydrolysisAndSaponification.csv";
  }
  esterForHydrolysisAndSaponificationTable = loadTable(inputFile, "header");
  for (TableRow row : esterForHydrolysisAndSaponificationTable.rows()) {
    int parentChainLength = row.getInt("parentChainLength");
    int branchChainLength = row.getInt("branchChainLength");
    if(parentChainLength > 8 || branchChainLength > 8) {
      throw new Exception("cannot display reaction");
    }
    Ester ester = new Ester(parentChainLength, branchChainLength);
    estersForHydrolysisAndSaponification.add(ester);
  } 
}

void loadKetonesForReductionData() throws Exception {
  String inputFile;
  if(userSelectedFile != null) {
    inputFile = userSelectedFile;
  } else {
    inputFile = "ketonesForReduction.csv";
  }
  ketoneForReductionTable = loadTable(inputFile, "header");
  for (TableRow row : ketoneForReductionTable.rows()) {
    int lengthOfMolecule = row.getInt("lengthOfMolecule");
    int carbonylGroupLocation = row.getInt("carbonylGroupLocation");
    if(lengthOfMolecule > 8 || carbonylGroupLocation > lengthOfMolecule) {
      throw new Exception("cannot display reaction");
    }
    Ketone ketone = new Ketone(lengthOfMolecule, carbonylGroupLocation);
    ketonesForReduction.add(ketone);
  } 
}
