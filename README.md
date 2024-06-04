# Computernumerik_2.3
Projekt II/3: Extrapolation bsp2

TODO: Näherungsformeln De(h), Dz(h), Dexcel(h) für verschiedene f(x)
  Implementieren Sie die Näherungsformeln De (h), Dz (h) und Dexcel (h) und verglei-
  chen Sie an selbstgewählten Beispielen ihre Qualität. Dazu kann man für eine Reihe
  von Schrittweiten h vergleichen, welche Genauigkeit mit den einzelnen Formeln zu
  erreichen ist. Versuchen Sie in diesem Vergleich auch den Aufwand (Anzahl der
  Funktionsauswertungen in De (h), Dz (h) und Dexcel (h)) einzubeziehen.
  
  Basierend auf der Formel Dexcel (h), entwickeln Sie ein Matlab-Programm zur Be-
  rechnung der ersten Ableitung einer skalaren Funktion f (t) and der Stelle t⋆ . Der
  Benützer übergibt als Eingangsdaten f, t⋆ und die Genauigkeitsforderung für den
  absoluten Fehler, T OL, das Programm liefert eine Näherung Dh (t⋆ ) für f ′(t⋆ ) und
  eine Fehlerschätzung für den absoluten (und den relativen) Fehler von Dh (t⋆ ), falls
  |Dh (t⋆ ) − f ′ (t⋆)| ≤ T OL
  gilt, oder eine Fehlermeldung, falls die Genauigkeitsforderung nicht erfüllt werden
  konnte. Überlegen Sie wie Sie den absoluten Fehler schätzen und die Schrittweite
  anpassen wollen. Testen Sie Ihr Programm an mehreren Funktionen verschiedener
  Schwierigkeit.
