/*CONSULTAS*/

use jardineria;

-- 1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
SELECT O.codigo_oficina as codeOficina, O.ciudad as Ciudad
FROM jardineria.oficina as O;

-- 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
SELECT O.ciudad as Ciudad, O.telefono as Telefono
from jardineria.oficina as O
WHERE O.pais = 'España';

-- 3. Devuelve un listado con el nombre, 
-- apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
SELECT E.nombre as Nombre, concat(E.apellido1, ' ', E.apellido2) as Apellidos, E.email as Correo
from jardineria.empleado as E
where codigo_jefe = '7';

-- 4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
select E.puesto as Cargo, E.nombre as Nombre,  concat(E.apellido1, ' ', E.apellido2) as Apellidos, E.email as Correo
FROM empleado as E
where E.puesto = 'Director General';

-- 5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados 
-- que no sean representantes de ventas.
select E.nombre as Nombre,  concat(E.apellido1, ' ', E.apellido2) as Apellidos, E.puesto as Cargo
FROM empleado as E
WHERE E.puesto != 'Representante Ventas';

-- 6. Devuelve un listado con el nombre de los todos los clientes españoles.
select C.nombre_cliente as Nombre
FROM jardineria.cliente as C
where C.pais = 'Spain';

-- 7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.
select  estado
from pedido
GROUP BY estado;

-- 8. Devuelve un listado con el código de cliente de aquellos clientes que 
--    realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos 
--    de cliente que aparezcan repetidos. Resuelva la consulta:
--        -  Utilizando la función YEAR de MySQL.
--        -  Utilizando la función DATE_FORMAT de MySQL.
--        -  Sin utilizar ninguna de las funciones anteriores.
    -- usando YEAR
        SELECT DISTINCT P.codigo_cliente
        FROM jardineria.pago as P
        WHERE YEAR(P.fecha_pago) = '2008';
    -- Usando DATE_FORMAT
        SELECT DISTINCT P.codigo_cliente
        FROM jardineria.pago as P
        WHERE DATE_FORMAT(P.fecha_pago, '%Y') = '2008';
    -- Forma alternativa
        SELECT DISTINCT P.codigo_cliente
        FROM jardineria.pago as P
        WHERE SUBSTRING_INDEX(P.fecha_pago, '-', 1) = '2008';

-- 9. Devuelve un listado con el código de pedido, código de cliente, fecha 
--    esperada y fecha de entrega de los pedidos que no han sido entregados 
--    a tiempo.
SELECT P.codigo_pedido as codePedido, P.codigo_cliente as codeCliente, P.fecha_esperada as fechaEsperada, P.fecha_entrega as fechaEntrega
FROM jardineria.pedido as P
WHERE P.fecha_entrega > P.fecha_esperada;

-- 10. Devuelve un listado con el código de pedido, código de cliente,
-- fecha esperada y fecha de entrega de los pedidos cuya
-- fecha de entrega ha sido al menos dos días antes de la fecha esperada.
-- -  Utilizando la función ADDDATE de MySQL.
-- -  Utilizando la función DATEDIFF de MySQL.
-- -  ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?

    -- Utilizando la función ADDDATE de MySQL.
    SELECT P.codigo_pedido as codePedido, P.codigo_cliente as codeCliente, P.fecha_esperada as fechaEsperada, P.fecha_entrega as fechaEntrega
    FROM jardineria.pedido as P
    WHERE ADDDATE(P.fecha_entrega, INTERVAL 2 DAY) <= P.fecha_esperada;
    -- Utilizando la función DATEDIFF de MySQL.
    SELECT P.codigo_pedido as codePedido, P.codigo_cliente as codeCliente, P.fecha_esperada as fechaEsperada, P.fecha_entrega as fechaEntrega
    FROM jardineria.pedido as P
    WHERE DATEDIFF(P.fecha_entrega, P.fecha_esperada) < '2';

select DATEDIFF('2008-03-29', '2008-03-30');

sele
SELECT DISTINCT g.gama
from cliente as c
join pedido as p on c.codigo_cliente = p.codigo_cliente join detalle_pedido as d
on p.codigo_pedido = d.codigo_pedido join producto as pp
on pp.codigo_producto = d.codigo_producto join gama_producto as g on g.gama = pp.gama;