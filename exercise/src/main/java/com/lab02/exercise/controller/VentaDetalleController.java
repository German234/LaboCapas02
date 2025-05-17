package com.lab02.exercise.controller;
import com.lab02.exercise.model.VentaDetalle;
import com.lab02.exercise.service.VentaDetalleService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/venta-detalles")
public class VentaDetalleController {

    private final VentaDetalleService service;

    public VentaDetalleController(VentaDetalleService service) {
        this.service = service;
    }

    @GetMapping("/automovil/modelo/{modelo}")
    public ResponseEntity<List<VentaDetalle>> listarPorModelo(@PathVariable String modelo) {
        List<VentaDetalle> detalles = service.getDetallesPorModelo(modelo);
        if (detalles.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(detalles);
    }

    @GetMapping("/automovil/{automovilId}")
    public ResponseEntity<List<VentaDetalle>> listarPorModelo(@PathVariable UUID automovilId) {
        List<VentaDetalle> detalles = service.getDetallesPorAutomovilId(automovilId);
        if (detalles.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(detalles);
    }


}
