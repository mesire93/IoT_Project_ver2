<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>    


<%@ include file="/WEB-INF/views/include/header2.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>





<center>

<h1 class="tit-cart" style="margin: 40px 0px 0px;  padding: 30px 0px; text-align: center; font-size: 30px; line-height: 1.25; color: rgb(31, 31, 31); font-family:'Jua'; font-size:3.0em; background-image: url(&quot;bul01.gif&quot;); background-position: 0px 1px; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial;"><i class="fas fa-bullhorn"></i>&nbsp;&nbsp;주문 내역 확인</h1>

<div class="form-tbl-new" style="box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border-bottom: 1px solid rgb(208, 208, 208); display: inline-block; width: 900px; color: rgb(34, 34, 34); font-family: &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, &quot;맑은 고딕&quot;, Dotum, 돋움, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; letter-spacing: -0.3px; ">
	<h4 style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: inherit; line-height: 0.7; color: inherit; font-size: 22px; text-indent: 15px; border-bottom: 1px solid rgb(212, 212, 212); height: 51px; letter-spacing: -1.2px; clear: both;">주문상품 내역</h4>
	<div class="clearfix" style="box-sizing: border-box; margin: 0px; padding: 0px;">
		<table width="900px" height="100px" >
		<tbody>
            <tr>
                <th scope="col" style="margin: 0px; padding: 7px 0px 6px; background-color:rgb(246, 231, 250); font-weight: normal; font-size: 18px;">
                    <div class="tb-center" style="padding: 0px 10px;"></div>
                </th>
                <th scope="col" style="margin: 0px; padding: 7px 0px 6px; background-color:rgb(246, 231, 250); font-weight: normal; font-size: 18px;">
                    <div class="tb-center" style="padding: 0px 10px;">이미지</div>
                </th>
                <th scope="col" style="margin: 0px; padding: 7px 0px 6px; background-color:rgb(246, 231, 250); font-weight: normal; font-size: 18px;">
                    <div class="tb-center" style="padding: 0px 10px;">상품명</div>
                </th>
                <th scope="col" style="margin: 0px; padding: 7px 0px 6px; background-color:rgb(246, 231, 250); font-weight: normal; font-size: 18px;">
                    <div class="tb-center" style="padding: 0px 10px;">적립</div>
                </th>
                <th scope="col" style="margin: 0px; padding: 7px 0px 6px; background-color:rgb(246, 231, 250); font-weight: normal; font-size: 18px;">
                    <div class="tb-center" style="padding: 0px 10px;">가격</div>
                </th>
            </tr>
            
<!-- ========================================================================================================= -->
<!--            - doglist는 장바구니 정보 => 구매페이지에 보여준다 -  -->
           
              	<c:forEach items="${dog2List}" var="dog2List">
			   
	            <tr style="border-bottom: 1px solid rgb(208, 208, 208);">
	            	<td></td>
	            	<td id="b_Image" name="b_Image" background-image: none;><img src="/resources/img/dog/<c:out value="${dog2List.filename}"/>" width="100px" height="80px"/></td>
	            	<td id="b_Name" name="b_Name" style="margin: 0px; padding: 18px 10px; font-size: 18px; background-image: none;"><c:out value="${dog2List.name}"/></td>
	            	
	            	<c:set var="bonus" value="${dog2List.price/100 }" />
	                <fmt:formatNumber var="i" type="number" value="${bonus}" pattern="#,###,###" />
	            	<td id="b_Price" name="b_Price" style="margin: 0px; padding: 18px 10px; font-size: 18px; background-image: none;"><c:out value="${i}"/> 원</td>
	            	<td id="b_Price" name="b_Price" style="margin: 0px; padding: 18px 10px; font-size: 18px; background-image: none;"> <fmt:formatNumber  type="number" value="${dog2List.price}" pattern="#,###,###" /> 원</td>
	                
	            </tr>
           		</c:forEach>
            
            </tbody>
<!-- ========================================================================================================= -->
        </table>
	</div>

</div>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
	<div class="form-tbl-new" style="box-sizing: border-box; margin: 0px 0px 20px; padding: 0px;  background: rgb(255, 255, 255); display: inline-block; width: 900px;">

	</div>
	&nbsp;
	<div class="form-tbl-new" style="box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border-bottom: 1px solid rgb(208, 208, 208); background: rgb(255, 255, 255); display: inline-block; width: 900px;">
		<h4 style="box-sizing: border-box; margin: 0px; padding: 0px; font-family: inherit; line-height: 2; color: inherit; font-size: 22px; text-indent: 15px; border-bottom: 1px solid rgb(212, 212, 212); height: 51px; letter-spacing: -1.2px; clear: both;">받으시는 분 정보
		<div style="box-sizing: border-box; margin: 0px; padding: 0px; display: inline;">
			
		</div>
		</h4>
		<table summary="주문자정보" class="table table-bordered __se_tbl_ext" style="margin: 0px; padding: 0px; border-collapse: collapse; border-spacing: 0px; background-color: transparent; width: 900px; max-width: 100%; border-top: none;">
		
		<colgroup style="box-sizing: border-box; margin: 0px; padding: 0px;"><col width="16.66666667%" style="box-sizing: border-box; margin: 0px; padding: 0px;"><col style="box-sizing: border-box; margin: 0px; padding: 0px;"></colgroup>
		<tbody style="box-sizing: border-box; margin: 0px; padding: 0px; border-top: none;">
		<c:forEach items="${dog3List}" var="dog3List">
		<tr style="box-sizing: border-box; margin: 0px; padding: 0px;">
			<th scope="row" class="fw-nor bdtop-0" style="box-sizing: border-box; background-color:rgb(246, 231, 250); margin: 0px; padding: 8px 10px 8px 15px; text-align: left; vertical-align: middle; border-top: none; border-bottom: 1px solid rgb(240, 241, 245); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; height: 52px; font-size: 15px !important;">
				<span class="compulsory" style="box-sizing: border-box; margin: 0px; padding: 0px;">수령자명</span>
			</th>
			<td>
				<span class="compulsory" style="box-sizing: border-box; margin: 0px; padding: 0px;"><c:out value="${dog3List.b_Name}"/></span>
			</td>
		</tr>
		<tr>
			<th scope="row" class="fw-nor bdtop-0" style="box-sizing: border-box; background-color:rgb(246, 231, 250); margin: 0px; padding: 8px 10px 8px 15px; text-align: left; vertical-align: middle; border-top: none; border-bottom: 1px solid rgb(240, 241, 245); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; height: 52px; font-size: 15px !important;">
				<span class="compulsory" style="box-sizing: border-box; margin: 0px; padding: 0px;">휴대폰번호</span>
			</th>
			<td>
				<span class="compulsory" style="box-sizing: border-box; margin: 0px; padding: 0px;"><c:out value="${dog3List.b_Phone}"/></span>
			</td>
		</tr>
		<tr style="box-sizing: border-box; margin: 0px; padding: 0px;">
			<th scope="row" class="fw-nor" style="box-sizing: border-box; background-color:rgb(246, 231, 250); margin: 0px; padding: 8px 10px 8px 15px; text-align: left; vertical-align: middle; border-top: 1px solid rgb(221, 221, 221); border-bottom: 1px solid rgb(240, 241, 245); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; height: 52px; font-size: 15px !important;">
				연락처
			</th>
			<td>
				<span class="compulsory" style="box-sizing: border-box; margin: 0px; padding: 0px;"><c:out value="${dog3List.b_Phone2}"/></span>
			</td>
		</tr>
		<tr style="box-sizing: border-box; margin: 0px; padding: 0px;">
			<th scope="row" class="fw-nor" style="box-sizing: border-box; background-color:rgb(246, 231, 250); margin: 0px; padding: 8px 10px 8px 15px; text-align: left; vertical-align: middle; border-top: 1px solid rgb(221, 221, 221); border-bottom: 1px solid rgb(240, 241, 245); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; height: 52px; font-size: 15px !important;">
				수령주소
			</th>
			<td>
				<span class="compulsory" style="box-sizing: border-box; margin: 0px; padding: 0px;"><c:out value="${dog3List.b_Addr}"/> <c:out value="${dog3List.b_Adress}"/> (<c:out value="${dog3List.b_Num}"/>)</span>
			</td>
		</tr>
		<tr style="box-sizing: border-box; margin: 0px; padding: 0px;">
			<th scope="row" class="fw-nor" style="box-sizing: border-box; background-color:rgb(246, 231, 250); margin: 0px; padding: 8px 10px 8px 15px; text-align: left; vertical-align: middle; border-top: 1px solid rgb(221, 221, 221); border-bottom: none; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; height: 52px; font-size: 15px !important;">
				배송 시 요청사항
			</th>
			<td>
				<span class="compulsory" style="box-sizing: border-box; margin: 0px; padding: 0px;"><c:out value="${dog3List.b_Yo}"/></span>
			</td>
		</tr>
		</c:forEach>
		</tbody>
		</table>
	</div>

	
	<div>
	<table>
	<c:set var = "total" value = "0" />
	<c:forEach var="dog2List" items="${dog2List}" varStatus="status">     
		<tr>
			<c:set var= "total" value="${total + dog2List.price}"/></c:forEach>
			<td style="font-size: 30px; width:900px; text-align:center; color: red; padding: 0px;" border-bottom: 1px solid rgb(212, 212, 212);">
			총 결제 금액 : <fmt:formatNumber  type="number" value="${total}" pattern="#,###,###" /> 원</td>
		</tr>
        <tr>
        	<td style="font-size: 30px; width:900px; text-align:center; color: red; padding: 0px;" border-bottom: 1px solid rgb(212, 212, 212);">
			보너스 적립금 : <fmt:formatNumber  type="number" value="${total/100}" pattern="#,###,###" /> 원</td>
        </tr>
    </table>
	</div>
	
	&nbsp;
	<p>
	<button type="button" onClick="location.href='dogmain.html'" id="dogorder_ok" style="color: rgb(34, 34, 34); font-family: &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, &quot;맑은 고딕&quot;, Dotum, 돋움, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: -0.3px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(242, 244, 247); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none; font-family: &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, &quot;맑은 고딕&quot;, Dotum, 돋움, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: -0.3px; text-align: center; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding: 12px 0px; font-size: 18px; background: rgb(243, 80, 78); display: inline-block; font-weight: bold; border: 1px solid rgb(211, 50, 48); width: 200px; cursor: pointer; color: rgb(255, 255, 255) !important;">
	메인으로 가기</button><br><br><br>
	</p>

</center>






<%@ include file="/WEB-INF/views/include/footer.jsp"%>