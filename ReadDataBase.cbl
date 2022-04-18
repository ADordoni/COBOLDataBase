      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. READ-DATA-BASE.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE CONTROL.
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
           05 ARTICULOS-PRODUCTO X(30).
           05 ARTICULOS-MARCA X(20).
           05 ARTICULOS-PRECIO 9999V99.


       WORKING-STORAGE SECTION.
       77 LEE-TODO PIC X.

       PROCEDURE DIVISION.

       PERFORM APERTURA.
       MOVE "0" TO LEE-TODO.
       PERFORM LEE-SIGUIENTE-REGISTRO.
           IF LEE-TODO = "1"
               DISPLAY "No se encontraron registros."
           ELSE
               PERFORM MUESTRA UNTIL LEE-TODO = "1".
       PERFORM CIERRE.
       STOP RUN.

       APERTURA.
           OPEN I-O ARTICULOS-ARCHIVO.

       CIERRE.
           CLOSE ARTICULOS-ARCHIVO.

       MUESTRA.
           DISPLAY "ID: " ARTICULOS-ID
           " Producto: " ARTICULOS-PRODUCTO
           " Marca: " ARTICULOS-MARCA
           " Precio: " ARTICULOS-PRECIO.
           PERFORM LEE-SIGUIENTE-REGISTRO.

       LEE-SIGUIENTE-REGISTRO.
           READ ARTICULOS-ARCHIVO NEXT RECORD
           AT END MOVE "1" TO LEE-TODO.

       END PROGRAM READ-DATA-BASE.
