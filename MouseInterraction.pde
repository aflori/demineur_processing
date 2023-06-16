
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
      devoilerCase(tab, coordTableauX, coordTableauY);
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
    if( !tab[i][j][2] && !tab[i][j][0])
    {
      devoilerCase(tab,i,j);
    }
  }
}


public void devoilerCase(boolean[][][] tab, int x, int y)
{
  if (x == 0 || y == 0 || x == (sizeX+1) || y == (sizeY+1) || !partieEnCour) return ;
  tab[x][y][0] = true;
  if (tab[x][y][1])
  {
     println("Perdu");
     for (int i = 0; i< sizeX;i++) for (int j=0; j<sizeY;j++)
     {
       if(tab[i+1][j+1][1])
       {
         tab[i+1][j+1][0] = true;
       }
     }
     partieEnCour = false;
  }
  else
  {
    caseDecouvert++;
    
    
    if(getNombreBombeAutour(tab,x,y) == 0)
    {
      //old recursive fonction was launch with "extendValeurDeclarer(tab, x, y);"
      boolean resterDansLeWhile = true;
      while(resterDansLeWhile) //<>//
      {
        resterDansLeWhile = false;
        for (int i=1; i <= sizeX;i++)
        {
          for(int j=1; j<=sizeY; j++)
          {
            if( tab[i][j][0] && getNombreBombeAutour(tab, i, j) == 0 )
            { // case dévoilé sachant que l'on n'a pas dévoilé de bombe sinon la partie serait déjà fini
              for(int x2 = i-1; x2<= i+1;x2++)
              {
                for(int y2 = j-1; y2<= j+1;y2++)
                {
                  if(x2 > 0 && x2 <= sizeX && y2 > 0 && y2 <=sizeY && !tab[x2][y2][0])
                  {
                    resterDansLeWhile = true; // on continue la boucle while: c'est peut être un getNombreBombeAutour == 0
                    tab[x2][y2][0] = true; // dévoilement de la case
                    caseDecouvert++;     // incrémentation du compteur qui indique combien de case ont été dévoilés
                  }
                }
              }
            }
          }
        }
      }
    }

    if(caseDecouvert >= caseSansBombe)
    {
      println("Gagné");
      partieEnCour = false;
    }
  }
}
