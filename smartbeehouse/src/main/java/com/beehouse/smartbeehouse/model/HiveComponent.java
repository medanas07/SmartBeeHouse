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
import jakarta.persistence.OneToMany;
import java.util.List;
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
public class HiveComponent {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String type; // "base", "extend"
    private int position;
    
    @ManyToOne
    private Beehive beehive;
    
    // 1 frame base et 5 extension
    @OneToMany(mappedBy = "component")
    private List<Frame> frames;
}
