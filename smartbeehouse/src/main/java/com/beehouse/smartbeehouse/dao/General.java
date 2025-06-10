/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beehouse.smartbeehouse.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import java.util.List;

/**
 *
 * @author moham
 */
public class General<T> {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("my_persistence_unit");
    private Class<T> entityClass;

    public General(T entityClass) {
        this.entityClass = (Class<T>) entityClass.getClass();
    }

    
    public T findById(Object id) {
        EntityManager em = emf.createEntityManager();
            return em.find(entityClass, id);
  
    }
    
    public void deleteById(Object id) {
        EntityManager em = emf.createEntityManager();
        T obj = em.find(entityClass, id);
        if (obj != null) {
            try{
                em.getTransaction().begin();
                em.remove(obj);
                em.getTransaction().commit();
            }finally{
                em.close();
            }
        }
    }
    
    public List<T> executeQuerry(String querry){
        EntityManager em = emf.createEntityManager();
        return em.createQuery(querry, entityClass).getResultList();
    }

    public List<T> findAll() {
        EntityManager em = emf.createEntityManager();
        String jpql = "SELECT e FROM " + entityClass.getSimpleName() + " e";
        return em.createQuery(jpql, entityClass).getResultList();
        
    }
    public List<T> findAll(String jpql) {
        EntityManager em = emf.createEntityManager();
        
            return em.createQuery(jpql, entityClass).getResultList();
        
    }
    public void save(T obj) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();
            em.persist(obj);  
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }
    
    public void update(T obj) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();
            em.merge(obj);  
            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }
}
