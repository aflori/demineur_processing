public void operationLeft(boolean[][][] tab)
{
  //Enregistrement des valeurs pour les calcules et pour connaître le type
  float positionX = mouseX;
  float positionY = mouseY;
  
  positionX -= MARGE/2.0;
  positionY -= MARGE/2.0;
  
  int coordTableauX = int(positionX / (float) TAILLE_CASE);
  int coordTableauY = int(positionY / (float) TAILLE_CASE);
  coordTableauX++; coordTableauY++;
  
  if(tab[coordTableauX][coordTableauY][0])
  {
    //sera fait dans une prochaine mise à jour
  }
  else
  {
    tab[coordTableauX][coordTableauY][0] = true;
  }
}

public void operationRight(boolean[][][] tab)
{
  float positionX = mouseX;
  float positionY = mouseY;
  
  positionX -= MARGE/2.0;
  positionY -= MARGE/2.0;
  
  int coordTableauX = int(positionX / (float) TAILLE_CASE);
  int coordTableauY = int(positionY / (float) TAILLE_CASE);
  coordTableauX++; coordTableauY++;
  
  if(tab[coordTableauX][coordTableauY][0])
  {
    // Erreur
  }
  else
  {
    tab[coordTableauX][coordTableauY][2] = !tab[coordTableauX][coordTableauY][2];
  }
  
}
