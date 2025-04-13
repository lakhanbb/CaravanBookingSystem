package com.caravan.Dao;

import com.caravan.entity.Caravan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class CaravanDaoImpl implements CaravanDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public Long saveCaravan(Caravan caravan) {
        return (Long) hibernateTemplate.save(caravan);
    }
    

    @Override
    public Caravan getCaravanById(Long id) {
        return hibernateTemplate.get(Caravan.class, id);
    }

    @Override
    public List<Caravan> getAllCaravans() {
        return hibernateTemplate.loadAll(Caravan.class);
    }

    @Override
    public void updateCaravan(Caravan caravan) {
        hibernateTemplate.update(caravan);
    }

    @Override
    public void deleteCaravan(Long id) {
        Caravan caravan = getCaravanById(id);
        if (caravan != null) {
            hibernateTemplate.delete(caravan);
        }
    }
    
    
}
