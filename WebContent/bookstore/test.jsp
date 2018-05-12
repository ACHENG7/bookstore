<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分页测试</title>
</head>
<body>
   <table>
      <tr>
         <th>书名</th>
         <th>作者</th>
         <th>价格</th>
      </tr>
      <s:iterator value="booklist" var="b">
         <tr>
            <td><s:property value="b.bookName"/> </td>
            <td><s:property value="b.bookAuthor"/> </td>
            <td><s:property value="b.bookPrice"/> </td>
         </tr>      
      </s:iterator>
        
</table>

<form name="f1" method="POST" action="test.jsp" onSubmit="return checknum()">
            <table border="0" align="center" >
                <tr>
                    <td>第${page} 页 共${countpage} }页 <a href="test?pages=1">首页</a></td>
                    <td><a href="test?pages=${page-1 } %>"> 上一页</a></td>
                    <td><a href="test?pages=${page+1 }"> 下一页</a></td>
                    <td><a href="test?pages=${countpage}">最后一页</a></td>
                    <td>转到第:<input type="text" name="pages" size="8">页<input type="submit" value="GO" name="cndok"></td>
                </tr>
            </table> 
 </form>
</body>
</html>