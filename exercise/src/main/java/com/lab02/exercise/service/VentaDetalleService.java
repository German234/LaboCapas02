package com.lab02.exercise.service;

import com.lab02.exercise.model.VentaDetalle;
import com.lab02.exercise.repository.VentaDetalleRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class VentaDetalleService {

    private final VentaDetalleRepository ventaDetalleRepository;

    public VentaDetalleService(VentaDetalleRepository ventaDetalleRepository) {
        this.ventaDetalleRepository = ventaDetalleRepository;
    }

    public List<VentaDetalle> getDetallesPorModelo(String modelo) {
        return ventaDetalleRepository.findAllByAutomovil_Modelo(modelo);
    }

    public List<VentaDetalle> getDetallesPorAutomovilId(UUID automovilId) {
        return ventaDetalleRepository.findAllByAutomovil_Id(automovilId);
    }
}
