create database BDMonitores
go 

use BDMonitores
go

-- Crear tabla Estudiantes
CREATE TABLE Estudiantes (
    ID_estudiante int PRIMARY KEY,
    IDUCA nvarchar(9) not null unique,
    Nombre nvarchar(50),
    Apellido nvarchar(50),
    FechaNac datetime,
    Correo_electronico nvarchar(100),
    Telefono nvarchar(20),
    Carrera nvarchar(50),
    Activo bit default 'true'
);

-- Crear tabla Clases
CREATE TABLE Clases (
    ID_clase int PRIMARY KEY,
    Codigo_clase nvarchar(20) unique not null,
    Nombre_clase nvarchar(50) not null,
    Horario nvarchar(50)
);

-- Crear tabla Monitores
CREATE TABLE Monitores (
    ID_monitor int PRIMARY KEY,
    ID_estudiante int,
    ID_clase int,
    Anio_en_curso int,
    Semestre_en_curso nvarchar(20),
    FOREIGN KEY (ID_estudiante) REFERENCES Estudiantes(ID_estudiante),
    FOREIGN KEY (ID_clase) REFERENCES Clases(ID_clase)
);
