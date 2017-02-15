#NoEnv
#Warn
#SingleInstance Force
SetWorkingDir %A_ScriptDir%
Gui Add, Text, , Création des dossiers quotidiens de tri
Gui Add, Edit, vChoixAnnee, Indiquer l'année.
Gui Add, Text, , Choisir le mois que vous voulez créer (il `n est possible de créer `n toutes une année) :
Gui Add, DropDownList, vChoixMois, Janvier|Février|Mars|Avril|Mai|Juin|Juillet|Août|Septembre|Octobre|Novembre|Décembre|Créer l'année
Gui Add, Text, , Dans le cas d'une création d'une année `n complète, l'ensemble des mois `n sera dans un sous dossier `n de l'année.
Gui Add, Text, , Pour la création d'un seul mois, le `n programme recherchera un dossier `n de l'année avant de se `n placer dans son dossier `n d'exécution si il ne le trouve pas.

Gui Add, Button, gCreation , Créer les dossiers
Gui Show, w200 h400, Création sous-dossier quotidien
Return

GuiEscape:
GuiClose:
    ExitApp

; End of the GUI section


Creation:
Gui, Submit
myDate := 1
if(ChoixMois = "Janvier")
	myMonth := 01
else if (ChoixMois = "Février")
	myMonth := 02
else if (ChoixMois = "Mars")
	myMonth := 03
else if (ChoixMois = "Avril")
	myMonth := 04
else if (ChoixMois = "Mai")
	myMonth := 05
else if (ChoixMois = "Juin")
	myMonth := 06
else if (ChoixMois = "Juillet")
	myMonth := 07
else if (ChoixMois = "Août")
	myMonth := 08
else if (ChoixMois = "Septembre")
	myMonth := 09
else if (ChoixMois = "Octobre")
	myMonth := 10
else if (ChoixMois = "Novembre")
	myMonth := 11
else if (ChoixMois = "Décembre")
	myMonth := 12
else if (ChoixMois = "Créer l'année")
	myMonth := 01
indice = 1	
myYear := ChoixAnnee

if myYear is not integer
{	
	MsgBox, L'année n'est pas un nombre !
	ExitApp
}
else if myYear is integer 
{
	timeStamp = ""
	timeStamp := myYear . myMonth
	datea := LDOM(timeStamp)
	;MsgBox, %timeStamp%
	;MsgBox, %datea%
	if(ChoixMois != "Créer l'année"){
		Loop
			{
				if (myDate > datea)
					break
				IfExist, %myYear%	
					FileCreateDir, %myYear%\%myMonth%_%myDate%_%myYear%
				IfNotExist, %myYear%	
					FileCreateDir, %myMonth%_%myDate%_%myYear%
				myDate++
			}
		}
		
	else{
		while(indice<13){
			Loop
			{
				if (myDate > datea)
					break
				FileCreateDir %myYear%	
				FileCreateDir, %myYear%\%myMonth%_%myDate%_%myYear%
				myDate++
			}
			myDate := 1
			indice++
			if(indice = 2)
				myMonth := 02
			else if(indice = 3)
				myMonth := 03
			else if(indice = 4)
				myMonth := 04
			else if(indice = 5)
				myMonth := 05
			else if(indice = 6)
				myMonth := 06
			else if(indice = 7)
				myMonth := 07
			else if(indice = 8)
				myMonth := 08
			else if(indice = 9)
				myMonth := 09
			else if(indice = 10)
				myMonth := 10
			else if(indice = 11)
				myMonth := 11
			else if(indice = 12)
				myMonth := 12
		}
	}
	
	ExitApp
}

LDOM(TimeStr="") {
  If TimeStr=
     TimeStr = %A_Now%
  StringLeft Date,TimeStr,6 ; YearMonth
  Date1 = %Date%
  Date1+= 31,D              ; A day in next month
  StringLeft Date1,Date1,6  ; YearNextmonth
  Date1-= %Date%,D          ; Difference in days
  Return Date1
}
