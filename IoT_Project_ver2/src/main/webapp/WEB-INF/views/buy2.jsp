<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>    


<%@ include file="/WEB-INF/views/include/header.jsp"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>





<p>
</p>
<center>
<h2 class="s_title" style="box-sizing: border-box; width: 900px; margin: 0px; padding: 55px 0px; font-family: &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, &quot;맑은 고딕&quot;, Dotum, 돋움, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; line-height: 0.82069em; color: rgb(34, 34, 34); font-size: 1.4em; position: relative; max-height: 42px; text-align: center; letter-spacing: -0.3px; background-color:rgb(246, 231, 250); ">주문서 작성</h2>
<div class="form-tbl-new" style="box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border-bottom: 1px solid rgb(208, 208, 208); display: inline-block; width: 900px; color: rgb(34, 34, 34); font-family: &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, &quot;맑은 고딕&quot;, Dotum, 돋움, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; letter-spacing: -0.3px; ">
	<h4 style="box-sizing: border-box; margin: 0px; padding: 0px; font-family: inherit; line-height: 3; color: inherit; font-size: 17px; text-indent: 15px; border-bottom: 1px solid rgb(212, 212, 212); height: 51px; letter-spacing: -1.2px; clear: both;">주문상품 내역</h4>
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
            
            <c:choose>
        	<c:when test="${list3!=null}">
              	<c:forEach items="${list3}" var="getList3">
			   
	            <tr>
	            	<td></td>
	            	<td id="b_Image" name="b_Image" background-image: none;><img src="/img/<c:out value="${getList3.b_Image}"/>" width="100px" height="80px"/></td>
	            	<td id="b_Name" name="b_Name" style="margin: 0px; padding: 18px 10px; font-size: 18px; background-image: none;"><c:out value="${getList3.b_Name}"/></td>
	            	
	            	<td id="b_Bonus" name="b_Bonus" style="margin: 0px; padding: 18px 10px; font-size: 18px; background-image: none;"><c:out value="${getList3.b_Bonus}"/></td>
	            	<td id="b_Price" name="b_Price" style="margin: 0px; padding: 18px 10px; font-size: 18px; background-image: none;"><c:out value="${getList3.b_Price}"/></td>
	                
	            </tr>
           		</c:forEach>
            </c:when>
            <c:otherwise>
            <tr>
            	<td colspan="5"><h4 align="center">장바구니가 비어있습니다.</h4></td>
            </tr>
            </c:otherwise>
            
            </c:choose>
           
            <tr class="nbg blind" style="z-index: -1; position: absolute; display: block; left: 0px; top: 0px; overflow: hidden; visibility: hidden; width: 0px; height: 0px; text-indent: -9999px;">
                <td colspan="9" style="height:0px; margin: 0px; padding: 18px 0px; font-size: 11px; border-top: 1px solid rgb(227, 227, 227); background-image: none;">
                    <div id="567078_1" class="tb-left tb-opt" style="padding: 0px 10px 0px 62px;"><img src="file:///C:/Users/KTE/Desktop/bbbbbbbbbbbbbbbbb/%EC%9E%A5%EB%B0%94%EA%B5%AC%EB%8B%881_files/basket_option.gif" alt="옵션" title="옵션" style="border: 0px none; vertical-align: middle;"></div>
                </td>
            </tr>
            </tbody>
        </table>
	</div>

</div>

<form name="frmOrderForm" action="/buy2" id="frmOrderForm" method="post" style="box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, &quot;맑은 고딕&quot;, Dotum, 돋움, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; letter-spacing: -0.3px; ">
	<div class="form-tbl-new" style="box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border-bottom: 1px solid rgb(208, 208, 208); background: rgb(255, 255, 255); display: inline-block; width: 900px;">

	</div>
	&nbsp;
	<div class="form-tbl-new" style="box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border-bottom: 1px solid rgb(208, 208, 208); background: rgb(255, 255, 255); display: inline-block; width: 900px;">
		<h4 style="box-sizing: border-box; margin: 0px; padding: 0px; font-family: inherit; line-height: 3; color: inherit; font-size: 17px; text-indent: 15px; border-bottom: 1px solid rgb(212, 212, 212); height: 51px; letter-spacing: -1.2px; clear: both;">받으시는 분 정보
		<div style="box-sizing: border-box; margin: 0px; padding: 0px; display: inline;">
			
		</div>
		</h4>
		<table summary="주문자정보" class="table table-bordered __se_tbl_ext" style="margin: 0px; padding: 0px; border-collapse: collapse; border-spacing: 0px; background-color: transparent; width: 900px; max-width: 100%; border-top: none;">
		<colgroup style="box-sizing: border-box; margin: 0px; padding: 0px;"><col width="16.66666667%" style="box-sizing: border-box; margin: 0px; padding: 0px;"><col style="box-sizing: border-box; margin: 0px; padding: 0px;"></colgroup>
		<tbody style="box-sizing: border-box; margin: 0px; padding: 0px; border-top: none;">
		<tr style="box-sizing: border-box; margin: 0px; padding: 0px;">
			<th scope="row" class="fw-nor bdtop-0" style="box-sizing: border-box; background-color:rgb(246, 231, 250); margin: 0px; padding: 8px 10px 8px 15px; text-align: left; vertical-align: middle; border-top: none; border-bottom: 1px solid rgb(240, 241, 245); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; height: 52px; font-size: 15px !important;">
				<span class="compulsory" style="box-sizing: border-box; margin: 0px; padding: 0px;">수령자명</span>
			</th>
			<td class="bdtop-0" style="box-sizing: border-box; background-color:rgb(246, 231, 250); margin: 0px; padding: 8px 10px; vertical-align: middle; border-top: none; border-bottom: 1px solid rgb(240, 241, 245); height: 52px; font-size: 15px !important;">
				<input type="text" id="bName" class="w-half" name="bName" value="" placeholder="이름*" tabindex="5" style="box-sizing: border-box; margin: 0px; padding: 0px 8px; font-style: inherit; font-variant: inherit; font-weight: normal; font-stretch: inherit; line-height: 26px; font-family: inherit; display: block; width: 365px; height: 42px; background: none rgb(255, 255, 255); appearance: none; border-radius: 0px; font-size: 15px !important; color: rgb(34, 34, 34) !important; border-width: 1px !important; border-style: solid !important; border-color: rgb(240, 241, 245) !important;">
			</td>
		</tr>
		<tr style="box-sizing: border-box; background-color:rgb(246, 231, 250); margin: 0px; padding: 0px;">
			<th scope="row" class="fw-nor" style="box-sizing: border-box; background-color:rgb(246, 231, 250); margin: 0px; padding: 8px 10px 8px 15px; text-align: left; vertical-align: middle; border-top: 1px solid rgb(221, 221, 221); border-bottom: 1px solid rgb(240, 241, 245); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; height: 52px; font-size: 15px !important;">
				<span class="compulsory" style="box-sizing: border-box; margin: 0px; padding: 0px;">휴대폰번호</span>
			</th>
			<td style="box-sizing: border-box; background-color:rgb(246, 231, 250); margin: 0px; padding: 8px 10px; vertical-align: middle; border-top: 1px solid rgb(221, 221, 221); border-bottom: 1px solid rgb(240, 241, 245); height: 52px; font-size: 15px !important;">
				<input type="tel" id="bPhone" class="w-half number-check" name="bPhone" value="" placeholder="휴대폰번호*" tabindex="6" style="box-sizing: border-box; margin: 0px; padding: 0px 8px; font-style: inherit; font-variant: inherit; font-weight: normal; font-stretch: inherit; line-height: 26px; font-family: inherit; display: block; width: 365px; height: 42px; background: none rgb(255, 255, 255); appearance: none; border-radius: 0px; font-size: 15px !important; color: rgb(34, 34, 34) !important; border-width: 1px !important; border-style: solid !important; border-color: rgb(240, 241, 245) !important;">
			</td>
		</tr>
		<tr style="box-sizing: border-box; margin: 0px; padding: 0px;">
			<th scope="row" class="fw-nor" style="box-sizing: border-box; background-color:rgb(246, 231, 250); margin: 0px; padding: 8px 10px 8px 15px; text-align: left; vertical-align: middle; border-top: 1px solid rgb(221, 221, 221); border-bottom: 1px solid rgb(240, 241, 245); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; height: 52px; font-size: 15px !important;">
				연락처
			</th>
			<td style="box-sizing: border-box; background-color:rgb(246, 231, 250); margin: 0px; padding: 8px 10px; vertical-align: middle; border-top: 1px solid rgb(221, 221, 221); border-bottom: 1px solid rgb(240, 241, 245); height: 52px; font-size: 15px !important;">
				<input type="tel" id="bPhone2" class="w-half number-check" name="bPhone2" value="" placeholder="연락처" tabindex="7" style="box-sizing: border-box; margin: 0px; padding: 0px 8px; font-style: inherit; font-variant: inherit; font-weight: normal; font-stretch: inherit; line-height: 26px; font-family: inherit; display: block; width: 365px; height: 42px; background: none rgb(255, 255, 255); appearance: none; border-radius: 0px; font-size: 15px !important; color: rgb(34, 34, 34) !important; border-width: 1px !important; border-style: solid !important; border-color: rgb(240, 241, 245) !important;">
			</td>
		</tr>
		<tr style="box-sizing: border-box; margin: 0px; padding: 0px;">
			<th scope="row" class="fw-nor" style="box-sizing: border-box; background-color:rgb(246, 231, 250); margin: 0px; padding: 8px 10px 8px 15px; text-align: left; vertical-align: middle; border-top: 1px solid rgb(221, 221, 221); border-bottom: 1px solid rgb(240, 241, 245); background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; height: 52px; font-size: 15px !important;">
				<span class="compulsory" style="box-sizing: border-box; margin: 0px; padding: 0px;">수령주소</span>
			</th>
			<td style="box-sizing: border-box; background-color:rgb(246, 231, 250); margin: 0px; padding: 8px 10px; vertical-align: middle; border-top: 1px solid rgb(221, 221, 221); border-bottom: 1px solid rgb(240, 241, 245); height: 52px; font-size: 15px !important;">
				<div class="form-inline" style="box-sizing: border-box; margin: 0px; padding: 0px; font-size: 0px;">
					<div class="form-group" style="box-sizing: border-box; margin: 0px 0px 8px; padding: 0px; display: inline-block; vertical-align: middle;">
						<input type="text" id="B_NUMBER" class="zipinp searchAddr" name="B_NUMBER" value="" readonly="" placeholder="우편번호" tabindex="8" style="box-sizing: border-box; margin: 0px; padding: 0px 8px; font-style: inherit; font-variant: inherit; font-weight: normal; font-stretch: inherit; line-height: 26px; font-family: inherit; width: 215px; height: 42px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; appearance: none; border-radius: 0px; opacity: 1; vertical-align: middle; cursor: pointer; font-size: 15px !important; color: rgb(34, 34, 34) !important; border-width: 1px !important; border-style: solid !important; border-color: rgb(240, 241, 245) !important;"><button type="button" class="btn-adress searchAddr" style="box-sizing: border-box; margin: 0px; padding: 0px 9px; font-size: 15px; background: url('/img/icon_search_mobile_wh.png') center center / 18px no-repeat rgb(136, 136, 136); border-top: 1px solid rgb(136, 136, 136); border-right: 1px solid rgb(136, 136, 136); border-bottom: 1px solid rgb(136, 136, 136); border-left: none; height: 42px; line-height: 30px; display: inline-block; width: 150px; border-image: initial; vertical-align: middle; cursor: pointer; color: rgb(255, 255, 255) !important;">우편번호 찾기</button>
					</div>
				</div>
				<input type="text" id="recvAddr1" class="w-half searchAddr" name="recvAddr1" value="" readonly="" placeholder="기본주소" tabindex="9" style="box-sizing: border-box; margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px 8px; font-style: inherit; font-variant: inherit; font-weight: normal; font-stretch: inherit; line-height: 26px; font-family: inherit; display: block; width: 365px; height: 42px; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; appearance: none; border-radius: 0px; opacity: 1; cursor: pointer; margin-bottom: 10px !important; font-size: 15px !important; color: rgb(34, 34, 34) !important; border-width: 1px !important; border-style: solid !important; border-color: rgb(240, 241, 245) !important;"><input type="text" id="bAdress" class="w-half" name="bAdress" value="" placeholder="나머지주소*" tabindex="10" style="box-sizing: border-box; margin: 0px; padding: 0px 8px; font-style: inherit; font-variant: inherit; font-weight: normal; font-stretch: inherit; line-height: 26px; font-family: inherit; display: block; width: 365px; height: 42px; background: none rgb(255, 255, 255); appearance: none; border-radius: 0px; font-size: 15px !important; color: rgb(34, 34, 34) !important; border-width: 1px !important; border-style: solid !important; border-color: rgb(240, 241, 245) !important;">
				<div id="recvAddrNotice" style="box-sizing: border-box; margin: 0px; padding: 0px;">
				</div>
			</td>
		</tr>
		<tr style="box-sizing: border-box; margin: 0px; padding: 0px;">
			<th scope="row" class="fw-nor" style="box-sizing: border-box; background-color:rgb(246, 231, 250); margin: 0px; padding: 8px 10px 8px 15px; text-align: left; vertical-align: middle; border-top: 1px solid rgb(221, 221, 221); border-bottom: none; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; height: 52px; font-size: 15px !important;">
				배송 시 요청사항
			</th>
			<td style="box-sizing: border-box; background-color:rgb(246, 231, 250); margin: 0px; padding: 8px 10px; vertical-align: middle; border-top: 1px solid rgb(221, 221, 221); border-bottom: none; height: 52px; font-size: 15px !important;">
				<textarea name="bYo" cols="30" rows="2" id="bYo" class="w-pull text-box" placeholder="배송시 요청사항을 입력하세요." tabindex="11" style="box-sizing: border-box; margin: 0px; padding: 8px; font-family: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: 15px; line-height: inherit; color: rgb(34, 34, 34); overflow: auto; border-color: rgb(240, 241, 245); width: 730.016px; height: 42px; appearance: none; border-radius: 0px; resize: none; vertical-align: middle;"></textarea>
			</td>
		</tr>
		</tbody>
		</table>
	</div>
	

	<div class="form-tbl-new" style="box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border-bottom: 1px solid rgb(208, 208, 208); background: rgb(255, 255, 255); display: inline-block; width: 900px;">
		<h4 style="box-sizing: border-box; margin: 0px; padding: 0px; font-family: inherit; line-height: 2.6; color: inherit; font-size: 20px; text-indent: 15px; border-bottom: 1px solid rgb(212, 212, 212); height: 51px; letter-spacing: -1.2px; clear: both;">결제 정보</h4>
		<div class="payment-heading clearfix" style="box-sizing: border-box; text-align:center; margin: 0px; padding: 5px; border: 0px; background: none;">
			
			
			<div class="radio pull-left ps_none ico-card" style="box-sizing: border-box; margin: 5px; text-align: center; padding: 0px; position: relative; text-align: center; width: 286.578px; float: left !important;">
				<label class="check-new-pay w100-new" tabindex="15" style="box-sizing: border-box; background-color:rgb(246, 231, 250); margin: 0px; padding: 0px; display: inline-block; max-width: 100%; width: 286.578px; outline: none; min-height: 20px; cursor: pointer; line-height: 22px;"><span style="box-sizing: border-box; margin: 0px; padding: 25px 0px; background-image: url(&quot;/img/icon_pay_02.png&quot;); background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: initial; text-indent: 27px; display: inline-block; font-size: 18px; font-weight: bold; border: 1px solid rgb(34, 34, 34); width: 286.578px; cursor: pointer; line-height: 20px; background-position: 88px 27px !important;">신용카드</span></label>
			</div>
			<div class="radio pull-left ps_none ico-card" style="box-sizing: border-box; margin: 5px; text-align: center; padding: 0px; position: relative; text-align: center; width: 286.578px; float: left !important;">
				<label class="check-new-pay w100-new" tabindex="15" style="box-sizing: border-box; background-color:rgb(246, 231, 250); margin: 0px; padding: 0px; display: inline-block; max-width: 100%; width: 286.578px; outline: none; min-height: 20px; cursor: pointer; line-height: 22px;"><span style="box-sizing: border-box; margin: 0px; padding: 25px 0px; background-image: url(&quot;/img/icon_pay_02.png&quot;); background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: initial; text-indent: 27px; display: inline-block; font-size: 18px; font-weight: bold; border: 1px solid rgb(34, 34, 34); width: 286.578px; cursor: pointer; line-height: 20px; background-position: 88px 27px !important;">계좌이체</span></label>
			</div>
			<div class="radio pull-left ps_none ico-card" style="box-sizing: border-box; margin: 5px; text-align: center; padding: 0px; position: relative; text-align: center; width: 286.578px; float: left !important;">
				<label class="check-new-pay w100-new" tabindex="15" style="box-sizing: border-box; background-color:rgb(246, 231, 250); margin: 0px; padding: 0px; display: inline-block; max-width: 100%; width: 286.578px; outline: none; min-height: 20px; cursor: pointer; line-height: 22px;"><span style="box-sizing: border-box; margin: 0px; padding: 25px 0px; background-image: url(&quot;/img/icon_pay_02.png&quot;); background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; background-color: initial; text-indent: 27px; display: inline-block; font-size: 18px; font-weight: bold; border: 1px solid rgb(34, 34, 34); width: 286.578px; cursor: pointer; line-height: 20px; background-position: 88px 27px !important;">무통장입금</span></label>
			</div>
		</div>
		
		
		<div class="naverPayGuideDiv" id="naverPayGuideDiv" style="box-sizing: border-box; margin: 0px; padding: 0px;">
			<div class="stit-area" style="box-sizing: border-box; margin: 0px; padding: 5px 0px 0px; border-top: 1px solid rgb(240, 241, 245); font-size: 15px; line-height: 52px; letter-spacing: -0.5px;">
				<div class="help-block txt-info" style="box-sizing: border-box; margin: 5px 0px 0px; padding: 5px 0px 5px; color: rgb(136, 136, 136); font-size: 13px; line-height: 21px;">
					<p style="box-sizing: border-box; padding-right: 25px; padding-left: 20px;">
						주문 변경 시 카드사 혜택 및 할부 적용 여부는 해당 카드사 정책에 따라 변경될 수 있습니다.
					</p>
					
				</div>
			</div>
		</div>
	</div>
	&nbsp;
	<p>
	<button type="submit" onclick="javascript:btn()" style="color: rgb(34, 34, 34); font-family: &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, &quot;맑은 고딕&quot;, Dotum, 돋움, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: -0.3px; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(242, 244, 247); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none; font-family: &quot;Apple SD Gothic Neo&quot;, &quot;Malgun Gothic&quot;, &quot;맑은 고딕&quot;, Dotum, 돋움, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; letter-spacing: -0.3px; text-align: center; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; margin-left: 0px; padding: 12px 0px; font-size: 18px; background: rgb(243, 80, 78); display: inline-block; font-weight: bold; border: 1px solid rgb(211, 50, 48); width: 200px; cursor: pointer; color: rgb(255, 255, 255) !important;">
	결제하기</button><br>
	</p>
</form>
</center>

<script> 

	function btn(){ 
		alert('결제완료');
		frmOrderForm.submit();
	} 
	
</script>




<%@ include file="/WEB-INF/views/include/footer.jsp"%>