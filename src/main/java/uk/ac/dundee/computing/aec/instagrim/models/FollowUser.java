/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.models;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import uk.ac.dundee.computing.aec.instagrim.lib.AeSimpleSHA1;

/**
 *
 * @author Dan Mackay
 */
public class FollowUser {
    Cluster cluster;
    public FollowUser(){
        
    }
    
    public boolean RegisterUser(String username){
       
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("insert into userprofiles (following) Values(?)");
        BoundStatement boundStatement = new BoundStatement(ps);
        session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        //We are assuming this always works.  Also a transaction would be good here !
        
        return true;
    }
    
    public boolean doesExist(String username){
            
            String email = "";

            Session session = cluster.connect("instagrim");
            PreparedStatement ps = session.prepare("select email from userprofiles where login =?");
            ResultSet rs = null;
            BoundStatement boundStatement = new BoundStatement(ps);
            rs = session.execute( // this is where the query is executed
                    boundStatement.bind( // here you are binding the 'boundStatement'
                            username));
            if (rs.isExhausted()) {
                return false;

            } else {
                for (Row row : rs) {

                    email = row.getString("email");

                }
            }
            return true;
        }
    
    public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }
}
