package com.lab02.exercise.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Entity
@Table(name = "inventario")
@Getter
@Setter
@NoArgsConstructor
public class Inventario {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private UUID id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_local", nullable = false)
    private Local local;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_automovil", nullable = false)
    private Automovil automovil;

    @Column(name = "cantidad")
    private Integer cantidad;

    @Column(name = "costo_unitario")
    private Float costoUnitario;

    @Column(name = "precio_unitario_estandar")
    private Float precioUnitarioEstandar;

}

