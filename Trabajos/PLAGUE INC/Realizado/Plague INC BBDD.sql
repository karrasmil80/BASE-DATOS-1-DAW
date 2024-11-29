create table clima
(
    Temperatura         int         not null
        primary key,
    Humedad             int         null,
    Presion_Atmosferica int         null,
    Eventos_Climaticos  varchar(50) null,
    Tipo                varchar(25) null
);

create table enfermedades
(
    Enfermedad_ID varchar(25) not null
        primary key,
    Tipo          varchar(25) null,
    Letalidad     varchar(25) null,
    Infectividad  varchar(25) null
);

create table enfermedad_clima
(
    Enfermedad_clima varchar(50) not null
        primary key,
    Enfermedad_ID    varchar(25) null,
    Temperatura      int         null,
    constraint enfermedad_clima_ibfk_1
        foreign key (Enfermedad_ID) references enfermedades (Enfermedad_ID),
    constraint enfermedad_clima_ibfk_2
        foreign key (Temperatura) references clima (Temperatura)
);

create index Enfermedad_ID
    on enfermedad_clima (Enfermedad_ID);

create index Temperatura
    on enfermedad_clima (Temperatura);

create table farmacos
(
    Nombre_Farmaco    varchar(25) not null
        primary key,
    Eficacia          varchar(25) null,
    Costo_Farmaco     varchar(25) null,
    Resistencia_virus varchar(50) null
);

create table enfermedad_farmaco
(
    Enfermedad_farmaco varchar(50) not null
        primary key,
    Enfermedad_ID      varchar(25) null,
    Nombre_Farmaco     varchar(25) null,
    constraint enfermedad_farmaco_ibfk_1
        foreign key (Enfermedad_ID) references enfermedades (Enfermedad_ID),
    constraint enfermedad_farmaco_ibfk_2
        foreign key (Nombre_Farmaco) references farmacos (Nombre_Farmaco)
);

create index Enfermedad_ID
    on enfermedad_farmaco (Enfermedad_ID);

create index Nombre_Farmaco
    on enfermedad_farmaco (Nombre_Farmaco);

create table habilidades
(
    Habilidad_ID      varchar(25) not null
        primary key,
    Nombre_Habilidad  varchar(25) null,
    Efecto            varchar(25) null,
    Costo_Habilidades varchar(25) null
);

create table enfermedad_habilidad
(
    Enfermedad_Habilidad varchar(50) not null
        primary key,
    Enfermedad_ID        varchar(25) null,
    Habilidad_ID         varchar(25) null,
    constraint enfermedad_habilidad_ibfk_1
        foreign key (Enfermedad_ID) references enfermedades (Enfermedad_ID),
    constraint enfermedad_habilidad_ibfk_2
        foreign key (Habilidad_ID) references habilidades (Habilidad_ID)
);

create index Enfermedad_ID
    on enfermedad_habilidad (Enfermedad_ID);

create index Habilidad_ID
    on enfermedad_habilidad (Habilidad_ID);

create table muerte
(
    Muerte_ID        varchar(50) not null
        primary key,
    Fecha_muerte     date        null,
    Causa_muerte     varchar(50) null,
    Ubicacion_muerte varchar(50) null
);

create table personas
(
    Nombre_persona  varchar(25) not null
        primary key,
    Edad            int         null,
    Genero          varchar(15) null,
    Fecha_infeccion date        null
);

create table persona_muerte
(
    Persona_muerte varchar(50) not null
        primary key,
    Muerte_ID      varchar(50) null,
    Nombre_persona varchar(25) null,
    constraint persona_muerte_ibfk_1
        foreign key (Muerte_ID) references muerte (Muerte_ID),
    constraint persona_muerte_ibfk_2
        foreign key (Nombre_persona) references personas (Nombre_persona)
);

create index Muerte_ID
    on persona_muerte (Muerte_ID);

create index Nombre_persona
    on persona_muerte (Nombre_persona);

create table sintomas
(
    Sintomas_ID    varchar(25) not null
        primary key,
    Nombre_Sintoma varchar(25) null,
    Gravedad       varchar(25) null,
    Descripción    varchar(25) null
);

create table enfermedad_sintoma
(
    Enfermedad_sintoma varchar(25) not null
        primary key,
    Enfermedad_ID      varchar(25) null,
    Sintomas_ID        varchar(25) null,
    constraint enfermedad_sintoma_ibfk_1
        foreign key (Enfermedad_ID) references enfermedades (Enfermedad_ID),
    constraint enfermedad_sintoma_ibfk_2
        foreign key (Sintomas_ID) references sintomas (Sintomas_ID)
);

create index Enfermedad_ID
    on enfermedad_sintoma (Enfermedad_ID);

create index Sintomas_ID
    on enfermedad_sintoma (Sintomas_ID);

create table transmision
(
    Transmision_ID    varchar(25) not null
        primary key,
    Método            varchar(25) null,
    Efectividad       varchar(25) null,
    Costo_Transmision varchar(25) null,
    Tipo              varchar(25) null
);

create table enfermedad_transmision
(
    Enfermedad_transmision varchar(50) not null
        primary key,
    Enfermedad_ID          varchar(25) null,
    Transmision_ID         varchar(25) null,
    constraint enfermedad_transmision_ibfk_1
        foreign key (Enfermedad_ID) references enfermedades (Enfermedad_ID),
    constraint enfermedad_transmision_ibfk_2
        foreign key (Transmision_ID) references transmision (Transmision_ID)
);

create index Enfermedad_ID
    on enfermedad_transmision (Enfermedad_ID);

create index Transmision_ID
    on enfermedad_transmision (Transmision_ID);


