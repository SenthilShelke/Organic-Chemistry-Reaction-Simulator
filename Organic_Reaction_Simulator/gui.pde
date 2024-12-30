/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:filePicker:12356:
     // It is safe to enter your event code here  
 } //_CODE_:filePicker:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:w:206832:
  appc.background(230);
} //_CODE_:w:206832:

public void filePicker_handler(GButton source, GEvent event) { //_CODE_:filePicker:527736:
  println("file_picker - GButton >> GEvent." + event + " @ " + millis());
  selectInput("Select a file to process:", "fileSelected");
} //_CODE_:filePicker:527736:

public void previous_reaction_button_click1(GButton source, GEvent event) { //_CODE_:next_reaction_button:719766:
  println("previous_reaction_button - GButton >> GEvent." + event + " @ " + millis());
  println("previous_reaction_button - GButton >> GEvent." + event + " @ " + millis());
  //the following if statements check if the index of the array list is greater than 0 and if the selected reaction corresponds to the correct type of compound, if it is then decrease it by 1 showing the previous reaction 
  if(alkeneIndex > 0 && (selectedReaction.equals("Hydration") || selectedReaction.equals("Hydrogenation"))) {
    alkeneIndex -= 1;
  }
  else if(aldehydeForOxidationAndReductionIndex > 0 && (selectedReaction.equals("Aldehyde Oxidation") || selectedReaction.equals("Aldehyde Reduction"))) {
    aldehydeForOxidationAndReductionIndex -= 1;
  }
  else if(alcoholForOxidationIndex > 0 && selectedReaction.equals("Alcohol Oxidation")) {
    alcoholForOxidationIndex -= 1;
  }
  else if(alcohol1ForCondensationIndex > 0 && selectedReaction.equals("Alcohol Condensation")) {
    alcohol1ForCondensationIndex -= 1;
    alcohol2ForCondensationIndex -= 1;
  }
  //else if(alcohol2ForCondensationIndex > 0 && selectedReaction.equals("Alcohol Condensation")) {
  //  alcohol2ForCondensationIndex -= 1;
  //}
  else if(amideForHydrolysisIndex > 0 && selectedReaction.equals("Amide Hydrolysis")) {
    amideForHydrolysisIndex -= 1;
  }
  else if(carboxyllicAcidForEsterficationIndex > 0 && selectedReaction.equals("Esterfication")) {
    carboxyllicAcidForEsterficationIndex -= 1;
  }
  else if(alcoholForEsterficationIndex > 0 && selectedReaction.equals("Esterfication")) {
    alcoholForEsterficationIndex -= 1;
  }
  else if(carboxyllicAcidForCondensationIndex > 0 && selectedReaction.equals("Carboxyllic Acid Condensation")) {
    carboxyllicAcidForCondensationIndex -= 1;
    amineForCondensationIndex -= 1;
  }
  else if(esterForHydrolysisAndSaponificationIndex > 0 && (selectedReaction.equals("Ester Hydrolysis") || selectedReaction.equals("Saponification"))) {
    esterForHydrolysisAndSaponificationIndex -= 1;
  }
  else if(ketoneForReductionIndex > 0 && selectedReaction.equals("Ketone Reduction")) {
    ketoneForReductionIndex -= 1;
  }
  loop();
} //_CODE_:next_reaction_button:719766:

public void next_reaction_button_click1(GButton source, GEvent event) { //_CODE_:next_reaction_button:719766:
  println("next_reaction_button - GButton >> GEvent." + event + " @ " + millis());
  //the following if statements check if the index of the array list is greater than or equal 0 and it is less than one less than the length of the array list and that the selected reaction corresponds to the correct type of compound, and if it is it increases the index by 1 to show the next reaction
  if(alkeneIndex >= 0 && alkeneIndex < alkenes.size()-1 && (selectedReaction.equals("Hydration") || selectedReaction.equals("Hydrogenation"))) {
    alkeneIndex += 1;
  }
  if(aldehydeForOxidationAndReductionIndex >= 0 && aldehydeForOxidationAndReductionIndex < aldehydesForOxidationAndReduction.size()-1 && (selectedReaction.equals("Aldehyde Oxidation") || selectedReaction.equals("Aldehyde Reduction"))){
    aldehydeForOxidationAndReductionIndex += 1;
  }
  else if(alcoholForOxidationIndex >= 0 && alcoholForOxidationIndex < alcoholsForOxidation.size()-1 && selectedReaction.equals("Alcohol Oxidation")) {
    alcoholForOxidationIndex += 1;
  }
  else if(alcohol1ForCondensationIndex >= 0 && alcohol1ForCondensationIndex < alcohols1ForCondensation.size()-1 && selectedReaction.equals("Alcohol Condensation")) {
    alcohol1ForCondensationIndex += 1;
    alcohol2ForCondensationIndex += 1;
  }
  //else if(alcohol2ForCondensationIndex >= 0 && alcohol2ForCondensationIndex < alcohols2ForCondensation.size()-1 && selectedReaction.equals("Alcohol Condensation")) {
  //  alcohol2ForCondensationIndex += 1;
  //}
  else if(amideForHydrolysisIndex >= 0 && amideForHydrolysisIndex < amidesForHydrolysis.size()-1 && selectedReaction.equals("Amide Hydrolysis")) {
    amideForHydrolysisIndex += 1;
  }
  else if(carboxyllicAcidForEsterficationIndex >= 0 && carboxyllicAcidForEsterficationIndex < carboxyllicAcidsForEsterfication.size()-1 && selectedReaction.equals("Esterfication")) {
    carboxyllicAcidForEsterficationIndex += 1;
  }
  else if(alcoholForEsterficationIndex >= 0 && alcoholForEsterficationIndex < alcoholsForEsterfication.size()-1 && selectedReaction.equals("Esterfication")) {
    alcoholForEsterficationIndex += 1;
  }
  else if(carboxyllicAcidForCondensationIndex >= 0 && carboxyllicAcidForCondensationIndex < carboxyllicAcidsForCondensation.size()-1 && selectedReaction.equals("Carboxyllic Acid Condensation")) {
    carboxyllicAcidForCondensationIndex += 1;
    amineForCondensationIndex += 1;
  }
  else if(esterForHydrolysisAndSaponificationIndex >= 0 && esterForHydrolysisAndSaponificationIndex < estersForHydrolysisAndSaponification.size()-1 && (selectedReaction.equals("Ester Hydrolysis") || selectedReaction.equals("Saponification"))) {
    esterForHydrolysisAndSaponificationIndex += 1;
  }
  else if(ketoneForReductionIndex >= 0 && ketoneForReductionIndex < ketonesForReduction.size()-1 && selectedReaction.equals("Ketone Reduction")) {
    ketoneForReductionIndex += 1;
  }
  loop();
} //_CODE_:previous_reaction_button:719766:

public void reactionPickerDropdown_click1(GDropList source, GEvent event) { //_CODE_:reactionPickerDropdown:874823:
  println("reactionPickerDropdown - GDropList >> GEvent." + event + " @ " + millis());
  selectedReaction = source.getSelectedText(); //sets the type of reaction equal to the reaction chosen from the drop down menu
  userSelectedFile = null; //resets the user selected file to nothing when a new reaction is chosen
  //reloadReactionData(); //reloads all of the data from the files when a new reaction is chosen
  reloadReactionDataNeeded = true; //setting the variable true so that data will be reloaded when the drop down is clicked
  loop();
} //_CODE_:reactionPickerDropdown:874823:

void reloadReactionData() {
  try {
  //all of these if statements check which drop down list value is selected and reloads the data of that reaction, resets the index and creates a new array list for it(so that the values are reset when a new reaction is selected) 
    if(selectedReaction.equals("Hydration")) {
      alkenes = new ArrayList();
      alkeneIndex = 0;      
      loadAlkenesData();
    } 
    else if (selectedReaction.equals("Hydrogenation")) {
      alkenes = new ArrayList();
      alkeneIndex = 0;      
      loadAlkenesData();
    } 
    else if(selectedReaction.equals("Aldehyde Reduction")) {
      aldehydesForOxidationAndReduction = new ArrayList();
      aldehydeForOxidationAndReductionIndex = 0;
      loadAldehydesForOxidationAndReductionData();
    } 
    else if(selectedReaction.equals("Aldehyde Oxidation")) {
      aldehydesForOxidationAndReduction = new ArrayList();
      aldehydeForOxidationAndReductionIndex = 0;
      loadAldehydesForOxidationAndReductionData();
    } 
    else if(selectedReaction.equals("Ketone Reduction")) {
      ketonesForReduction = new ArrayList();
      loadKetonesForReductionData();
      ketoneForReductionIndex = 0;
    }
    else if(selectedReaction.equals("Alcohol Oxidation")) {
      alcoholsForOxidation = new ArrayList();
      loadAlcoholsForOxidationData();
      alcoholForOxidationIndex = 0;
    } 
    else if(selectedReaction.equals("Alcohol Condensation")) {
      alcohols1ForCondensation = new ArrayList();
      alcohols2ForCondensation = new ArrayList();
      loadAlcohols1ForCondensationData();
      loadAlcohols2ForCondensationData();
      alcohol1ForCondensationIndex = 0;
      alcohol2ForCondensationIndex = 0;
    }
    else if(selectedReaction.equals("Amide Hydrolysis")) {
      amidesForHydrolysis = new ArrayList();
      loadAmidesForHydrolysisData();
      amideForHydrolysisIndex = 0;
    } 
    else if(selectedReaction.equals("Esterfication")) {
      carboxyllicAcidsForEsterfication = new ArrayList();
      alcoholsForEsterfication = new ArrayList();
      loadCarboxyllicAcidsForEsterficationData();
      loadAlcoholsForEsterficationData();
      carboxyllicAcidForEsterficationIndex = 0;
      alcoholForEsterficationIndex = 0;
    } 
    else if(selectedReaction.equals("Carboxyllic Acid Condensation")) {
      carboxyllicAcidsForCondensation = new ArrayList();
      aminesForCondensation = new ArrayList();
      loadCarboxyllicAcidsForCondensationData();
      loadAminesForCondensationData();
      carboxyllicAcidForCondensationIndex = 0;
      amineForCondensationIndex = 0;
    } 
    else if(selectedReaction.equals("Ester Hydrolysis")) {
      estersForHydrolysisAndSaponification = new ArrayList();
      loadEstersForHydrolysisAndSaponificationData();
      esterForHydrolysisAndSaponificationIndex = 0;
    }
    else if(selectedReaction.equals("Saponification")) {
      estersForHydrolysisAndSaponification = new ArrayList();
      loadEstersForHydrolysisAndSaponificationData();
      esterForHydrolysisAndSaponificationIndex = 0;
    }
  } catch (Exception e) { //if there is an error in loading the files, then it will catch it and output an error onto the window
    textSize(20);
    fill(0);
    text("There was an error processing the file that you uploaded, please check that the format of the file matches the sample files.", 150, height/2);
  }
}

//function for user file selection
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
    userSelectedFile = null; //if no file was chosen, then the user input file is set to nothing
  } else {
    userSelectedFile = selection.getAbsolutePath(); //otherwise if a file was chosen, set the user file equal to that file
    //reloadReactionData(); //reloads the data for the reaction each time a new file is selected
    reloadReactionDataNeeded = true; //setting the variable true so that data will be reloaded when the button is clicked
    println("User selected input file: " + userSelectedFile);  
  }
  loop();
}


// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  w = GWindow.getWindow(this, "Reaction Menu", 0, 0, 230, 400, JAVA2D);
  w.noLoop();
  w.setActionOnClose(G4P.KEEP_OPEN);
  w.addDrawHandler(this, "win_draw1");
  filePicker = new GButton(w, 37, 308, 140, 43);
  filePicker.setText("Choose your input file");
  filePicker.addEventHandler(this, "filePicker_handler");
  previous_reaction_button = new GButton(w, 10, 363, 36, 30);
  previous_reaction_button.setText("<");
  previous_reaction_button.addEventHandler(this, "previous_reaction_button_click1");
  next_reaction_button = new GButton(w, 157, 362, 36, 30);
  next_reaction_button.setText(">");
  next_reaction_button.addEventHandler(this, "next_reaction_button_click1");
  reactionPickerDropdown = new GDropList(w, 37, 14, 150, 280, 9, 10);
  reactionPickerDropdown.setItems(loadStrings("list_874823"), 0);
  reactionPickerDropdown.addEventHandler(this, "reactionPickerDropdown_click1");
  w.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow w;
GButton filePicker; 
GButton previous_reaction_button;
GButton next_reaction_button; 
GDropList reactionPickerDropdown; 
