public void afficherLaGrille(boolean[][][] Tab, int sizeX, int sizeY)
{
  final color c_nonTrouve = color(255,255,255);
  final color c_caseVide = color(150,150,150);
  final color c_caseBombe = color(255,50,25);
  final color c_bombeSupose = color(150, 100,50);
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
         if (
         fill(c_nonTrouve);
       }
       rect(MARGE/2.0 + i*TAILLE_CASE, MARGE/2.0 + j*TAILLE_CASE, TAILLE_CASE, TAILLE_CASE);
    }
  }
}
