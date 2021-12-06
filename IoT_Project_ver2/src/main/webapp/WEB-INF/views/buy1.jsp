<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>    


<%@ include file="/WEB-INF/views/include/header.jsp"%>

<h3 class="tit-cart" style="margin: 80px 0px 0px;  padding: 0px 0px 0px 18px; text-align: center; font-size: 22px; line-height: 1.25; color: rgb(31, 31, 31); font-family: Cardo, serif; background-image: url(&quot;bul01.gif&quot;); background-position: 0px 1px; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial;">장바구니 담긴 상품</h3>
<div class="table-cart table-fill-prd" style="margin-top: 10px; text-align: center; margin-bottom: 70px; border: 1px solid rgb(226, 226, 226); color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif, &quot;Nanum Gothic&quot;, nanumgothic, AppleGothic, Helvetica, sans-serif; font-size: 12px;">
    <center><table class="__se_tbl_ext" summary="번호, 사진, 상품명, 수량, 적립, 가격, 배송비, 취소" style="line-height: 1.25; width: 1000px; border-collapse: collapse; border-spacing: 0px; table-layout: fixed; overflow-wrap: break-word; word-break: keep-all;">
	</center>
        <thead>
            <tr>
                <th scope="col" style="margin: 0px; padding: 7px 0px 6px; background-color: rgb(250, 250, 250); font-weight: normal; font-size: 18px;">
                    <div class="tb-center" style="padding: 0px 10px;"><input type="checkbox" name="__allcheck" class="MS_input_checkbox"  style="margin: 0px; padding: 0px; font-size: 12px; line-height: 1.25; color: rgb(68, 68, 68); font-family: 'Open Sans', sans-serif, 'Nanum Gothic', nanumgothic, AppleGothic, Helvetica, sans-serif; vertical-align: middle;"></div>
                </th>
                <th scope="col" style="margin: 0px; padding: 7px 0px 6px; background-color: rgb(250, 250, 250); font-weight: normal; font-size: 18px;">
                    <div class="tb-center" style="padding: 0px 10px;">이미지</div>
                </th>
                <th scope="col" style="margin: 0px; padding: 7px 0px 6px; background-color: rgb(250, 250, 250); font-weight: normal; font-size: 18px;">
                    <div class="tb-center" style="padding: 0px 10px;">상품명</div>
                </th>
                <th scope="col" style="margin: 0px; padding: 7px 0px 6px; background-color: rgb(250, 250, 250); font-weight: normal; font-size: 18px;">
                    <div class="tb-center" style="padding: 0px 10px;"></div>
                </th>

                <th scope="col" style="margin: 0px; padding: 7px 0px 6px; background-color: rgb(250, 250, 250); font-weight: normal; font-size: 18px;">
                    <div class="tb-center" style="padding: 0px 10px;">적립</div>
                </th>
                <th scope="col" style="margin: 0px; padding: 7px 0px 6px; background-color: rgb(250, 250, 250); font-weight: normal; font-size: 18px;">
                    <div class="tb-center" style="padding: 0px 10px;">가격</div>
                </th>
                
                <th scope="col" style="margin: 0px; padding: 7px 0px 6px; background-color: rgb(250, 250, 250); font-weight: normal; font-size: 18px;">
                    <div class="tb-center" style="padding: 0px 10px; text-align: center;">취소</div>
                </th>
            </tr>
        </thead>
        
        
        
        
        <c:choose>
        	<c:when test="${list!=null}">
			   <c:forEach items="${list}" var="getList">
	            <tr>
	            	<td scope="col" style="margin: 0px; padding: 7px 0px 6px; background-image: none; font-weight: normal; font-size: 18px;">
	                    <div class="tb-center" style="padding: 0px 10px;"><input type="checkbox" name="__allcheck" class="MS_input_checkbox" checked="" style="margin: 0px; padding: 0px; font-size: 12px; line-height: 1.25; color: rgb(68, 68, 68); font-family: 'Open Sans', sans-serif, 'Nanum Gothic', nanumgothic, AppleGothic, Helvetica, sans-serif; vertical-align: middle;"></div>
	                </td>
	            	<td id="b_Image" name="b_Image" background-image: none;><img src="/img/<c:out value="${getList.b_Image}"/>" width="100px" height="80px"/></td>
	            	<td id="b_Name" name="b_Name" style="margin: 0px; padding: 18px 10px; font-size: 18px; background-image: none;"><c:out value="${getList.b_Name}"/></td>
	            	<td scope="col" style="margin: 0px; padding: 7px 0px 6px; background-image: none; font-weight: normal; font-size: 18px;">
	                    <div class="tb-center" style="padding: 0px 10px;"></div>
	                </td>
	            	<td id="b_Bonus" name="b_Bonus" style="margin: 0px; padding: 18px 10px; font-size: 18px; background-image: none;"><c:out value="${getList.b_Bonus}"/></td>
	            	<td id="b_Price" name="b_Price" style="margin: 0px; padding: 18px 10px; font-size: 18px; background-image: none;"><c:out value="${getList.b_Price}"/></td>
	            	
	                <td style="margin: 0px; padding: 18px 0px; font-size: 18px; border-top: 1px solid rgb(227, 227, 227); background-image: none;">
	                    <div class="tb-center" style="padding: 0px 10px; text-align: center;"></span><span class="d-block" style="display: block; padding-bottom: 3px;"><a class="a_btn grey w55" style="line-height: 1.25; color: rgb(255, 255, 255); font-family: 나눔고딕; vertical-align: middle; width: 55px; display: inline-block; padding: 3px 0px 2px; background: rgb(117, 117, 117); border-bottom: 1px solid rgb(80, 80, 80);">삭제</a></span></div>
	                </td>
	            </tr>
            </c:forEach>
            </c:when>
            
            
            <c:otherwise>
            <tr>
            	<td colspan="7"><h4 align="center">장바구니가 비어있습니다.</h4></td>
            </tr>
            </c:otherwise>
            
            </c:choose>

            
        </tbody>
        <tfoot>
        <c:forEach items="${list}" var="getList">
            <tr>
                <td colspan="7" style="margin: 0px; padding: 0px; border-top: 1px solid rgb(227, 227, 227); font-weight: bold; color: rgb(85, 85, 85);">
                    <div class="tb-right" style="padding: 25px 20px 25px 0px; text-align: center; background: rgb(250, 250, 250);"><span style="font-weight: normal; font-size: 18px">총 구매금액 : </span>&nbsp;&nbsp;<strong style="color: rgb(244, 56, 55); font-size: 18px;"><c:out value="${getList.b_Price}"/>원</strong></div>
                </td>
            </tr>
            </c:forEach>
        </tfoot>
        <tbody>
    </table>
</div>
<div class="delivery" style="margin-top: 20px; text-align: center; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif, &quot;Nanum Gothic&quot;, nanumgothic, AppleGothic, Helvetica, sans-serif; font-size: 18px;">50,000원 미만의 주문은 배송료를 청구합니다.</div>
<div class="btn-order-ctrl" style="margin-top: 20px; text-align: center; font-size: 0px; line-height: 0; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif, &quot;Nanum Gothic&quot;, nanumgothic, AppleGothic, Helvetica, sans-serif;"><a class="a_btn red w120" onClick="location.href='buy2.html'" style="font-size: 18px; line-height: 1.25; color: rgb(255, 255, 255); font-family: 나눔고딕; vertical-align: middle; width: 120px; display: inline-block; padding: 6px 0px 5px; background: rgb(43, 40, 40); border-bottom: 0px solid rgb(198, 73, 71); margin-right: 10px;">상품 주문하기</a></div>
<div style="color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif, &quot;Nanum Gothic&quot;, nanumgothic, AppleGothic, Helvetica, sans-serif; font-size: 12px; margin-top: 10px; text-align: center;"></div>
<p><br></p>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>