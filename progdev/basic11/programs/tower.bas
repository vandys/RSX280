10 REM TOWERS 21-NOV-85 D.S.NUNN.
20 E$=CHR$(27) \ PRINT E$;"<";E$"(0";E$;")B";CHR$(15)
30 DIM A$(14),A(12),B(12),C(12)
40 PRINT E$;"[2J";E$;"[H"
50 PRINT E$;"[1;10H";E$;"#3TOWERS OF BABLE"
60 PRINT E$;"[2;10H";E$;"#4TOWERS OF BABLE"
70 GOSUB 1310
80 A$(1)="qqqqqqqqqqqqqqqqqqqqqqqq"
90 A$(2)=" qqqqqqqqqqqqqqqqqqqqqq "
100 A$(3)="  qqqqqqqqqqqqqqqqqqqq  "
110 A$(4)="   qqqqqqqqqqqqqqqqqq   "
120 A$(5)="    qqqqqqqqqqqqqqqq    "
130 A$(6)="     qqqqqqqqqqqqqq     "
140 A$(7)="      qqqqqqqqqqqq      "
150 A$(8)="       qqqqqqqqqq       "
160 A$(9)="        qqqqqqqq        "
170 A$(10)="         qqqqqq         "
180 A$(11)="          qqqq          "
190 A$(12)="           qq           "
200 A$(13)="                        "
210 PRINT E$;"[5;5H";E$;"[0JHOW MANY LAYERS (3-12)";
220 INPUT T
230 IF T>12 THEN 210
240 IF T<3 THEN 210
250 PRINT E$;"[2J"
260 FOR A=1 TO T
270 B$=STR$(20-A)
280 A(A)=A
290 PRINT E$;"[";B$;";1H";A$(A)
300 NEXT A
310 PRINT E$;"[21;5H";E$;"[0JMOVE";
320 INPUT X$
330 IF X$<"11" THEN 310
340 IF X$>"33" THEN 310
350 X=VAL(X$)
360 X1=INT(X/10)
370 X2=X-(X1*10)
380 IF X1>3 THEN 310
390 IF X1<1 THEN 310
400 IF X2>3 THEN 310
410 IF X2<1 THEN 310
420 ON X1 GOSUB 480,570,660
430 IF Z=1 THEN Z=0 \ GO TO 310
440 ON X2 GOSUB 750,850,950
450 M=M+1 \ PRINT E$;"[2;50HMOVES ";M
460 IF Z=2 THEN  GO TO 1090
470 GO TO 310
480 FOR A=T TO 1 STEP -1
490 IF A(A)>0 THEN 520
500 NEXT A
510 PRINT CHR$(7); \ Z=1 \ RETURN
520 C=A(A)
530 B$=STR$(20-A)
540 PRINT E$;"[";B$;";1H";A$(13);
550 A(A)=0
560 RETURN
570 FOR A=T TO 1 STEP -1
580 IF B(A)>0 THEN 610
590 NEXT A
600 PRINT CHR$(7); \ Z=1 \ RETURN
610 C=B(A)
620 B$=STR$(20-A)
630 PRINT E$;"[";B$;";27H";A$(13);
640 B(A)=0
650 RETURN
660 FOR A=T TO 1 STEP -1
670 IF C(A)>0 THEN 700
680 NEXT A
690 PRINT CHR$(7); \ Z=1 \ RETURN
700 C=C(A)
710 B$=STR$(20-A)
720 PRINT E$;"[";B$;";54H";A$(13);
730 C(A)=0
740 RETURN
750 FOR B=1 TO T
760 IF A(B)=0 THEN 780
770 NEXT B
780 IF C>A(B-1) THEN 810
790 ON X1 GOSUB 750,850,950
800 RETURN
810 A(B)=C
820 B$=STR$(20-B)
830 PRINT E$;"[";B$;";1H";A$(C)
840 RETURN
850 FOR B=1 TO T
860 IF B(B)=0 THEN 880
870 NEXT B
880 IF C>B(B-1) THEN 910
890 ON X1 GOSUB 750,850,950
900 RETURN
910 B(B)=C
920 B$=STR$(20-B)
930 PRINT E$;"[";B$;";27H";A$(C)
940 RETURN
950 FOR B=1 TO T
960 IF C(B)=0 THEN 980
970 NEXT B
980 IF C>C(B-1) THEN 1010
990 ON X1 GOSUB 750,850,950
1000 RETURN
1010 C(B)=C
1020 B$=STR$(20-B)
1030 PRINT E$;"[";B$;";54H";A$(C)
1040 FOR F=1 TO T
1050 IF C(F)<>F THEN RETURN
1060 NEXT F
1070 Z=2
1080 RETURN
1090 FOR A=1 TO 5 \ PRINT CHR$(7); \ NEXT A
1100 PRINT E$;"[2J"
1110 PRINT E$;"[2;10H";E$;"#3CONGRATULATIONS"
1120 PRINT E$;"[3;10H";E$;"#4CONGRATULATIONS"
1130 PRINT E$;"[5;1HYOU MANAGED TO COMPLEATE THE TOWERS IN ONLY ";M;"MOVES"
1140 PRINT "THE BEST POSIBLE IS";2^T-1;"THIS PUTS YOU IN THE";
1150 IF M-(2^T-1)=0 THEN PRINT " PERFECTIONEST CLASS" \ GO TO 1230
1160 IF M-(2^T-1)<5 THEN PRINT " EXPERT "; \ GO TO 1210
1170 IF M-(2^T-1)<20 THEN PRINT " AVERAGE "; \ GO TO 1210
1180 IF M-(2^T-1)<50 THEN PRINT " BEGINERS "; \ GO TO 1210
1190 IF M-(2^T-1)<100 THEN PRINT " DUMMIES "; \ GO TO 1210
1200 PRINT " NEAREST ASYLUM" \ GO TO 1220
1210 PRINT "CLASS"
1220 PRINT "YOU KNOW YOU COULD DO BETTER I RECOMEND THAT YOU TRY AGAIN"
1230 PRINT  \ PRINT  \ PRINT "WOULD YOU LIKE TO TRY AGAIN (Y\N) ";
1240 INPUT A$
1250 IF A$="N" THEN 1520
1260 FOR A=1 TO 12
1270 A(A)=0 \ B(A)=0 \ C(A)=0
1280 NEXT A
1290 Z=0 \ M=0
1300 GO TO 40
1310 PRINT E$;"[5;5H    WOULD YOU LIKE INSTRUCTIONS (Y/N) ";
1320 INPUT Q$
1330 IF Q$="N" THEN RETURN
1340 PRINT E$;"[5;5H    THE TOWERS OF BABLE ARE A SERIES OF DISKS DECREASING IN SIZE."
1350 PRINT "  THE IDEA IS TO MOVE ALL OF THE DISKS FROM THE LEFT HAND SIDE"
1360 PRINT " TO THE RIGHT HAND SIDE. THERE ARE ONLY THREE PILES, AND YOU CAN"
1370 PRINT " NEVER PUT A LARGER DISK ON A SMALLER ONE."
1380 PRINT "  I WILL KEEP TRACK OF HOW MANY MOVES IT TAKES YOU."
1390 PRINT 
1400 PRINT "    WHEN PROMPTED FOR THE 'MOVE' ENTER A TWO DIGIT NUMBER,"
1410 PRINT " THE FIRST NUMBER IS THE IS WHERE YOU WANT THE DISK TO COME FROM,"
1420 PRINT " AND THE SECOND IS WHERE IT WILL GO TO. I WILL NOT LET YOU PUT A"
1430 PRINT " LARGE DISK ON A SMALL ONE, I WILL JUST REPLACE IT WHERE IT CAME"
1440 PRINT " FROM. A MOVE OF '32' WILL PLACE THE TOP DISK FROM PILE THREE"
1450 PRINT " TO THE TOP DISK ON PILE TWO. WELL HAVE FUN AND DONT PULL ALL"
1460 PRINT " YOUR HAIR OUT."
1470 PRINT 
1480 PRINT " I RECOMEND THAT BEGINERS TRY THREE TO FIVE DISKS TO START"
1490 PRINT "    PUSH ENTER TO START";
1500 INPUT Q$
1510 RETURN
1520 PRINT CHR$(14);
1530 END
