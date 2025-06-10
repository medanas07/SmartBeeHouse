
package com.smartbeehouse.service;

import com.smartbeehouse.dao.HiveDAO;
import com.smartbeehouse.dao.impl.HiveDAOImpl;
import com.smartbeehouse.model.Hive;
import java.util.List;

public class HiveServiceImpl implements HiveService {
    private HiveDAO hiveDAO = new HiveDAOImpl();

    public void addHive(Hive hive) { hiveDAO.addHive(hive); }
    public Hive getHiveById(int id) { return hiveDAO.getHiveById(id); }
    public List<Hive> getAllHives() { return hiveDAO.getAllHives(); }
    public void updateHive(Hive hive) { hiveDAO.updateHive(hive); }
    public void deleteHive(int id) { hiveDAO.deleteHive(id); }
}
