<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inquiryList</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Wish shop project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/bootstrap4/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/responsive.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="plugins/OwlCarousel2-2.2.1/animate.css">
<link href="plugins/colorbox/colorbox.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="super_container fixFooter">
   <!-- Header -->      
   <jsp:include page="../../../../WEB-INF/inc/navBar.jsp"></jsp:include>
   <div class="nullbox">
   </div>   
   
   <!-- contents -->
   <div class="container">      
     <div class="row">
        <div class="col">
      <div class="section_title_container text-center">
         <div class="section_subtitle">목로주점</div>
         <div class="section_title">문의사항</div>
         <div class="text-right">
            <a href="${pageContext.request.contextPath}/insertInquiryController" id="insertInquiryBtn" class="btn btn-outline-secondary btn-sm">글쓰기</a>
         </div>
         <c:if test="${fn:length(inquiryList) < 1}">
             <div class="page_msg text-center">
                문의사항이 없습니다.<br>
             </div>
          </c:if>
        
          <c:if test="${fn:length(inquiryList) != null}">
            <table class ="table table-hover">
               <thead>
                  <tr>
                     <th class="text-center" width="80px">NO</th>
                     <th class="text-center">제목</th>
                     <th class="text-center" width="100px">글쓴이</th>
                     <th class="text-center" width="200px">작성시간</th>
                  </tr>
               </thead>
                <c:forEach items="${inquiryList}" var="item">
               </tbody>
                  <tr>
                     <td class="text-center"><a href="${pageContext.request.contextPath}/inquiryOneController?inquiryNo=${item.inquiryNo}">${item.inquiryNo}</a></td>
                     <td class="text-left"><a href="${pageContext.request.contextPath}/inquiryOneController?inquiryNo=${item.inquiryNo}">${item.title}</a></td>
                     <td class="text-center"><a href="${pageContext.request.contextPath}/inquiryOneController?inquiryNo=${item.inquiryNo}">${item.consumerId}</a></td>   
                     <td class="text-center"><a href="${pageContext.request.contextPath}/inquiryOneController?inquiryNo=${item.inquiryNo}">${item.createDate}</a></td>
                  </tr>
               </tbody>
                </c:forEach>                
            </table>
         </c:if>
     
            <c:if test="${currentPage > 1}">
               <a href="${pageContext.request.contextPath}/inquiryListController?currentPage=${currentPage-1}" >이전</a>
            </c:if>
            <!-- 다음 버튼 -->
            <c:if test="${currentPage < lastPage}">
               <a href="${pageContext.request.contextPath}/inquiryListController?currentPage=${currentPage+1}">다음</a>
            </c:if>
         </div>
      </div>   
   </div>
</div>
   <!-- Footer -->   
   <jsp:include page="../../../../WEB-INF/inc/footer.jsp"></jsp:include>
</div>
</body>
</html>