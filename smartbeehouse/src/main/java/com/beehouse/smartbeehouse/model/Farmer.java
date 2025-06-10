/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beehouse.smartbeehouse.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
public class Farmer {
    @Id
    private String email;
    private String name;
    private String password;
    
    @OneToMany(mappedBy = "farmer")
    private List<Farm> farms;


    
    


    
    
}
