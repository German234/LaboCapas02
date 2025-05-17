package com.lab02.exercise.controller;

import com.lab02.exercise.model.Inventario;
import com.lab02.exercise.service.InventarioService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/inventarios")
public class InventarioController {

    private InventarioService inventarioService;

    public InventarioController(InventarioService inventarioService) {
        this.inventarioService = inventarioService;
    }

    @GetMapping("/local/{localId}")
    public ResponseEntity<List<Inventario>> listarPorLocalId(@PathVariable UUID localId) {
        List<Inventario> inventarios = inventarioService.getInventarioByLocal(localId);
        if (inventarios.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(inventarios);
    }

    @GetMapping("/local/nombre/{localName}")
    public ResponseEntity<List<Inventario>> listarPorLocalName(@PathVariable String localName) {
        List<Inventario> inventarios = inventarioService.getInventoryByLocalName(localName);
        if (inventarios.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(inventarios);
    }
}
