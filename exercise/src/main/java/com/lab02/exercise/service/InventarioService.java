package com.lab02.exercise.service;

import com.lab02.exercise.model.Inventario;
import com.lab02.exercise.repository.InventarioRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class InventarioService {

    private final InventarioRepository inventarioRepository;

    public InventarioService(InventarioRepository inventarioRepository) {
        this.inventarioRepository = inventarioRepository;
    }

    public List<Inventario> getInventarioByLocal(UUID localId) {
        return inventarioRepository.findAllByLocalId(localId);
    }

    public List<Inventario> getInventoryByLocalName(String localName) {
        return inventarioRepository.findAllByLocal_Nombre(localName);
    }
}
