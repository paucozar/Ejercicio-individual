#include <stdio.h>
#include <mysql.h>
#include <string.h>
#include <stdlib.h>
#include <my_global.h>

//Devuelve la fecha en la que un jugador en específico jugó
int DameFecha (char username[30], char fecha[10]){
	MYSQL_RES *resultado; //Almacenar resultados de las consultas
	MYSQL_ROW row;
	int err;
	char consulta[80];
	strcpy (consulta, "SELECT Partida.fecha FROM Jugador,Partida,Relacion WHERE Jugador.username='");
	strcat (consulta,username);
	strcat (consulta," 'AND Partida.id = Relacion.partida AND Relacion.jugador = Jugador.id");
	
	err = mysql_query (conn, consulta);
	if (err != 0){
		return -1; //Retorna -1 si hay un error
	}
	else{
		resultado = mysql_store_result(conn);
		row = mysql_fetch_row(resultado);
		if(row == NULL){
			strcpy(fecha, "\0");
			return -2; //Retorna -2 si el usuario no existe
		}
		else{
			strcpy(fecha, row[0]);
			return 0; //Retorna 0 y la fecha si va bien
		}
	}
}
