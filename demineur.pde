import javax.swing.JOptionPane;
final int TAILLE_CASE = 10;

boolean[][][] TableauMine;
int sizeX = 0;
int sizeY = 0;

void setup ()
{
  String inputEntry = "";
  inputEntry = JOptionPane.showInputDialog(null, "Quelle difficulté? ([e]asy, [m]edium, [h]ard, [p]ersonalized");
  int nombreBombe = 0;
  
  switch (inputEntry) {
    case "e":
      sizeX = 10;
      sizeY = 10;
      nombreBombe = 15;
      break;
    case "m":
      sizeX = 25;
      sizeY = 30;
      nombreBombe = 50;
      break;
    case "h":
      sizeX = 40;
      sizeY = 60;
      nombreBombe = 120;
      break;
    default:
      sizeX = int(JOptionPane.showInputDialog(null, "Combien de Case de largeur?")); 
      sizeY = int(JOptionPane.showInputDialog(null, "Combien de case de hauteur?")); 
      nombreBombe = int(JOptionPane.showInputDialog(null, "Combien de bombes?")); 
  }
  
  
  
  
}


void draw ()
{
}

void mouseClicked()
{
}
