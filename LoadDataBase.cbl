      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOAD-DATA-BASE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT ARTICULOS-ARCHIVO
       ASSIGN TO "articulos.dat"
       ORGANIZATION IS INDEXED
       RECORD KEY IS ARTICULOS-ID
       ACCESS MODE IS DYNAMIC.

       DATA DIVISION.
       FILE SECTION.
       FD ARTICULOS-ARCHIVO.
       01 ARTICULOS-REGISTRO.
           05 ARTICULOS-ID PIC 9(2).
           05 ARTICULOS-PRODUCTO PIC X(30).
           05 ARTICULOS-MARCA PIC X(20).
           05 ARTICULOS-PRECIO PIC 9999V99.

       WORKING-STORAGE SECTION.
       01 IDENTIFICADOR PIC X(30)
           VALUE "Ingrese el ID del articulo: ".
       01 PRODUCTO PIC X(22)
           VALUE "Ingrese el producto: ".
       01 MARCA PIC X(18)
           VALUE "Ingrese la marca: ".
       01 PRECIO PIC X(19)
           VALUE "Ingrese el precio: ".
       01 SI-NO PIC X.
       01 ENTRADA PIC X.

       PROCEDURE DIVISION.
       MAIN-LOGIC SECTION.

       PERFORM APERTURA.
       MOVE "S" TO SI-NO.
       PERFORM CREAR UNTIL SI-NO = "N".
       PERFORM CIERRE.
       STOP RUN.

       APERTURA.
           OPEN I-O ARTICULOS-ARCHIVO.

       CIERRE.
           CLOSE ARTICULOS-ARCHIVO.

       CREAR.
           MOVE "N" TO ENTRADA.
           PERFORM OBTENER UNTIL ENTRADA = "S".
           PERFORM ESCRIBIR.
           PERFORM REINICIAR.

       OBTENER.
           MOVE SPACE TO ARTICULOS-REGISTRO.
           DISPLAY IDENTIFICADOR.
           ACCEPT ARTICULOS-ID.
           DISPLAY PRODUCTO.
           ACCEPT ARTICULOS-PRODUCTO.
           DISPLAY MARCA.
           ACCEPT ARTICULOS-MARCA.
           DISPLAY PRECIO.
           ACCEPT ARTICULOS-PRECIO.
           PERFORM CONTINUAR.

       CONTINUAR.
           MOVE "S" TO ENTRADA.
           IF ARTICULOS-PRODUCTO = SPACE
           MOVE "N" TO ENTRADA.

       ESCRIBIR.
           WRITE ARTICULOS-REGISTRO.

       REINICIAR.
           DISPLAY "¿Desea almacenar otro articulo?".
           ACCEPT SI-NO.
           IF SI-NO = "s" move "S" TO SI-NO.
           IF SI-NO NOT = "S" MOVE "N" TO SI-NO.

       END PROGRAM LOAD-DATA-BASE.
