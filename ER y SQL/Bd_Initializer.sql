-- Sirve para habilitar pgcrypto para gen_random_uuid()
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE public.marca (
                              id   UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                              nombre VARCHAR(255) NOT NULL,
                              pais   VARCHAR(100)
);

CREATE TABLE public.local (
                              id        UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                              nombre    VARCHAR(255) NOT NULL,
                              direccion VARCHAR(255)
);

CREATE TABLE public.empleado (
                                 id     UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                                 nombre VARCHAR(255) NOT NULL,
                                 email  VARCHAR(255) UNIQUE
);

CREATE TABLE public.automovil (
                                  id               UUID    PRIMARY KEY DEFAULT gen_random_uuid(),
                                  modelo           VARCHAR(100) NOT NULL,
                                  id_marca         UUID        NOT NULL,
                                  anio_fabricacion INTEGER,
                                  CONSTRAINT fk_automovil_marca
                                      FOREIGN KEY (id_marca)
                                          REFERENCES public.marca(id)
                                          ON UPDATE CASCADE
                                          ON DELETE RESTRICT
);

CREATE TABLE public.inventario (
                                   id                         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                                   id_local                   UUID      NOT NULL,
                                   id_automovil               UUID      NOT NULL,
                                   cantidad                   INTEGER   NOT NULL,
                                   costo_unitario             NUMERIC(12,2),
                                   precio_unitario_estandar   NUMERIC(12,2),
                                   CONSTRAINT uq_inventario_local_automovil
                                       UNIQUE (id_local, id_automovil),
                                   CONSTRAINT fk_inventario_local
                                       FOREIGN KEY (id_local)
                                           REFERENCES public.local(id)
                                           ON UPDATE CASCADE
                                           ON DELETE CASCADE,
                                   CONSTRAINT fk_inventario_automovil
                                       FOREIGN KEY (id_automovil)
                                           REFERENCES public.automovil(id)
                                           ON UPDATE CASCADE
                                           ON DELETE RESTRICT
);

CREATE TABLE public.venta (
                              id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                              id_local    UUID NOT NULL,
                              id_empleado UUID NOT NULL,
                              fecha       TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
                              CONSTRAINT fk_venta_local
                                  FOREIGN KEY (id_local)
                                      REFERENCES public.local(id)
                                      ON UPDATE CASCADE
                                      ON DELETE RESTRICT,
                              CONSTRAINT fk_venta_empleado
                                  FOREIGN KEY (id_empleado)
                                      REFERENCES public.empleado(id)
                                      ON UPDATE CASCADE
                                      ON DELETE RESTRICT
);

CREATE TABLE public.venta_detalle (
                                      id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                                      id_venta      UUID NOT NULL,
                                      id_automovil  UUID NOT NULL,
                                      cantidad      INTEGER NOT NULL,
                                      precio_unitario NUMERIC(12,2) NOT NULL,
                                      CONSTRAINT uq_venta_detalle_venta_automovil
                                          UNIQUE (id_venta, id_automovil),
                                      CONSTRAINT fk_venta_detalle_venta
                                          FOREIGN KEY (id_venta)
                                              REFERENCES public.venta(id)
                                              ON UPDATE CASCADE
                                              ON DELETE CASCADE,
                                      CONSTRAINT fk_venta_detalle_automovil
                                          FOREIGN KEY (id_automovil)
                                              REFERENCES public.automovil(id)
                                              ON UPDATE CASCADE
                                              ON DELETE RESTRICT
);