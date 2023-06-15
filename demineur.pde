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
int caseDecouvert = 0;
int caseSansBombe = 0;

boolean partieEnCour = true;
boolean fenettreAEffacer = false;

void setup ()
{
  String inputEntry = "";
  do
  {
    inputEntry = JOptionPane.showInputDialog(null, "Quelle difficulté? ([e]asy, [m]edium, [h]ard, [p]ersonalized"); //<>//
  } while( inputEntry.equals(""));
  switch (inputEntry.charAt(0)) {
    case 'e':
      sizeX = 10;
      sizeY = 10;
      nombreBombe = 10;
      break;
    case 'm':
      sizeX = 16;
      sizeY = 16;
      nombreBombe = 40;
      break;
    case 'h':
      sizeX = 30;
      sizeY = 16;
      nombreBombe = 111;
      break;
    default:
      do
      {
        sizeX = int(JOptionPane.showInputDialog(null, "Combien de Case de largeur?")); 
        sizeY = int(JOptionPane.showInputDialog(null, "Combien de case de hauteur?")); 
        nombreBombe = int(JOptionPane.showInputDialog(null, "Combien de bombes?"));
        
        if(sizeX*sizeY <= nombreBombe)
        {
          println("Ces valeurs ne sont pas correctes, entrez-les à nouveau");
        }
        else
        {
          break;
        }
      }while(true);
  }
  caseSansBombe = sizeX * sizeY - nombreBombe;
  windowResize(MARGE + sizeX * TAILLE_CASE, MARGE + sizeY * TAILLE_CASE);
  
  TableauMine = new boolean[sizeX+2][sizeY+2][3];
  initialiseTableauVide();
  initialiseLesBombes(); //<>//
  
}


void draw ()
{
  if(fenettreAEffacer) exit();
  afficherLaGrille(TableauMine, sizeX, sizeY);
}

void mouseClicked()
{
  if(! partieEnCour)
  {
    fenettreAEffacer = true;
  }
  else
  {
    float positionX = mouseX;
    float positionY = mouseY;
    
    positionX -= MARGE/2.0;
    positionY -= MARGE/2.0;
    
    int coordTableauX = int(positionX / (float) TAILLE_CASE);
    int coordTableauY = int(positionY / (float) TAILLE_CASE);
    coordTableauX++; coordTableauY++;
    if ( mouseButton == LEFT)
    {
      operationLeft(TableauMine, coordTableauX, coordTableauY);
    }
    else if (mouseButton == RIGHT)
    {
      operationRight(TableauMine, coordTableauX, coordTableauY);
    }
    //no need for the CENTER value
  }
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
  { //<>//
    int x,y;
    do
    {
      x = int(random(sizeX));
      y = int(random(sizeY));
    } while(TableauMine[x+1][y+1][1]);
    TableauMine[x+1][y+1][1] = true;
  }
}
