
package com.smartbeehouse.model;

public class Hive {
    private int id;
    private String code;
    private int siteId;
    private int farmerId;

    public Hive() {}

    public Hive(int id, String code, int siteId, int farmerId) {
        this.id = id;
        this.code = code;
        this.siteId = siteId;
        this.farmerId = farmerId;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public int getSiteId() { return siteId; }
    public void setSiteId(int siteId) { this.siteId = siteId; }

    public int getFarmerId() { return farmerId; }
    public void setFarmerId(int farmerId) { this.farmerId = farmerId; }
}
