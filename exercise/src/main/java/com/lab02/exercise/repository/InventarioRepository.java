package com.lab02.exercise.repository;

import com.lab02.exercise.model.Inventario;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface InventarioRepository extends JpaRepository<Inventario, UUID> {

    List<Inventario> findAllByLocalId(UUID localId);
    List<Inventario> findAllByLocal_Nombre(String localName);
}
