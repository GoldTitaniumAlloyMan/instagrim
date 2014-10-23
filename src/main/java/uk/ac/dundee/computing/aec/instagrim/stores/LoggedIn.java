/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.aec.instagrim.stores;

/**
 *
 * @author Administrator
 */
public class LoggedIn {
    boolean loggedIn=false;
    String Username=null;
    //String name = null;
    String lastname = null;
    String firstname = null;
    String addresses = null;
    String email = null;
    public void LoggedIn(){
        
    }
    public void setfirstname(String firstname) {
        this.firstname=firstname;
    }
    
    public String getfirstname(){
        return this.firstname;
    }
    
    public void setUsername(String Username){
        this.Username=Username;
    }
    public String getUsername(){
        return Username;
    }
    public void setLoggedIn(){
        loggedIn=true;
    }
    public void setLoggedout(){
        loggedIn=false;
    }
    
    public void setLogInState(boolean loggedIn){
        this.loggedIn=loggedIn;
    }
    public boolean getLoggedIn(){
        return loggedIn;
    }
    public void setLastName(String lastname) {
        this.lastname=lastname;
    }
    
    public String getLastName(){
        return this.lastname;
    }
    public void setAdresses(String addresses) {
        this.addresses=addresses;
    }
    
    public String getAddresses(){
        return this.addresses;
    }
    public void setEmail(String email) {
        this.email=email;
    }
    
    public String getEmail(){
        return this.email;
    }
    
}
