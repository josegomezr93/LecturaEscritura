%% Autor: Jose Gomez
%Funcion para escribir datos en un fichero de texto. Función que retorna
%vacio... Datos de entrada (<A : Data>, <string[] arg_inf>)
function Escritor(A,varargin)
%Se genera una validación de los datos enteros de acuerdo a los bloques de los argumentos
global nElementos; %Variable creada para definir la cantidad de elementos del bloque de entrada
%mod(nargin - 1, nElementos) == 0; retorna var booleano del modulo de (nargin - 1/Elementos)
if (mod(nargin-1,nElementos) == 0)
    formatoEncab='';
    formatoNum='';
    nGrupos = (nargin-1)/nElementos; %Numero de grupos de acuerdo al bloque de elementos
    for i=1:nGrupos
        datosNum{i} = varargin{(i*nElementos)-(nElementos-1)}; %Matriz de Celda para guardar la data
        for j=1:nElementos-1;
            aux = (nElementos - 1) - j; %Var auxiliar que ayuda en la posición ó ubicación de los parametros char en los bloque de entrada
        charTexto{j,i}=varargin{(nElementos*i)-aux}; %Matriz de celda para guardar los elementos string del fichero
        end
        formatoEncab=strcat(formatoEncab,'%16s'); %Formato para escribir los encabezados
        formatoNum=strcat(formatoNum,'%16.4f'); %Formato para escribir la Data
    end
datosNum=cell2mat(datosNum); %Transformamos la matriz cell en double
charTexto = string(charTexto); %Transformamos la matriz cell en string
else
    error('Numero de elementos incorrectos'); %Mensaje del error
end

%Para imprimir los encabezados + MDatos
formatoEncab=strcat(formatoEncab,'\r\n');
formatoNum=strcat(formatoNum,'\r\n');

%Imprimir informacion en .txt
titulo=strcat(A,'.txt');
fileID = fopen(titulo,'w'); % w es para formato escrito
fprintf(fileID,formatoEncab, charTexto');
fprintf(fileID,formatoNum, datosNum');
fclose(fileID); % siempre hay que cerrar el fichero

%Imprimir en pantalla
fprintf(formatoEncab, charTexto');
fprintf(formatoNum, datosNum');

end