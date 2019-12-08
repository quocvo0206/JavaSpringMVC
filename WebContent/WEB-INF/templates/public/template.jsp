<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/templates/taglib.jsp" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>S-Shop</title>
    <tiles:insertAttribute name="css"></tiles:insertAttribute>
</head>
<body>
  <tiles:insertAttribute name="header"></tiles:insertAttribute>
  <tiles:insertAttribute name="slider"></tiles:insertAttribute>
  <section>
    <div class="container">
      <div class="row">
        <tiles:insertAttribute name="left-sidebar"></tiles:insertAttribute>
        <tiles:insertAttribute name="content"></tiles:insertAttribute>
      </div>
    </div>
  </section>
  <tiles:insertAttribute name="footer"></tiles:insertAttribute>
  <tiles:insertAttribute name="js"></tiles:insertAttribute>
</body>
</html>
