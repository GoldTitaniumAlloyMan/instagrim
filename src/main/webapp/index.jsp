<%-- 
    Document   : index
    Created on : Sep 28, 2014, 7:01:44 PM
    Author     : Administrator
--%>

<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="uk.ac.dundee.computing.aec.instagrim.stores.*" %>
<%@ page import="uk.ac.dundee.computing.aec.instagrim.models.*" %>
<%@ page import = "uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts" %>
<%@ page import = "com.datastax.driver.core.Cluster" %>
<!DOCTYPE html>
<html>
    <head>
        <title>MapGram</title>
        <link rel="stylesheet" type="text/css" href="Styles.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <header>

            <h1>MapGram ! </h1>
            <h2>Your world in Black and White</h2>
        </header>
        <nav>
            <ul>

                <% LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                    if (lg != null) {
                       
                        if (lg.getLoggedIn()) {

                            lg.getUsername();
                            PicModel pm = new PicModel();
                            Cluster cluster;

                            User us = new User();
                            cluster = CassandraHosts.getCluster();
                            pm.setCluster(cluster);
                            us.setCluster(cluster);

                %>
                <li><a href="upload.jsp">Upload</a></li>
                <li><a href="/Instagrim/Logout">Logout</a></li>
                <li><a href="/Instagrim/Images/<%=lg.getUsername()%>">Profile</a></li>
                    <%}
                        } else {
                    %>
                <li><a href="register.jsp">Register</a></li>

                <li><a href="login.jsp">Login</a></li>
                    <%
                        }
                    %>
            </ul>
        </nav>

        <article>

            <%
                java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
                java.util.LinkedList<String> users = new java.util.LinkedList<>();
                if (lsPics == null) {
            %>
            <p>No Pictures found</p>
            <%
            } else {
                User us = new User();
                PicModel pm = new PicModel();
                for (int i = 0; i < lsPics.size(); i++) {
                    Pic p = lsPics.get(i);
                    users=pm.getUsers(p.getSUUID());
                    if (us.doesFollow(lg.getUsername(), p.getUser())) {

            %>
            <a href="/Instagrim/Image/<%=p.getSUUID()%>" ><img src="/Instagrim/Thumb/<%=p.getSUUID()%>"></a>
            <a href="/Instagrim/Images/<%=p.getUser()%>" > <% out.println(p.getUser());%> </a>
            <%

                        }
                    }
                }
            %>

        </article>

        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
                <li>&COPY; Andy C</li>
            </ul>
        </footer>

    </body>
</html>
