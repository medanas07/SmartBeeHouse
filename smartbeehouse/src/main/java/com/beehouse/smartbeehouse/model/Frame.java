/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beehouse.smartbeehouse.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author moham
 */
@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Frame {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private int slotNumber;
    private double weight;
    
    @ManyToOne
    private HiveComponent component;
}
