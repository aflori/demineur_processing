public void operationLeft(boolean[][][] tab, int coordTableauX, int coordTableauY)
{
  //Enregistrement des valeurs pour les calcules et pour connaître le type
  
  
  if(tab[coordTableauX][coordTableauY][0])
  {
    if(tab[coordTableauX][coordTableauY][0] && !tab[coordTableauX][coordTableauY][1] && bonNombreDeBombeAutour(tab,coordTableauX,coordTableauY) )
    {
      devoileValeurAutour(tab,coordTableauX,coordTableauY);
    }
  }
  else
  {
    if (!tab[coordTableauX][coordTableauY][2])
    {
      tab[coordTableauX][coordTableauY][0] = true;
      if (tab[coordTableauX][coordTableauY][1])
      {
        println("Perdu");
        for (int i = 0; i< sizeX;i++) for (int j=0; j<sizeY;j++)
        {
          if(tab[i+1][j+1][1])
          {
            tab[i+1][j+1][0] = true;
          }
        }
      }
    }
  }
}

public void operationRight(boolean[][][] tab, int coordTableauX, int coordTableauY)
{
  
  if(!tab[coordTableauX][coordTableauY][0])
  {
     tab[coordTableauX][coordTableauY][2] = !tab[coordTableauX][coordTableauY][2];
  }
  
}

public boolean bonNombreDeBombeAutour(boolean[][][] tab, int x, int y)
{
  int NombreBombes = getNombreBombeAutour(tab,x,y);
  int compteurbombe = 0;
  for(int i= x-1; i<=x+1; i++) for(int j = y-1; j<= y+1; j++)
  {
    if ( (tab[i][j][0] && tab[i][j][1]) || (!tab[i][j][0] && tab[i][j][2]))
    {
      compteurbombe++;
    }
  }
  return compteurbombe == NombreBombes;
}

public void devoileValeurAutour(boolean [][][] tab, int x, int y)
{
  for( int i=x-1;i<=x+1;i++) for(int j=y-1;j<=y+1;j++)
  {
    if( !tab[i][j][2])
    {
      tab[i][j][0] = true;
    }
  }
}
