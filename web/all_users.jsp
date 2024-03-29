<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Антон
  Date: 07.04.2016
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<h1>ALL USERS</h1>
<s:if test="userList.size() > 0">
  <div class="content">
    <table class="courses_table" cellpadding="5px">
      <tr class="even">
        <th>Id</th>
        <th>Login</th>
        <th>Role</th>
        <th>Name</th>
        <th>Surname</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Ban status</th>
        <th>Edit</th>
        <th>Delete</th>
      </tr>
      <s:iterator value="userList" status="userStatus">
        <tr>
          <td><s:property value="id" /></td>
          <td><s:property value="login" /></td>
          <td><s:property value="role" /></td>
          <td><s:property value="name" /></td>
          <td><s:property value="surname" /></td>
          <td><s:property value="phone" /></td>
          <td><s:property value="email" /></td>
          <td><s:property value="banStatus" /></td>
          <td>
            <s:url id="editURL" action="editUser">
              <s:param name="id" value="%{id}"></s:param>
            </s:url>
            <s:a href="%{editURL}">Edit</s:a>
          </td>
          <td>
            <s:url id="deleteURL" action="deleteUser">
              <s:param name="id" value="%{id}"></s:param>
            </s:url>
            <s:a href="%{deleteURL}">Delete</s:a>
          </td>
        </tr>
      </s:iterator>
    </table>
  </div>
</s:if>
</body>
</html>
