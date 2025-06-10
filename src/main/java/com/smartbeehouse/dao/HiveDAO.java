
package com.smartbeehouse.dao;

import com.smartbeehouse.model.Hive;
import java.util.List;

public interface HiveDAO {
    void addHive(Hive hive);
    Hive getHiveById(int id);
    List<Hive> getAllHives();
    void updateHive(Hive hive);
    void deleteHive(int id);
}
