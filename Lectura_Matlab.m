%% Autor: Jose Gomez
%Funcion para leer datos de un fichero de texto
%[Datos , Encabezados] = Datos de Entrada : (<filename : NombrFichero>, <ncolumn: #colum a leer>, <nencab : #filasEncabezado en el fichero, delimitador : TipoDelimitador>)
function[MDatos,Encab]=Lectura_Matlab(filename,ncolum,nencab,delimitador)
archivo=fopen(filename); %Funcion para abrir el fichero "filename"
formatoNum=''; formatoString = '';
for j=1:ncolum
    formatoNum = strcat(formatoNum,'%f64'); %Formato numerico
	formatoString = strcat(formatoString,'%s'); %Formato string (Cadenas de texto)
end
if nencab>0;
    Encab = cell(nencab,ncolum); %Reservo memoria para la matriz de celdas que contendra los encabezados
    celda_encab = textscan(archivo,formatoString);
    %Bucle para obtener guardar los encabezados en una matriz de celdas y
    %utilizarla como variables a la hora de plotear los resultados
    for i = 1:ncolum
        for j = 1:nencab
            Encab{j,i} = celda_encab{i}{j};
        end	
    end
    archivo = fopen(filename); %Reabrimos el fichero para que el siguiente bucle lea las lineas y detecte las lineas de datos
	for i=1:nencab
        headers{i}=fgetl(archivo); %Me desplazo dentro de las lineas de texto y obtengo el valor de esta linea
    end
else
    Encab=[]; %Matriz de celda para los encabezados vacio
end
M=textscan(archivo,formatoNum,'Delimiter',delimitador);
MDatos = cell2mat(M); %Matriz de data con el formato numerico especificado
end