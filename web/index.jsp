<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 02.04.2016
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!doctype html>
<head>
    <meta charset="UTF-8">
    <title>Lerning portal</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css"/>
</head>
<body>

<!--start container-->
<div id="container">

    <!--start header-->

    <header>
        <!--start logo-->
        <a href="index.html" id="logo"><img src="images/logo.png" alt="logo"/></a>
        <!--end logo-->

        <!--start menu-->

        <nav>
            <ul>
                <li><a href="index.jsp" style="border-bottom: 3px solid #848484;">Home</a></li>
                <li><a href="all_courses.jsp">Courses</a></li>
                <li><a href="#">News</a></li>
				<li><a href="#login">Login</a></li>

            </ul>
        </nav>
        <!--end menu-->

		<!-- Модальное окно №1 -->
		<a href="#x" class="overlay" id="login"></a>
		<div class="popup">
			 <div class="Registration">
				<s:form action="register" class="Center">
                    <h2>Registration</h2>
                    <s:textfield name="user.login" label="Login"></s:textfield>
                    <s:password name="user.password" label="Password"></s:password>
                    <s:select class="ListU" list="{'student','lecturer'}" name="user.role" label="Role"></s:select>
                    <s:textfield name="user.name" label="Name"></s:textfield>
                    <s:textfield name="user.surname" label="Surname"></s:textfield>
                    <s:textfield name="user.phone" label="Phone"></s:textfield>
                    <s:textfield name="user.email" label="Email"></s:textfield>
                    <s:hidden name="user.banStatus" value="0"></s:hidden>
                    <s:submit value="Register"></s:submit>
                </s:form>
            </div>
            <div class="Login">
                <s:form action="login" class="Center">
                    <h2>Login</h2>
                    <s:textfield name="login" label="Login"></s:textfield>
                    <s:password name="password" label="Password"></s:password>
                    <s:submit value="Login"></s:submit>
                </s:form>
            </div>
		    <a class="close"title="Закрыть" href="#close"></a>
		</div>

        <!--end header-->
    </header>

    <!--start intro-->
    <section id="intro">
        <div id="slides">
            <div class="slides_container">
                <img src="images/banner1.jpg" width="960" height="300" alt="baner">
                <img src="images/banner2.jpg" width="960" height="300" alt="baner">
                <img src="images/banner3.jpg" width="960" height="300" alt="baner">

            </div>
        </div>

    </section>
    <!--end intro-->

    <div class="holder_content_main">

        <section class="group5">
            <h1>Welcome</h1>
            <s:actionerror/>
        </section>
    </div>
    <div class="holder_content">
    </div>

</div>
<!--end container-->

<!--start footer-->
<footer>
    <div class="container">
        <aside class="footer_left">
        </aside>
    </div>
    <div id="copyright"> © 2016</div>
    <div id="createdby">Created by Mary Yakushik, Anton Shulga, Vadim Shikulo</div>
    </div>
</footer>

<!--end footer-->
</body>
</html>


