public void afficherLaGrille(boolean[][][] Tab, int sizeX, int sizeY)
{
  final color c_nonTrouve = color(255,255,255);
  final color c_caseVide = color(150,150,150);
  final color c_caseBombe = color(255,50,25);
  final color c_bombeSupose = color(150, 100,50);
  final color c_noir = color(0,0,0);
  
  for(int i=0; i< sizeX; i++)
  {
    for(int j=0; j<sizeY;j++)
    {
       if (Tab[i+1][j+1][0])
       {
         if(Tab[i+1][j+1][1]) //il y a une mine
         {
           fill(c_caseBombe);
         }
         else // il n'y en a pas
         {
           fill(c_caseVide);
         }
       }
       else // case non découvert
       {
         if (Tab[i+1][j+1][2])
         {
           fill(c_bombeSupose);
         }
         else
         {
           fill(c_nonTrouve);
         }
       }
       rect(MARGE/2.0 + i*TAILLE_CASE, MARGE/2.0 + j*TAILLE_CASE, TAILLE_CASE, TAILLE_CASE);
    }
  }
  
  fill(c_noir);
  for(int i=0; i< sizeX;i++) for(int j=0;j<sizeY ; j++)
  {
    if(Tab[i+1][j+1][0] && !Tab[i+1][j+1][1])
    {
       text( getNombreBombeAutour(Tab,i+1,j+1), MARGE/2.0 + i*TAILLE_CASE + 0.4*TAILLE_CASE,MARGE/2.0 + (j+0.8)*TAILLE_CASE);
    }
  }
}

public int getNombreBombeAutour(boolean[][][] tab, int x, int y)
{
  int nombreBombe =0;
  for (int i= x-1;i <= x+1 ; i++) for (int j = y-1; j <= y+1; j++)
  {
    if( tab[i][j][1] && ( i != x || j != y) )
    {
      nombreBombe++;
    }
  }
  
  return nombreBombe;
}
