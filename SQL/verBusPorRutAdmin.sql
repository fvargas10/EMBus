SELECT BUS.PATENTE, BUS.APODO_BUS, BUS.MARCA_BUS, BUS.CAPACIDAD_BUS, BUS.ESTADO_BUS, OFICINA.DIR_OFICINA
FROM ADMINISTRADOR INNER JOIN
OFICINA ON ADMINISTRADOR.RUT_ADMIN = OFICINA.RUT_ADMIN INNER JOIN
BUS ON OFICINA.ID_OFICINA = BUS.ID_OFICINA
WHERE OFICINA.RUT_ADMIN='18729884-9'
						 