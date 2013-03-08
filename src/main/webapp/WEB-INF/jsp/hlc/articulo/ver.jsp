<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="../../idioma.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <title><s:message code="articulo.ver.label" /></title>
    </head>
    <body>
        <jsp:include page="../menu.jsp" >
            <jsp:param name="menu" value="articulo" />
        </jsp:include>

        <div id="ver-articulo" class="content scaffold-list" role="main">
            <h1><s:message code="articulo.ver.label" /></h1>

            <p class="well">
                <a class="btn btn-primary" href="<s:url value='/hlc/articulo'/>"><i class="icon-list icon-white"></i> <s:message code='articulo.lista.label' /></a>
                <a class="btn btn-primary" href="<s:url value='/hlc/articulo/nuevo'/>"><i class="icon-file icon-white"></i> <s:message code='articulo.nuevo.label' /></a>
            </p>
            <c:if test="${not empty message}">
                <div class="alert alert-block alert-success fade in" role="status">
                    <a class="close" data-dismiss="alert">×</a>
                    <s:message code="${message}" arguments="${messageAttrs}" />
                </div>
            </c:if>

            <c:url var="eliminaUrl" value="/hlc/articulo/elimina" />
            <form:form commandName="articulo" action="${eliminaUrl}" >
                <form:errors path="*" cssClass="alert alert-error" element="ul" />
                <div class="row-fluid" style="padding-bottom: 10px;">
                    <div class="span4">
                        <h4><s:message code="descripcion.label" /></h4>
                        <h3>${articulo.descripcion}</h3>
                    </div>
                </div>

                <div class="span4">
                    <div>
                        <h4><s:message code="descripcion1.label" /></h4>
                        <h3>${articulo.descripcion1}</h3>
                    </div>
                </div>
                <div class="span4">
                    <div>
                        <h4><s:message code="sustancia.label" /></h4>
                        <h3>${articulo.sustancia}</h3>
                    </div>
                </div>
                <div class="span4">
                    <div>
                        <h4><s:message code="um.label" /></h4>
                        <h3>${articulo.um}</h3>
                    </div>
                </div>
                <div class="span4">
                    <div>
                        <h4><s:message code="gpoProducto.label" /></h4>
                        <h3>${articulo.gpoProducto}</h3>
                    </div>
                </div>

                <p class="well">
                    <a href="<c:url value='/hlc/articulo/edita/${articulo.id}' />" class="btn btn-primary"><i class="icon-edit icon-white"></i> <s:message code="editar.button" /></a>
                    <form:hidden path="id" />
                    <button type="submit" name="eliminaBtn" class="btn btn-danger btn-large" id="eliminar"  onclick="return confirm('<s:message code="confirma.elimina.message" />');" ><i class="icon-trash icon-white"></i>&nbsp;<s:message code='eliminar.button'/></button>
                </p>
            </form:form>
        </div>
    </body>
</html>
