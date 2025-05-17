package com.lab02.exercise.repository;

import com.lab02.exercise.model.VentaDetalle;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.UUID;

public interface VentaDetalleRepository extends JpaRepository<VentaDetalle, UUID> {

    List<VentaDetalle> findAllByAutomovil_Id(UUID automovilId);

    List<VentaDetalle> findAllByAutomovil_Modelo(String modelo);
}
