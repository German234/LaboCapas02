INSERT INTO public.marca (nombre, pais) VALUES
  ('Toyota','Japan'),
  ('Ford','USA');

INSERT INTO public.local (nombre,direccion) VALUES
  ('Sucursal Centro','Av. Principal 123'),
  ('Sucursal Norte','Calle Secundaria 456');

INSERT INTO public.empleado (nombre,email) VALUES
  ('Luis Gomez','luis.gomez@example.com'),
  ('Maria Perez','maria.perez@example.com');

INSERT INTO public.automovil (modelo,id_marca,anio_fabricacion) VALUES
  ('Corolla 2020',(SELECT id FROM public.marca WHERE nombre='Toyota'),2020),
  ('Focus 2018',(SELECT id FROM public.marca WHERE nombre='Ford'),2018);

INSERT INTO public.inventario (id_local,id_automovil,cantidad,costo_unitario,precio_unitario_estandar) VALUES
  ((SELECT id FROM public.local WHERE nombre='Sucursal Centro'),
   (SELECT id FROM public.automovil WHERE modelo='Corolla 2020'),
   5,15000.00,20000.00),
  ((SELECT id FROM public.local WHERE nombre='Sucursal Centro'),
   (SELECT id FROM public.automovil WHERE modelo='Focus 2018'),
   2,12000.00,18000.00),
  ((SELECT id FROM public.local WHERE nombre='Sucursal Norte'),
   (SELECT id FROM public.automovil WHERE modelo='Focus 2018'),
   3,12000.00,18000.00);

INSERT INTO public.venta (id_local,id_empleado) VALUES
  ((SELECT id FROM public.local WHERE nombre='Sucursal Centro'),
   (SELECT id FROM public.empleado WHERE nombre='Luis Gomez')),
  ((SELECT id FROM public.local WHERE nombre='Sucursal Norte'),
   (SELECT id FROM public.empleado WHERE nombre='Maria Perez')),
  ((SELECT id FROM public.local WHERE nombre='Sucursal Centro'),
   (SELECT id FROM public.empleado WHERE nombre='Maria Perez'));

INSERT INTO public.venta_detalle (id_venta,id_automovil,cantidad,precio_unitario) VALUES
  ((SELECT id FROM public.venta
      WHERE id_local=(SELECT id FROM public.local WHERE nombre='Sucursal Centro')
        AND id_empleado=(SELECT id FROM public.empleado WHERE nombre='Luis Gomez')
      LIMIT 1),
   (SELECT id FROM public.automovil WHERE modelo='Corolla 2020'),
   2,20000.00),
  ((SELECT id FROM public.venta
      WHERE id_local=(SELECT id FROM public.local WHERE nombre='Sucursal Norte')
        AND id_empleado=(SELECT id FROM public.empleado WHERE nombre='Maria Perez')
      LIMIT 1),
   (SELECT id FROM public.automovil WHERE modelo='Focus 2018'),
   1,18000.00),
  ((SELECT id FROM public.venta
      WHERE id_local=(SELECT id FROM public.local WHERE nombre='Sucursal Centro')
        AND id_empleado=(SELECT id FROM public.empleado WHERE nombre='Maria Perez')
      LIMIT 1),
   (SELECT id FROM public.automovil WHERE modelo='Focus 2018'),
   2,17500.00);

