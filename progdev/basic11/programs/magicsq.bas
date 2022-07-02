20 PRINT "GAME OF MAGIC SQUARE BY DAVID AHL"\PRINT 
25 PRINT "PLAYERS ALTERNATELY CHOOSE AN INTEGER (1 TO 9)"
30 PRINT "THAT HAS NOT BEEN PREVIOUSLY USED AND PLACE IT"
35 PRINT "IN ANY UNFILLED CELL OF A TIC-TAC-TOE BOARD."
40 PRINT "THE GOAL IS TO MAKE THE SUM OF EACH ROW, COLUMN,"
45 PRINT "AND DIAGONAL EQUAL TO 15."\PRINT 
50 PRINT "THAT PLAYER LOSES WHO FIRST MAKES THE SUM OF THE"
55 PRINT "THREE FIGURES IN ANY ROW, COLUMN, OR DIAGONAL"
60 PRINT "SOMETHING OTHER THAN 15."\PRINT 
62 PRINT "A TIE GAME DRAWS A MAGIC SQUARE!!"\PRINT 
65 PRINT "THE COMPUTER WILL ASK YOU ON EACH MOVE WHICH"
70 PRINT "CELL YOU WISH TO OCCUPY, AND THE NUMBER YOU WISH"
75 PRINT "TO PLACE IN THAT CELL.  YOUR INPUT SHOULD LOOK"
80 PRINT "LIKE '3,7' IF YOU WISHED TO PLACE A 7 IN CELL 3."
85 PRINT \PRINT "HERE ARE THE CELL NUMBERS:"\PRINT 
90 PRINT "1 2 3"\PRINT "4 5 6"\PRINT "7 8 9"
95 FOR I=1 TO 9\A(I)=0\B(I)=0\NEXT I\M=0\W=0
100 PRINT \ PRINT "YOUR MOVE -- CELL AND NUMBER"; \ INPUT I,N
105 IF I<1 THEN 130
106 IF I>9 THEN 130
107 IF N<1 THEN 130
108 IF N>9 THEN 130
110 IF A(I)=0 THEN IF B(N)=0 THEN 150
130 PRINT "ILLEGAL MOVE ... AGAIN,"\GOTO 100
150 A(I)=N\B(N)=1\M=M+1		\ REM AN ACCEPTABLE MOVE
170 GOSUB 960			\ REM PRINT BOARD
180 GOSUB 800			\ REM A LOSING MOVE??
200 IF W=0 THEN 230		\ REM GOOD MOVE, NO WINNER YET
210 PRINT "SORRY, YOU LOSE -- NICE TRY."\GOTO 560
230 IF M<5 THEN 400		\ REM A TIE GAME?
240 PRINT "A TIE GAME -- BUT WE'VE DRAWN A MAGIC SQUARE!"\GOTO 560
400 FOR Q=1 TO 9		\ REM COMPUTER LOOKS FOR A GOOD MOVE
410 IF A(Q)>0 THEN 480		\ REM CELL TAKEN??
420 FOR R=1 TO 9
430 IF B(R)>0 THEN 470		\ REM NUMBER TAKEN??
435 A(Q)=R			\ REM TRY MAKING THE MOVE
440 GOSUB 800			\ REM IS THIS MOVE A LOSER?
450 IF W=0 THEN 500		\ REM A GOOD MOVE**
460 Q1=Q\R1=R\W=0\A(Q)=0	\ REM RECORD BAD MOVE IN CASE NO GOOD ONE
470 NEXT R
480 NEXT Q
490 W=1\R=R1\Q=Q1\A(Q)=R	\ REM IF GET HERE, COMPUTER HAS LOST
500 B(R)=1			\ REM COMPUTER MAKES ITS MOVE
520 PRINT "I MOVE TO CELL";Q;"WITH A";R
530 GOSUB 960			\ REM PRINT BOARD
540 IF W=0 THEN 100		\ REM THE GAME GOES ON....
550 PRINT "I LOSE -- YOU WIN!!"
560 PRINT \PRINT CHR$(7);       \ REM RINGS TELETYPE BELL
570 PRINT "LET'S PLAY AGAIN..."\GOTO 95
800 FOR X=1 TO 8		\ REM SUBROUTINE TO CHECK FOR LOSING MOVE
810 ON X GOTO 820,830,840,850,860,870,880,890
820 J=1\K=2\L=3\GOTO 900
830 K=4\L=7\GOTO 900
840 K=5\L=9\GOTO 900
850 J=4\L=6\GOTO 900
860 J=2\L=8\GOTO 900
870 J=3\L=7\GOTO 900
880 K=6\L=9\GOTO 900
890 J=7\K=8
900 IF A(J)=0 THEN 930
901 IF A(K)=0 THEN 930
902 IF A(L)=0 THEN 930
920 IF A(J)+A(K)+A(L)<>15 THEN 940
930 NEXT X
935 GOTO 950
940 W=1				\ REM A LOSER**
950 RETURN 
960 PRINT \PRINT A(1);A(2);A(3)	\ REM SUBROUTINE TO PRINT BOARD
970 PRINT A(4);A(5);A(6)\PRINT A(7);A(8);A(9)\PRINT \RETURN 
999 END 
