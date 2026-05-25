CREATE TABLE catalogos (
  id SERIAL PRIMARY KEY,
  categoria TEXT NOT NULL,
  nombre TEXT NOT NULL,
  UNIQUE (categoria, nombre)
);

CREATE TABLE dpa (
  codigo_parroquia TEXT PRIMARY KEY,
  provincia TEXT NOT NULL,
  canton TEXT NOT NULL,
  parroquia TEXT NOT NULL
);

CREATE TABLE alcantarillas (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  codigo TEXT NOT NULL UNIQUE,
  codigo_parroquia TEXT REFERENCES dpa(codigo_parroquia),
  tramo_vial TEXT,
  este DOUBLE PRECISION NOT NULL,
  norte DOUBLE PRECISION NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE inspecciones (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  alcantarilla_id UUID NOT NULL
    REFERENCES alcantarillas(id)
    ON DELETE CASCADE,
  numero_ficha INT UNIQUE NOT NULL,
  fecha DATE NOT NULL,
  observaciones TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TYPE estado_fisico AS ENUM (
  'bueno',
  'regular',
  'malo'
);

CREATE TABLE tuberias (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  inspeccion_id UUID NOT NULL
    REFERENCES inspecciones(id)
    ON DELETE CASCADE,
  material_id INT REFERENCES catalogos(id),
  longitud_m REAL CHECK (longitud_m >= 0),
  diametro_m REAL CHECK (diametro_m > 0),
  estado estado_fisico
);

CREATE TABLE muros_ala (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  inspeccion_id UUID NOT NULL
    REFERENCES inspecciones(id)
    ON DELETE CASCADE,
  longitud_m REAL CHECK (longitud_m >= 0),
  espesor_m REAL CHECK (espesor_m > 0),
  tiene_solera BOOLEAN,
  material_id INT REFERENCES catalogos(id),
  estado estado_fisico
);

-- ==========================================
-- NUEVA TABLA: MUROS CABEZAL (SECCIÓN 3)
-- ==========================================
CREATE TABLE muros_cabezal (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  inspeccion_id UUID NOT NULL
    REFERENCES inspecciones(id)
    ON DELETE CASCADE,
  existe BOOLEAN NOT NULL,
  longitud_m REAL CHECK (longitud_m >= 0),
  espesor_m REAL CHECK (espesor_m > 0),
  estado estado_fisico,
  
  CONSTRAINT check_dimensiones_muro_cabezal
    CHECK (
      (
        existe = TRUE
        AND longitud_m > 0
        AND espesor_m > 0
      )
      OR
      (
        existe = FALSE
        AND longitud_m IS NULL
        AND espesor_m IS NULL
        AND estado IS NULL
      )
    )
);

CREATE TABLE pozos_recoleccion (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  inspeccion_id UUID NOT NULL
    REFERENCES inspecciones(id)
    ON DELETE CASCADE,
  existe BOOLEAN NOT NULL,
  ancho_m REAL,
  largo_m REAL,
  estado estado_fisico,
  
  CONSTRAINT check_dimensiones_pozo
    CHECK (
      (
        existe = TRUE
        AND ancho_m > 0
        AND largo_m > 0
      )
      OR
      (
        existe = FALSE
        AND ancho_m IS NULL
        AND largo_m IS NULL
        AND estado IS NULL
      )
    )
);

CREATE TABLE fotografias (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  inspeccion_id UUID NOT NULL
    REFERENCES inspecciones(id)
    ON DELETE CASCADE,
  url TEXT NOT NULL,
  descripcion TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE bitacora_movimientos (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  nombre_tabla TEXT NOT NULL,
  operacion TEXT NOT NULL CHECK (operacion IN ('INSERT', 'UPDATE', 'DELETE')),
  registro_id TEXT NOT NULL,
  datos_anteriores JSONB,
  datos_nuevos JSONB,
  usuario_id UUID,
  fecha TIMESTAMPTZ DEFAULT now()
);

--- Índices de rendimiento
CREATE INDEX idx_inspecciones_alcantarilla ON inspecciones(alcantarilla_id);
CREATE INDEX idx_fotografias_inspeccion ON fotografias(inspeccion_id);
CREATE INDEX idx_tuberias_inspeccion ON tuberias(inspeccion_id);
CREATE INDEX idx_muros_inspeccion ON muros_ala(inspeccion_id);
CREATE INDEX idx_pozos_inspeccion ON pozos_recoleccion(inspeccion_id);
-- Índice para la nueva tabla
CREATE INDEX idx_muros_cabezal_inspeccion ON muros_cabezal(inspeccion_id);


--- Función de auditoría (Bitácora)
CREATE OR REPLACE FUNCTION registrar_bitacora()
RETURNS TRIGGER AS $$
BEGIN
  IF (TG_OP = 'DELETE') THEN
    INSERT INTO bitacora_movimientos (nombre_tabla, operacion, registro_id, datos_anteriores)
    VALUES (TG_TABLE_NAME, TG_OP, OLD.id::text, to_jsonb(OLD));
    RETURN OLD;
  ELSIF (TG_OP = 'UPDATE') THEN
    INSERT INTO bitacora_movimientos (nombre_tabla, operacion, registro_id, datos_anteriores, datos_nuevos)
    VALUES (TG_TABLE_NAME, TG_OP, NEW.id::text, to_jsonb(OLD), to_jsonb(NEW));
    RETURN NEW;
  ELSIF (TG_OP = 'INSERT') THEN
    INSERT INTO bitacora_movimientos (nombre_tabla, operacion, registro_id, datos_nuevos)
    VALUES (TG_TABLE_NAME, TG_OP, NEW.id::text, to_jsonb(NEW));
    RETURN NEW;
  END IF;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

--- Triggers de la bitácora
CREATE TRIGGER trg_bitacora_alcantarillas AFTER INSERT OR UPDATE OR DELETE ON alcantarillas FOR EACH ROW EXECUTE FUNCTION registrar_bitacora();
CREATE TRIGGER trg_bitacora_inspecciones AFTER INSERT OR UPDATE OR DELETE ON inspecciones FOR EACH ROW EXECUTE FUNCTION registrar_bitacora();
CREATE TRIGGER trg_bitacora_tuberias AFTER INSERT OR UPDATE OR DELETE ON tuberias FOR EACH ROW EXECUTE FUNCTION registrar_bitacora();
CREATE TRIGGER trg_bitacora_muros AFTER INSERT OR UPDATE OR DELETE ON muros_ala FOR EACH ROW EXECUTE FUNCTION registrar_bitacora();
-- Trigger para la nueva tabla
CREATE TRIGGER trg_bitacora_muros_cabezal AFTER INSERT OR UPDATE OR DELETE ON muros_cabezal FOR EACH ROW EXECUTE FUNCTION registrar_bitacora();
CREATE TRIGGER trg_bitacora_pozos AFTER INSERT OR UPDATE OR DELETE ON pozos_recoleccion FOR EACH ROW EXECUTE FUNCTION registrar_bitacora();
CREATE TRIGGER trg_bitacora_fotografias AFTER INSERT OR UPDATE OR DELETE ON fotografias FOR EACH ROW EXECUTE FUNCTION registrar_bitacora();