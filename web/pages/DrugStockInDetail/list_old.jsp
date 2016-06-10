<%@page import="com.dispensary.project.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags/simpletable" prefix="simpletable"%>
<%@ include file="/commons/taglibs.jsp" %>

<rapid:override name="head">
	<title><%=DrugStockInDetail.TABLE_ALIAS%> 维护</title>
	
	<link href="<c:url value="/widgets/simpletable/simpletable.css"/>" type="text/css" rel="stylesheet">
	<link href="<c:url value="/styles/style.css"/>" type="text/css" rel="stylesheet">
	<script type="text/javascript" src="<c:url value="/widgets/simpletable/simpletable.js"/>"></script>
	
	<script type="text/javascript" >
		$(document).ready(function() {
			// 分页需要依赖的初始化动作
			window.simpleTable = new SimpleTable('queryForm',${page.thisPageNumber},${page.pageSize},'${pageRequest.sortColumns}');
		});
	</script>
</rapid:override>

<rapid:override name="content">
	<form id="queryForm" name="queryForm" action="<c:url value="/pages/DrugStockInDetail/list.do"/>" method="post" style="display: inline;">
	<div class="queryPanel">
		<fieldset>
			<legend>搜索</legend>
			<table>
				<tr>	
					<td class="tdLabel"><%=DrugStockInDetail.ALIAS_STOCK_IN_ID%></td>		
					<td>
						<input type="text" value="${query.stockInId}" id="stockInId" name="stockInId" maxlength="20"  class=""/>
					</td>
					<td class="tdLabel"><%=DrugStockInDetail.ALIAS_SERIAL_NUMBER%></td>		
					<td>
							<input type="text" value="${query.serialNumberModelTag}" id="serialNumberModelTag" name="serialNumberModelTag"/>
					</td>
					<td class="tdLabel"><%=DrugStockInDetail.ALIAS_DRUG_ID%></td>		
					<td>
							<input type="text" value="${query.drugIdModelTag}" id="drugIdModelTag" name="drugIdModelTag"/>
					</td>
					<td class="tdLabel"><%=DrugStockInDetail.ALIAS_IN_PLACE_ID%></td>		
					<td>
							<input type="text" value="${query.inPlaceIdModelTag}" id="inPlaceIdModelTag" name="inPlaceIdModelTag"/>
					</td>
				</tr>	
				<tr>	
					<td class="tdLabel"><%=DrugStockInDetail.ALIAS_IN_PRICE%></td>		
					<td>
						<input type="text" value="${query.inPrice}" id="inPrice" name="inPrice" maxlength="10"  class="validate-integer "/>
					</td>
					<td class="tdLabel"><%=DrugStockInDetail.ALIAS_IN_DATE%></td>		
					<td>
						<input type="text" value="${query.inDate}" id="inDate" name="inDate" maxlength="20"  class=""/>
					</td>
					<td class="tdLabel"><%=DrugStockInDetail.ALIAS_IN_STOCKS%></td>		
					<td>
						<input type="text" value="${query.inStocks}" id="inStocks" name="inStocks" maxlength="5"  class="validate-number "/>
					</td>
				</tr>	
			</table>
		</fieldset>
		<div class="handleControl">
			<input type="submit" class="stdButton" style="width:80px" value="查询" onclick="getReferenceForm(this).action='${ctx}/pages/DrugStockInDetail/list.do'"/>
			<input type="submit" class="stdButton" style="width:80px" value="新增" onclick="getReferenceForm(this).action='${ctx}/pages/DrugStockInDetail/create.do'"/>
			<input type="button" class="stdButton" style="width:80px" value="删除" onclick="batchDelete('${ctx}/pages/DrugStockInDetail/delete.do','items',document.forms.queryForm)"/>
		</div>
	</div>
	
	<div class="gridTable">
	
		<simpletable:pageToolbar page="${page}">
		<s:property value="@com.dispensary.project.model.DrugStockInDetail@TABLE_ALIAS"/>列表
		</simpletable:pageToolbar>
	
		<table width="100%"  border="0" cellspacing="0" class="tablelist">
		  <thead>
			  
			  <tr>
				<th style="width:50px;"> </th>
				<th style="width:50px;"><input type="checkbox" onclick="setAllCheckboxState('items',this.checked)"></th>
				
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<th sortColumn="Stock_In_ID" ><%=DrugStockInDetail.ALIAS_STOCK_IN_ID%></th>
				<th sortColumn="SerialNumber" ><%=DrugStockInDetail.ALIAS_SERIAL_NUMBER%></th>
				<th sortColumn="DrugID" ><%=DrugStockInDetail.ALIAS_DRUG_ID%></th>
				<th sortColumn="InPlaceID" ><%=DrugStockInDetail.ALIAS_IN_PLACE_ID%></th>
				<th sortColumn="InPrice" ><%=DrugStockInDetail.ALIAS_IN_PRICE%></th>
				<th sortColumn="InDate" ><%=DrugStockInDetail.ALIAS_IN_DATE%></th>
				<th sortColumn="InStocks" ><%=DrugStockInDetail.ALIAS_IN_STOCKS%></th>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="${page.result}" var="item" varStatus="status">
		  	  
			  <tr class="${status.count % 2 == 0 ? 'odd' : 'even'}">
				<td>${page.thisPageFirstElementNumber + status.index}</td>
				<td><input type="checkbox" name="items" value="id=${item.id}&"></td>
				
				<td><c:out value='${item.stockInId}'/>&nbsp;</td>
				<td><c:out value='${item.serialNumberModel.modelTagValue}'/>&nbsp;</td>
				<td><c:out value='${item.drugIdModel.modelTagValue}'/>&nbsp;</td>
				<td><c:out value='${item.inPlaceIdModel.modelTagValue}'/>&nbsp;</td>
				<td><c:out value='${item.inPrice}'/>&nbsp;</td>
				<td><c:out value='${item.inDate}'/>&nbsp;</td>
				<td><c:out value='${item.inStocks}'/>&nbsp;</td>
				<td>
					<a href="${ctx}/pages/DrugStockInDetail/show.do?id=${item.id}&">查看</a>&nbsp;&nbsp;&nbsp;
					<a href="${ctx}/pages/DrugStockInDetail/edit.do?id=${item.id}&">修改</a>
				</td>
			  </tr>
			  
		  	  </c:forEach>
		  </tbody>
		</table>
	
		<simpletable:pageToolbar page="${page}">
		<s:property value="@com.dispensary.project.model.DrugStockInDetail@TABLE_ALIAS"/>列表
		</simpletable:pageToolbar>
	</div>
	</form>
</rapid:override>


<%@ include file="base.jsp" %>

