<!-- #-------------------------------------------------------------------------------
# eGov suite of products aim to improve the internal efficiency,transparency, 
#    accountability and the service delivery of the government  organizations.
# 
#     Copyright (C) <2015>  eGovernments Foundation
# 
#     The updated version of eGov suite of products as by eGovernments Foundation 
#     is available at http://www.egovernments.org
# 
#     This program is free software: you can redistribute it and/or modify
#     it under the terms of the GNU General Public License as published by
#     the Free Software Foundation, either version 3 of the License, or
#     any later version.
# 
#     This program is distributed in the hope that it will be useful,
#     but WITHOUT ANY WARRANTY; without even the implied warranty of
#     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#     GNU General Public License for more details.
# 
#     You should have received a copy of the GNU General Public License
#     along with this program. If not, see http://www.gnu.org/licenses/ or 
#     http://www.gnu.org/licenses/gpl.html .
# 
#     In addition to the terms of the GPL license to be adhered to in using this
#     program, the following additional terms are to be complied with:
# 
# 	1) All versions of this program, verbatim or modified must carry this 
# 	   Legal Notice.
# 
# 	2) Any misrepresentation of the origin of the material is prohibited. It 
# 	   is required that all modified versions of this material be marked in 
# 	   reasonable ways as different from the original version.
# 
# 	3) This license does not grant any rights to any user of the program 
# 	   with regards to rights under trademark law for use of the trade names 
# 	   or trademarks of eGovernments Foundation.
# 
#   In case of any queries, you can reach eGovernments Foundation at contact@egovernments.org.
#------------------------------------------------------------------------------- -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<table class="table table-bordered">

<input type="hidden" id="appforDocumentList"  value="${appforDocumentList}" />
<div class="panel-heading">
<c:if test="${waterConnectionDetails.applicationType.code=='CLOSINGCONNECTION'}">
									<div class="panel-title">
									Closure Connection Documents
									</div>
									</c:if>
								<c:if test="${waterConnectionDetails.applicationType.code=='RECONNECTION'}">
									<div class="panel-title">
									ReConnection Documents
									</div>
									</c:if>
								</div>
<c:if test="${!appforDocumentList.isEmpty()}">
	<thead>
		<tr>
			<th><spring:message code="lbl.slno" /></th>
			<th><spring:message code="lbl.documentname" /></th>
			<th><spring:message code="lbl.documentnumber" /></th>
			<th><spring:message code="lbl.documentdate" /></th>
			<c:if test="${mode!='ack'}">
				<th><spring:message code="lbl.files"/></th>
			</c:if>
		</tr>
	</thead>
	</c:if>
	<c:choose>
		<c:when test="${!appforDocumentList.isEmpty()}">
			<c:forEach items="${appforDocumentList}" var="docs" varStatus="serialNo">
				<tbody>
					<tr>
						<td><c:out value="${serialNo.count}"/></td>
						<td><c:out value="${docs.documentNames.documentName}" /></td>
						<td><c:out value="${docs.documentNumber}" /></td>
						<td><fmt:formatDate pattern="dd/MM/yyyy" value="${docs.documentDate}" var="docsDate"/><c:out value="${docsDate}" /></td>
						<c:if test="${mode!='ack'}">
						<td><c:forEach items="${docs.getSupportDocs()}" var="file">
								<a href="/egi/downloadfile?fileStoreId=${file.fileStoreId}&moduleName=WTMS" target="_blank"> 
								<c:out value="${file.fileName}"/></a>
							</c:forEach>
						</td>
						</c:if>
					</tr>
				</tbody>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div class="col-md-12 col-xs-6  panel-title">No documents found</div>
		</c:otherwise>
	</c:choose>
</table>
