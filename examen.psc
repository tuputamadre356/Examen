
SubProceso menu(num1 Por referencia )
	
	//escribimos lo que queremos que se vea en el menu del programa.
	Escribir 'Introduce un numero para las siguientes opcciones:'
	escribir '1)Visualizacion_de_documento.'
	escribir '2)Búsqueda_de_documentos.'
	escribir '3)Edición_de_documento.'
	escribir '4)Crear_documento.'
	escribir '5)Borrar_documento.'
	escribir '6)Impresion_de_documento.'
	escribir '-Si desea salir presione ^S^-'
	leer num1
FinSubProceso

SubProceso iniciar(posdoc1 por referencia, doc1 por referencia)
	//en inicilalizar añadimos un array que lea las tablas doc y posdoc 
	//para saber su recorrido
	Para i<-1 Hasta 8 Con Paso 1 Hacer
		posdoc1(i) = i
	Fin Para
	//le asignamos a cada posicion sus caracteres.
	doc1(1) = 'Hola, ¿còmo estás?'
	doc1(2) = 'Examen UF2178'
	doc1(3) = 'Factura cliente Fujitsu'
	doc1(4) = 'El carnaval es una celebración que tiene lugar inmediatamente antes de la cuaresma cristiana y que tiene fecha variable Tradicionalmente comienza un jueves y acaba el martes siguiente.'
	doc1(5) = 'Por favor, no molestar'
	doc1(6) = 'Manual de JAVA'
	doc1(7) = '$'
	doc1(8) = '$'
	
FinSubProceso

SubProceso visualizacion(posdoc2 por referencia, doc2 por referencia, num2 Por Valor)
	//Le doy un valor a p que sera la posicion del documento.
	p <- valor 
	//Hago un recorrido para identificar el lugar y el contenido de las tablas.
	si num2 = '1' entonces
		
		escribir 'Visualizacion_de_documente.'
		Escribir 'Si desea ver solo el documento presione `d` pero si desea ver la posicion del documento pulse `p`'
		leer valor1
		
		mientras valor1 != 'd' y valor1 <> 'p' hacer 
			escribir ' La letra que has introducido no es correcta'
			escribir 'Visualizacion_de_documente.'
			Escribir 'Si desea ver solo el documento presione `d` pero si desea ver la posicion del documento pulse `p`'
			leer valor1
		FinMientras
		
		si valor1 = 'd' Entonces
			Para i<-1 Hasta 8 Con Paso 1 Hacer
				Escribir doc2(i)
			Fin Para
			
		FinSi
		
		si valor1 = 'p' Entonces
			Para i<-1 Hasta 8 Con Paso 1 Hacer
				Escribir posdoc2(i)
			Fin Para
		FinSi
		
		Escribir 'si desea buscar un documento, introduzca la letra `c`.' 
		leer v
		
		si v = 'c' Entonces
			Escribir  'introduzca la posicion del documento.'
			leer p
			Para i<-1 Hasta 8 Con Paso 1 Hacer
				si posdoc2(i) = p Entonces
					Escribir doc2(i) 
				FinSi
			Fin Para
		FinSi
		Escribir '************************************'
		Escribir '* Fin del proceso de Visuañizacion.*'
		Escribir '************************************'
		Escribir ''
	FinSi
	
FinSubProceso

SubProceso busqueda_de_documento(posdoc3 Por Referencia, doc3 Por Referencia,num3 por valor)
	//no funciona, se supone que tiene que buscar la palabra introducida en los datos de la tabla
	//y el que concida aparecer como encontrado.
	si num3 = '2' entonces
		Escribir 'Busqueda de documento.'
		Escribir 'si desea buscar todas las coincidencias pulse `A`'
		leer letra1
		
		Mientras letra1 <> 'A' y letra1 <> 'B' Hacer
			escribir 'las letras introducidas no son correctas, por favor vuelva a intentarlo'
			leer letra1
		FinMientras
		
		si letra1 = 'A'  Entonces
			Escribir 'Introduzca la palbra clave o referencia'
			leer letra
			Para i<-1 Hasta 8 Con Paso 1 Hacer
				palabra = doc3(i)
				Para j<-1 Hasta longitud(letra) Con Paso 1 Hacer
					cadena = subcadena(palabra,1,j)
					si cadena = letra
						escribir doc3(i)
					FinSi
				Fin Para
			Fin Para
		FinSi
		// esto no funciona bien, no consigo seleccionar la primera palabra encontrada.
		//si 	letra1 = 'B' Entonces
			
			//Escribir 'Introduzca la palbra clave o referencia'
			//leer letra
			//Para i<-1 Hasta 8 Con Paso 1 Hacer
				//palabra = doc3(i)
				//Para j<-1 Hasta longitud(letra) Con Paso 1 Hacer
					//cadena = subcadena(palabra,1,j)
					//si cadena = letra
						//escribir doc3 
					//FinSi
				//Fin Para
			//Fin Para
		//FinSi
		Escribir '*********************************'
		Escribir '*  Fin del proceso de Busqueda. *'
		Escribir '*********************************'
		Escribir ''
	FinSi
FinSubProceso
	
	


SubProceso edicion_del_documento(posdoc4 Por Referencia, doc4 Por Referencia,num4 por valor)
	//subproceso de edicion de la informacion en las tablas. 
	si num4 = '3' entonces
		escribir 'Edicion del documento:'
		escribir '¿Qué posición del documento desea editar?'
		leer n
		limpiar pantalla
		Mientras n < 1 o n > 8
			Escribir 'La posición del documento que ha introducido no se ha encontrado'
			escribir '¿Qué documento desea visualizar?'
			leer n
		FinMientras
		Para i<-1 Hasta 8 Con Paso 1 Hacer
			si posdoc4(i) = n
				si doc4(i) = '$'
					Escribir 'El documento que has introducido esta vacio.'
					Escribir 'Debes crear el documento para poder editarlo.'
					leer p
				SiNo
					Escribir '¿Qué desea añadir?'
					leer a
					doc4(i) = doc4(i) + ' ' + a
					escribir doc4(i) 
				FinSi
			FinSi
		Fin Para
		Escribir '*********************************'
		Escribir '*  Fin del proceso de Edicion . *'
		Escribir '*********************************'
		Escribir ''
	FinSi
	
FinSubProceso

SubProceso crear_documento(posdoc5,doc5 por referencia,num5 por valor)
	//proceso de creacion de documento.
	//recorremos la posicion de los documentos para saber cuales estan vacios.
	//dentro de los que estan vacios se les añade un documento que te pide el programa.
	h = 0
	si num5 = '4' entonces
		Escribir 'Crear documento'
		Para i<-1 Hasta 8 Con Paso 1 Hacer
			si doc5(i) = '$' y h = 0
				doc5(i) = ''
				Escribir 'El documento se va a crear en la posicion ',posdoc5(i),' ¿Qué desea poner en el documento?'
				leer a
				doc5(i) <- a
				h = 1
				escribir  a
			FinSi
		Fin Para
		si h = 0
			escribir 'No hay espacios libres'
			leer p
		FinSi
		Escribir '**********************************'
		Escribir '*Fin del Proceso crear documento.*'
		Escribir '**********************************'
		Escribir ''
	FinSi
	
FinSubProceso

SubProceso borrar_documento(doc6 por referencia, posdoc6, num6 por valor)
	//en este subproceso borramos cualquier documento dentro de las lista ya creadas.
	si num6 = '5' entonces
		escribir 'Borrar documento.'
		Escribir 'Introduzca la posición del documento que quiera borrar'
		leer n
		mientras n < 1 o n > 8
			escribir 'La posición introducida no se ha encontrado'
			Escribir 'Introduzca la posición del documento que quiera borrar'
			leer n
		FinMientras
		
		Para i<-1 Hasta 8 Con Paso 1 Hacer
			si n = posdoc6(i)
				doc6(i) = '$'
			FinSi
		Fin Para
		Escribir '**********************************'
		Escribir '*  Fin del Proceso de borrado .  *'
		Escribir '**********************************'
		Escribir ''
	FinSi
	
FinSubProceso

SubProceso Impresion_de_documento(num Por Valor)
	si num = '6' Entonces
		principio = 1
		final = 1
		maximo = 8
		Limpiar Pantalla
		Escribir 'Impresion_de_documento.'
		dimension cola[maximo]
		Mientras a != 's'
			menu_cola(a)
			si a = 'a'
				introducir(r,final,cola,principio)
			FinSi
			si a = 'b'
				eliminar(recuperar,r,final,cola,principio)
			FinSi
			si a = 'c'
				mostrar_elem(cola)
			FinSi
			si final = 8
				final = 1
			FinSi
			si principio = 8
				principio = 1
			FinSi
		FinMientras
	FinSi
	
	
FinSubProceso

//Este subproceso crea un menú para la cola
subproceso menu_cola(a Por Referencia)
	Limpiar Pantalla
	Escribir 'a)Introducir un valor'
	Escribir 'b)Eliminar un valor'
	Escribir 'c)Mostrar los elementos de la cola'
	Escribir 's)Salir'
	leer a
	Limpiar Pantalla
FinSubProceso

//Este subproceso permite introducir un valor en la cola
subproceso introducir(r Por Referencia,final por referencia,cola Por Referencia,principio)
	si principio != final
		si cola(final) = '$'
			escribir 'Introduce un valor'
			leer cola[final]
			escribir 'El valor se a introducido correctamente'
			final = final + 1
			r = 0
		FinSi
		
	SiNo
		escribir 'La cola está llena'
	FinSi
FinSubProceso

//Este subproceso permite eliminar un valor de la cola
SubProceso eliminar(recuperar por referencia,r Por Referencia,final,cola por referencia,principio Por Referencia)
	si final != principio + 1
		Escribir 'El valor ',cola[principio],' ha sido eliminado'
		recuperar = cola[principio]
		cola[principio] = '$'
		principio = principio + 1
		r = 1
	SiNo
		escribir 'La cola está vacía'
	FinSi
FinSubProceso


SubProceso mostrar_elem(cola)
	
	Para i<-1 Hasta 8 Con Paso 1 Hacer
		escribir cola(i)
	Fin Para
	
FinSubProceso

Algoritmo progama_de_examen
	//definicion de los arrays.
	dimension posdoc[8]
	dimension doc[8]
	
	iniciar(posdoc,doc)
	mientras num <> 'S' y num <> 's' hacer
		menu(num)
		visualizacion(posdoc,doc,num)
		busqueda_de_documento(posdoc,doc,num)
		edicion_del_documento(posdoc,doc,num)
		crear_documento(posdoc,doc,num)
		borrar_documento(doc,posdoc,num)
		Impresion_de_documento(num)
		si num = 's' o num = 'S' Entonces
			Escribir '*********************************'
			Escribir '*       Fin del Programa .      *'
			Escribir '*********************************'
			Escribir ''
		FinSi
		
	FinMientras
	
FinAlgoritmo
