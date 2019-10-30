CREATE TABLE actividades (
  idactividades INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  profesor _idprofesor  INTEGER UNSIGNED NOT NULL,
  nombreActividad VARCHAR(50) NULL,
  bimestre VARCHAR(50) NULL,
  PRIMARY KEY(idactividades),
  INDEX actividades_FKIndex1(profesor _idprofesor )
);

CREATE TABLE alumnos (
  idalumnos INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NULL,
  apellido VARCHAR(50) NULL,
  PRIMARY KEY(idalumnos)
)
TYPE=InnoDB;

CREATE TABLE asignatura (
  idasignatura INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nombreAsignatura VARCHAR(50) NULL,
  PRIMARY KEY(idasignatura)
)
TYPE=InnoDB;

CREATE TABLE asistencia (
  idasistencia INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  grupo_idgrupo INTEGER UNSIGNED NOT NULL,
  curso_idcurso INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idasistencia),
  INDEX asistencia_FKIndex1(curso_idcurso),
  INDEX asistencia_FKIndex2(grupo_idgrupo)
)
TYPE=InnoDB;

CREATE TABLE calificaciones (
  idcalificaciones INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  actividades_idactividades INTEGER UNSIGNED NOT NULL,
  curso_idcurso INTEGER UNSIGNED NOT NULL,
  calificacion DOUBLE(50) NULL,
  PRIMARY KEY(idcalificaciones),
  INDEX calificaciones_FKIndex1(curso_idcurso),
  INDEX calificaciones_FKIndex2(actividades_idactividades)
);

CREATE TABLE curso (
  idcurso INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  profesor _idprofesor  INTEGER UNSIGNED NOT NULL,
  alumnos_idalumnos INT NOT NULL,
  asignatura_idasignatura INTEGER UNSIGNED NOT NULL,
  grupo_idgrupo INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idcurso),
  INDEX curso_FKIndex1(grupo_idgrupo),
  INDEX curso_FKIndex2(asignatura_idasignatura),
  INDEX curso_FKIndex3(alumnos_idalumnos),
  INDEX curso_FKIndex4(profesor _idprofesor )
)
TYPE=InnoDB;

CREATE TABLE grupo (
  idgrupo INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nombreGrupo VARCHAR(50) NULL,
  grado VARCHAR(50) NULL,
  turno VARCHAR(50) NULL,
  PRIMARY KEY(idgrupo)
)
TYPE=InnoDB;

CREATE TABLE profesor  (
  idprofesor  INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NULL,
  apellido VARCHAR(50) NULL,
  PRIMARY KEY(idprofesor )
)
TYPE=InnoDB;


