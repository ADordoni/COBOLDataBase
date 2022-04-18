      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. CREATE-DATA-BASE.

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
       PROCEDURE DIVISION.
       APERTURA.
           OPEN OUTPUT ARTICULOS-ARCHIVO.
       CIERRE.
           CLOSE ARTICULOS-ARCHIVO.
       DISPLAY "Se ha creado el archivo correctamente."
            STOP RUN.
       END PROGRAM CREATE-DATA-BASE.
