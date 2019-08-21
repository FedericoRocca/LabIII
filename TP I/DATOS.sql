USE Club
GO

INSERT INTO Socios VALUES ('1000',		 'Angelelli',	 'Javier',		 '29',		 '1/1/1990',		 'M');
INSERT INTO Socios VALUES ('2000',		 'Baires',		 'Belén',		 '21',		 '2/2/1998',		 'F');
INSERT INTO Socios VALUES ('3000',		 'Corrionero',	 'Juan',		 '15',		 '3/3/2004',		 'M');
INSERT INTO Socios VALUES ('5000',		 'Garcia',		 'Oriana',		 '33',		 '4/4/1986',		 'F');
INSERT INTO Socios VALUES ('6000',		 'Kusters',		 'Kevin',		 '19',		 '5/5/2000',		 'M');
INSERT INTO Socios VALUES ('7000',		 'Lacioppa',	 'Ignacio',		 '19',		 '6/6/2000',		 'M');
INSERT INTO Socios VALUES ('8000',		 'Rocca',		 'Federico',	 '59',		 '7/7/1960',		 'M');
INSERT INTO Socios VALUES ('9000',		 'Albornoz',	 'Magalí',		 '28',		 '8/8/1990',		 'F');
GO 

INSERT INTO Localidades VALUES ('San Fernando',	 'Buenos Aires',		 '1111')
INSERT INTO Localidades VALUES ('Lanús',		 'Capital Federal',		 '2222')
INSERT INTO Localidades VALUES ('Tigre',		 'Buenos Aires',		 '3333')
INSERT INTO Localidades VALUES ('Pilar',		 'Buenos Aires',		 '2222')
GO

INSERT INTO Sedes VALUES ('Norte',		 		'1',		 'Presidente Simón 4400',		'14141414',		'norte@lab3.com.ar')
INSERT INTO Sedes VALUES ('Sur',		 		'2',		 'Dr Kloster 1080',		 		'15151515',		'sur@lab3.com.ar')
INSERT INTO Sedes VALUES ('Microestadio',		'3',		 'Virrey Calabuig 1350',		 NULL,			'micro@lab3.com.ar')
INSERT INTO Sedes VALUES ('Microestadio II',	'4',		 'Almirante De Amos 3200',		'13131313',		 NULL)
INSERT INTO Sedes VALUES ('Norte II',			'1',		 'Av. CodeBlocks 1712',			'90909090',		 NULL)
GO

INSERT INTO Actividades VALUES ('Ajedrez',		 	'250',		'0',	'1')
INSERT INTO Actividades VALUES ('Voley',			'450',		'1',	'3')
INSERT INTO Actividades VALUES ('Handball',		 	'450',		'1',	'3')
INSERT INTO Actividades VALUES ('Fútbol',		 	'500',		'1',	'4')
INSERT INTO Actividades VALUES ('Natación',			'1850',		'1',	'4')
INSERT INTO Actividades VALUES ('Yoga',				'500',		'1',	'2')
INSERT INTO Actividades VALUES ('Taller literario',	'100',		'0',	'1')
INSERT INTO Actividades VALUES ('Fortnite',		 	'1850',		'0',	'1')
INSERT INTO Actividades VALUES ('Programación',		'1400',		'0',	'1')
INSERT INTO Actividades VALUES ('Doom',		 		'500',		'0',	'2')
GO

INSERT INTO ActividadesPorSocio VALUES ('1000',		 '1',		 '0')
INSERT INTO ActividadesPorSocio VALUES ('1000',		 '3',		 '0')
INSERT INTO ActividadesPorSocio VALUES ('1000',		 '2',		 '0')
INSERT INTO ActividadesPorSocio VALUES ('2000',		 '1',		 '0')
INSERT INTO ActividadesPorSocio VALUES ('3000',		 '3',		 '0')
INSERT INTO ActividadesPorSocio VALUES ('3000',		 '2',		 '1')
INSERT INTO ActividadesPorSocio VALUES ('5000',		 '4',		 '1')
INSERT INTO ActividadesPorSocio VALUES ('6000',		 '1',		 '0')
INSERT INTO ActividadesPorSocio VALUES ('6000',		 '3',		 '1')
INSERT INTO ActividadesPorSocio VALUES ('6000',		 '2',		 '0')
INSERT INTO ActividadesPorSocio VALUES ('7000',		 '4',		 '0')
INSERT INTO ActividadesPorSocio VALUES ('8000',		 '10',		 '1')
GO