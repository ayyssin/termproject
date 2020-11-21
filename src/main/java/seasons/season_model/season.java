package seasons.season_model;

public class season {
    private String season_name;
    private String discount;
    private String weekend_rate;

    public String getSeason_name(){return season_name;}
    public void setSeason_name(String season_name){this.season_name=season_name;}
    public String getDiscount(){return discount;}
    public void setDiscount(String discount){this.discount=discount;}
    public String getWeekend_rate(){return weekend_rate;}
    public void setWeekend_rate(String weekend_rate){this.weekend_rate=weekend_rate;}
}
