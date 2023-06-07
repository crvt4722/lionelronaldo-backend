/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author User
 */
public class Keyword {
    private String name;
    private double find;

    public Keyword(String name, double find) {
        this.name = name;
        this.find = find;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getFind() {
        return find;
    }

    public void setFind(double find) {
        this.find = find;
    }
    
    public void calculateAndSetFind(String key){
        String[] arrS = this.name.split(" ");
        String[] arrKey = key.split(" ");
        int cnt = 0;
        for(String x : arrS){
            for(String y : arrKey){
                if(x.equals(y)){
                    cnt++;
                    break;
                }
            }
        }
        this.find = (double) cnt / arrKey.length;
    }
    @Override
    public String toString() {
        return "Keyword{" + "name=" + name + ", find=" + find + '}';
    }
    
}
