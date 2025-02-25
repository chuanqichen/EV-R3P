function SetSensorHtGyro( ~ )
%SETSENSORHTGYRO inicializa el sensor giroscopico en la entrada indicada
%   SETSENSORHTGYRO(input) informa a "input" que el sensor giroscopico esta
%   conectado a ese puerto. Las constantes que se pueden usar en "input" son
%   las siguientes: 
%   
%   * IN_1: puerto 1 de sensores
%   * IN_2: puerto 2 de sensores
%   * IN_3: puerto 3 de sensores
%   * IN_4: puerto 4 de sensores
%
%   See also SENSORHTGYRO, RESETANGLES, SENSORANGLES

    input = inputname(1) ; % se secoge el nombre del parametro de la funcion
    pattern = '^IN_[1-4]$'; % creamos un patr�n de expresi�n regular
    if(isempty(regexp(input, pattern, 'match'))) % se comprueba si el nombre
        error('entrada erronea')                 % de la entrada de la funci�n
                                                 % y el patr�n coinciden
    end
    for i=1:4 % comprobamos si otra constante de entrada tiene el mismo
              % valor.
        in = evalin('caller',['IN_', num2str(i)]);
        % Si es as�, le asignamos -1 al la constante que tenga el mismo
        % valor (en este caso 0), para marcarla como desconectada.
        if(in == 3)
            assignin('caller', ['IN_', num2str(i)], -1);
        end
    end
    assignin('caller', input, 3); % asignamos a la constante el sensor
                                  % conectado
end

