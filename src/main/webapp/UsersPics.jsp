<%-- 
    Document   : UsersPics
    Created on : Sep 24, 2014, 2:52:48 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Instagrim</title>
        <link rel="stylesheet" type="text/css" href="/Instagrim/Styles.css" />
    </head>
    <body>
        <header>
            <% LoggedIn lg = (LoggedIn) session.getAttribute("LoggedIn");
                Cluster cluster = null;
                User us = new User();
                cluster = CassandraHosts.getCluster();
                us.setCluster(cluster);

            %>
            <h1>InstaGrim ! </h1>
            <h2><% out.println(lg.getUsername());%></h2>
        </header>

        <h3>Follow a User</h3>
        <form name="input" action="/Instagrim/Follow" method="post">
            <input type="text" name="user" value="<%=lg.getUsername()%>" hidden>
            <input type="text" name="userfollows">
            <input type="submit" value="Follow">
        </form>

        <!--    <li class="footer"><a href="/Instagrim">Home</a></li> -->
        <nav>
            <ul>
                <li class="nav"><a href="/Instagrim/upload.jsp">Upload</a></li>
                <li class="nav"><a href="/Instagrim/Images/majed">Cool peoples photos</a></li>
            </ul>
        </nav>

        <article>
            <h1>Your Pics</h1>
            <%
                java.util.LinkedList<Pic> lsPics = (java.util.LinkedList<Pic>) request.getAttribute("Pics");
                if (lsPics == null) {
            %>
            <p>No Pictures found</p>
            <%
            } else {
                Iterator<Pic> iterator;
                iterator = lsPics.iterator();
                while (iterator.hasNext()) {
                    Pic p = (Pic) iterator.next();

            %>
            <% if (us.doesFollow(lg.getUsername(), p.getUser())) {%>
            <a href="/Instagrim/Image/<%=p.getSUUID()%>" ><img src="/Instagrim/Thumb/<%=p.getSUUID()%>"></a></br>
            <a><%out.println(p.getUser());%></a></br>

            <%}%>
            <% if (lg.getUsername() != p.getUser()) {%>
            <form name="input" action="/Instagrim/Follow" method="post">
                <input type="text" name="user" value="<%=lg.getUsername()%>" hidden>
                <input type="text" name="userfollows" value="<%=p.getUser()%>" hidden>
                <%
                    }

                %>
                <input type="submit" value="Follow">
            </form>
            <%}
            }%>
        </article>
        <footer>
            <ul>
                <li class="footer"><a href="/Instagrim">Home</a></li>
            </ul>
        </footer>
    </body>
</html>