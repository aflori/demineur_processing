import javax.swing.JOptionPane;

final int TAILLE_CASE = 20;
final int MARGE = (3*TAILLE_CASE)/ 2;

//Tab[x][y][0] == true si l'utilisateur sait le contenu de la case
//Tab[x][y][1] == true s'il y a une mine
//Tab[x][y][2] == true si le joueur a indiqué qu'il y avait une bombe dans la case (implique [0] == true)
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
      sizeX = 30;
      sizeY = 25;
      nombreBombe = 50;
      break;
    case "h":
      sizeX = 60;
      sizeY = 40;
      nombreBombe = 120;
      break;
    default:
      sizeX = int(JOptionPane.showInputDialog(null, "Combien de Case de largeur?")); 
      sizeY = int(JOptionPane.showInputDialog(null, "Combien de case de hauteur?")); 
      nombreBombe = int(JOptionPane.showInputDialog(null, "Combien de bombes?")); 
  }
  
  windowResize(MARGE + sizeX * TAILLE_CASE, MARGE + sizeY * TAILLE_CASE);
  
  TableauMine = new boolean[sizeX+2][sizeY+2][3];
  initialiseTableauVide();
  initialiseLesBombes();
  
}


void draw ()
{ //<>//
  afficherLaGrille(TableauMine, sizeX, sizeY);
}

void mouseClicked()
{
  if ( mouseButton == LEFT)
  {
    operationLeft(TableauMine);
  }
  else if (mouseButton == RIGHT)
  {
    operationRight(TableauMine);
  }
  //no need for the CENTER value
}

//personalized functions
public void initialiseTableauVide()
{
  for(int i=0;i<sizeX+2;i++) for(int j=0; j<sizeY+2;j++)
  {
    TableauMine[i][j][0] = false;
    TableauMine[i][j][1] = false;
    TableauMine[i][j][2] = false;
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
