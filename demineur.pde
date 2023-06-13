import javax.swing.JOptionPane;

final int TAILLE_CASE = 10;

//Tab[x][y][0] == true si l'utilisateur sait le contenu de la case
//Tab[x][y][1] == true s'il y a une mine  
boolean[][][] TableauMine;

int sizeX = 0;
int sizeY = 0;
int nombreBombe = 0;

void setup ()
{
  String inputEntry = "";
  inputEntry = JOptionPane.showInputDialog(null, "Quelle difficulté? ([e]asy, [m]edium, [h]ard, [p]ersonalized");
  
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
  
  windowResize(10 + sizeX * TAILLE_CASE, 10 + sizeY * TAILLE_CASE);
  
  TableauMine = new boolean[sizeX+2][sizeY+2][2];
  initialiseTableauVide();
  initialiseLesBombes();
  
  
} //<>//


void draw ()
{
}

void mouseClicked()
{
}

//personalized functions
public void initialiseTableauVide()
{
  for(int i=0;i<sizeX+2;i++) for(int j=0; j<sizeY+2;j++)
  {
    TableauMine[i][j][0] = false;
    TableauMine[i][j][1] = false;
  }
}

public void initialiseLesBombes()
{
  for(int i = 0; i < nombreBombe; i++)
  {
    int x,y;
    do
    {
      x = int(random(sizeX));
      y = int(random(sizeY));
    } while(TableauMine[x+1][y+1][1]);
    TableauMine[x+1][y+1][1] = true;
  }
}
