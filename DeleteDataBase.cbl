      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. DELETE-DATA-BASE.

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
       77 SI-A-ELIMINAR PIC X.
       77 REGISTRO-ENCONTRADO PIC X.
       77 CAMPO-ARTICULOS-ID PIC Z(5).

       PROCEDURE DIVISION.

       OPEN I-O ARTICULOS-ARCHIVO.
       PERFORM OBTENER-REGISTRO.
       PERFORM ELIMINA-REGISTRO
       UNTIL ARTICULOS-ID = ZEROES.
       CLOSE ARTICULOS-ARCHIVO.
       STOP RUN.

       OBTENER-REGISTRO.
           PERFORM INICIO-REGISTRO.
           PERFORM INGRESO-ID.
           MOVE "N" TO REGISTRO-ENCONTRADO.
           PERFORM ENCUENTRA-REGISTRO
           UNTIL REGISTRO-ENCONTRADO = "S" OR
           ARTICULOS-ID = ZEROES.
       INICIO-REGISTRO.
           MOVE SPACE TO ARTICULOS-REGISTRO.
           MOVE ZEROES TO ARTICULOS-ID.
       INGRESO-ID.
           DISPLAY " ".
           DISPLAY "Ingrese ID (del 1 al 99)".
           DISPLAY "Ingrese cualquier otra tecla para salir".
           ACCEPT CAMPO-ARTICULOS-ID.
           MOVE CAMPO-ARTICULOS-ID TO ARTICULOS-ID.
       ENCUENTRA-REGISTRO.
           PERFORM LEE-REGISTRO.
           IF REGISTRO-ENCONTRADO = "N"
               DISPLAY "No se encontró el registro".
           PERFORM INGRESO-ID.
       LEE-REGISTRO.
           MOVE "S" TO REGISTRO-ENCONTRADO.
           READ ARTICULOS-ARCHIVO RECORD INVALID KEY
           MOVE "N" TO REGISTRO-ENCONTRADO.
       ELIMINA-REGISTRO.
           PERFORM MOSTRAR-TODO.
           MOVE "Z" TO SI-A-ELIMINAR.
           PERFORM PREGUNTA-ELIMINAR
           UNTIL SI-A-ELIMINAR = "S" OR "N".
           IF SI-A-ELIMINAR = "S"
               PERFORM ELIMINAR.
           PERFORM OBTENER-REGISTRO.
       MOSTRAR-TODO.
           DISPLAY " ".
           DISPLAY "ID: " ARTICULOS-ID.
           DISPLAY " Producto: " ARTICULOS-PRODUCTO.
           DISPLAY " Marca: " ARTICULOS-MARCA.
           DISPLAY " Precio: " ARTICULOS-PRECIO.
       PREGUNTA-ELIMINAR.
           DISPLAY "¿Seguro que quieres eliminar este registro?(S/N)".
           ACCEPT SI-A-ELIMINAR.
           IF SI-A-ELIMINAR = "s"
               MOVE "S" TO SI-A-ELIMINAR.
           IF SI-A-ELIMINAR NOT = "S"
               MOVE "N" TO SI-A-ELIMINAR.
       ELIMINAR.
           DELETE ARTICULOS-ARCHIVO RECORD
           INVALID KEY
           DISPLAY "Error al eliminar el registro".
