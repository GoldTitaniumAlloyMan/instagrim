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
    boolean logedin=false;
    String Username=null;
    String name = null;
    String lastname = null;
    String firstname = null;
    String address = null;
    String email = null;
    public void LogedIn(){
        
    }
    public void setname(String name) {
        this.name=name;
    }
    
    public String getname(){
        return this.name;
    }
    
    public void setUsername(String name){
        this.Username=Username;
    }
    public String getUsername(){
        return Username;
    }
    public void setLogedin(){
        logedin=true;
    }
    public void setLogedout(){
        logedin=false;
    }
    
    public void setLoginState(boolean logedin){
        this.logedin=logedin;
    }
    public boolean getlogedin(){
        return logedin;
    }
    public void setLastName(String lastname) {
        this.lastname=lastname;
    }
    
    public String getLastName(){
        return this.lastname;
    }
    public void setAdress(String address) {
        this.address=address;
    }
    
    public String getAddress(){
        return this.address;
    }
    public void setEmail(String email) {
        this.email=email;
    }
    
    public String getEmail(){
        return this.email;
    }
    
}
