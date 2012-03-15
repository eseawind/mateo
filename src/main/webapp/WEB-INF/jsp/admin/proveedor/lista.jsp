<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <title><s:message code="proveedor.lista.label" /></title>
    </head>
    <body>
        <jsp:include page="../menu.jsp" >
            <jsp:param name="menu" value="proveedor" />
        </jsp:include>

        <h1><s:message code="proveedor.lista.label" /></h1>
        <hr/>

        <form name="filtraLista" class="form-search" method="post" action="<c:url value='/admin/proveedor' />">
            <input type="hidden" name="pagina" id="pagina" value="${pagina}" />
            <input type="hidden" name="tipo" id="tipo" value="" />
            <input type="hidden" name="correo" id="correo" value="" />
            <input type="hidden" name="order" id="order" value="${param.order}" />
            <input type="hidden" name="sort" id="sort" value="${param.sort}" />
            <p class="well">
                <a class="btn btn-primary" href="<s:url value='/admin/proveedor/nuevo'/>"><i class="icon-user icon-white"></i> <s:message code='proveedor.nuevo.label' /></a>
                <input name="filtro" type="text" class="input-medium search-query" value="${param.filtro}">
                <button type="submit" class="btn"><i class="icon-search"></i> <s:message code="buscar.label" /></button>
            </p>
            <c:if test="${not empty message}">
                <div class="alert alert-block alert-success fade in" role="status">
                    <a class="close" data-dismiss="alert">×</a>
                    <s:message code="${message}" arguments="${messageAttrs}" />
                </div>
            </c:if>
            <c:if test="${proveedor != null}">
                <s:bind path="proveedor.*">
                    <c:if test="${not empty status.errorMessages}">
                    <div class="alert alert-block alert-error fade in" role="status">
                        <a class="close" data-dismiss="alert">×</a>
                        <c:forEach var="error" items="${status.errorMessages}">
                            <c:out value="${error}" escapeXml="false"/><br />
                        </c:forEach>
                    </div>
                    </c:if>
                </s:bind>
            </c:if>
            
            <table id="lista" class="table table-striped">
                <thead>
                    <tr>
                        <th>
                            <a href="javascript:ordena('nombre');">
                                <s:message code="nombre.label" />
                                <c:choose>
                                    <c:when test="${param.order == 'nombre' && param.sort == 'asc'}">
                                        <i class="icon-chevron-up"></i>
                                    </c:when>
                                    <c:when test="${param.order == 'nombre' && param.sort == 'desc'}">
                                        <i class="icon-chevron-down"></i>
                                    </c:when>
                                </c:choose>
                            </a>
                        </th>
                        <th>
                            <a href="javascript:ordena('nombreCompleto');">
                                <s:message code="nombreCompleto.label" />
                                <c:choose>
                                    <c:when test="${param.order == 'nombreCompleto' && param.sort == 'asc'}">
                                        <i class="icon-chevron-up"></i>
                                    </c:when>
                                    <c:when test="${param.order == 'nombreCompleto' && param.sort == 'desc'}">
                                        <i class="icon-chevron-down"></i>
                                    </c:when>
                                </c:choose>
                            </a>
                        </th>
                        <th>
                            <a href="javascript:ordena('rfc');">
                                <s:message code="rfc.label" />
                                <c:choose>
                                    <c:when test="${param.order == 'rfc' && param.sort == 'asc'}">
                                        <i class="icon-chevron-up"></i>
                                    </c:when>
                                    <c:when test="${param.order == 'rfc' && param.sort == 'desc'}">
                                        <i class="icon-chevron-down"></i>
                                    </c:when>
                                </c:choose>
                            </a>
                        </th>
                        <th>
                            <a href="javascript:ordena('telefono');">
                                <s:message code="telefono.label" />
                                <c:choose>
                                    <c:when test="${param.order == 'telefono' && param.sort == 'asc'}">
                                        <i class="icon-chevron-up"></i>
                                    </c:when>
                                    <c:when test="${param.order == 'telefono' && param.sort == 'desc'}">
                                        <i class="icon-chevron-down"></i>
                                    </c:when>
                                </c:choose>
                            </a>
                        </th>
                        <th>
                            <a href="javascript:ordena('contacto');">
                                <s:message code="contacto.label" />
                                <c:choose>
                                    <c:when test="${param.order == 'contacto' && param.sort == 'asc'}">
                                        <i class="icon-chevron-up"></i>
                                    </c:when>
                                    <c:when test="${param.order == 'contacto' && param.sort == 'desc'}">
                                        <i class="icon-chevron-down"></i>
                                    </c:when>
                                </c:choose>
                            </a>
                        </th>
                        <th>
                            <a href="javascript:ordena('correo');">
                                <s:message code="correo.label" />
                                <c:choose>
                                    <c:when test="${param.order == 'correo' && param.sort == 'asc'}">
                                        <i class="icon-chevron-up"></i>
                                    </c:when>
                                    <c:when test="${param.order == 'correo' && param.sort == 'desc'}">
                                        <i class="icon-chevron-down"></i>
                                    </c:when>
                                </c:choose>
                            </a>
                        </th>
                        <th><s:message code="empresa.label" /></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${proveedores}" var="proveedor" varStatus="status">
                        <tr class="${status.index % 2 == 0 ? 'even' : 'odd'}">
                            <td><a href="<c:url value='/admin/proveedor/ver/${proveedor.id}' />">${proveedor.nombre}</a></td>
                            <td>${proveedor.nombreCompleto}</td>
                            <td>${proveedor.rfc}</td>
                            <td>${proveedor.telefono}</td>
                            <td>${proveedor.contacto}</td>
                            <td>${proveedor.correo}</td>
                            <td>${proveedor.empresa.nombre}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <jsp:include page="/WEB-INF/jsp/paginacion.jsp" />
        </form>        
        <content>
            <script src="<c:url value='/js/lista.js' />"></script>
        </content>
    </body>
</html>
