use grupal5;

create table usuarios(
id_usuario int auto_increment primary key,
nombre varchar(100) not null,
apellidos varchar(100) not null,
contraseña varchar(100) not null,
zona_horaria  TIMESTAMP NOT NULL DEFAULT (utc_timestamp()- interval 3 hour),
genero varchar(2) not null,
telefono int not null
);

create table ingreso_usuarios(
id_ingreso int primary key auto_increment,
id_usuario int not null,
fecha_hora_ingreso datetime default current_timestamp,
foreign key (id_usuario) references usuarios(id_usuario)
);

alter table usuarios modify column zona_horaria TIMESTAMP NOT NULL DEFAULT (utc_timestamp()- interval 2 hour);

INSERT INTO usuarios (Nombre, Apellido , Contraseña , Genero, Telefono)
VALUES 
("Julieta", "Gómez", "clave123", "F", 56987654321),
("Luis", "Martínez", "abc456", "M", 56955555555),
("Carla", "Pérez", "miClaveSecreta", "F", 56922222222),
("Juan", "González", "contra123", "M", 56944444444),
("Mónica", "Sánchez", "p4ssw0rd", "F", 56911111111),
("Federico", "Ruiz", "qwerty", "M", 56933333333),
("María", "López", "miclave123", "F", 56977777777),
("Pedro", "Hernández", "12345678", "M", 56988888888);

-- Faltan los registros  de ingreso_usuarios

-- Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?

-- INT: se ha elegido este tipo de dato para identificar a cada usuario de la aplicación. 
-- Es un tipo de dato óptimo porque los identificadores suelen ser valores enteros, y los valores enteros son fáciles de manejar y comparar.

-- VARCHAR (cadena de caracteres): El tipo de dato varchar es óptimo en estos casos porque la cantidad de 
-- caracteres para estos campos puede variar según el usuario y no se necesita almacenar grandes cantidades de datos.

-- DATETIME: El tipo de dato datetime es optimo en este caso porque permite almacenar valores de fecha y hora juntos, y es fácil de comparar y ordenar.

-- los tipos de datos elegidos son optimos para los campos correspondientes porque permiten almacenar la información necesaria y no requieren 
-- un exceso de espacio en la base de datos (Estos datos pueden variar segun las necesidades de la aplicacion).

create table Contactos (
id_contacto int primary key auto_increment,
id_usuario int not null,
telefono varchar(100) not null,
correo varchar(100) not null,
foreign key (id_usuario) references usuarios(id_usuario)
);
-- Buscar la relacion entre usuarios y telefono
alter table Contactos add constraint telefono foreign key (telefono) references usuarios (telefono);







