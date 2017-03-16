<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Using Choose,Otherwise and When</title>
  </head>

  <body>
    <c:if test="${pageContext.request.method=='POST'}" >Ok, we'll
    send 
    <c:out value="${param.enter}" />

    <c:choose>
      <c:when test="${param.enter=='1'}">pizza.
      <br />
      </c:when>

      <c:otherwise>pizzas.
      <br />
      </c:otherwise>
    </c:choose>
    </c:if>

    <form method="post">Enter a number between 1 and 5:
    <input type="text" name="enter" />

    <input type="submit" value="Accept" />

    <br />
    </form>
  </body>
</html>