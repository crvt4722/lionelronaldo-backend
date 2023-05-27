/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;

/**
 *
 * @author hi
 */
public class TRUC_OderDAO {
    public static Connection openConnection() throws ClassNotFoundException {
        return new TRUC_DBconnect().getConnection();
    }
}
