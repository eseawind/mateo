<%-- 
    Document   : nuevo
    Created on : Mar 07, 2013, 10:37:52 AM
    Author     : osoto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <title><s:message code="pedidoColportor.nuevo.label" /></title>
    </head>
    <body>
        <jsp:include page="../menu.jsp" >
            <jsp:param name="menu" value="pedidoColportor" />
        </jsp:include>

        <div id="nuevo-pedidoColportor" class="content scaffold-list" role="main">
            <h1><s:message code="pedidoColportor.nuevo.label" /></h1>
            <p class="well">
                <a class="btn btn-primary" href="<s:url value='/colportaje/ventas/pedidos'/>"><i class="icon-list icon-white"></i>
                    <s:message code='pedidoColportor.lista.label' /></a>
            </p>
            <form:form commandName="pedidoColportor" action="crea" method="post">
                <form:errors path="*">
                    <div class="alert alert-block alert-error fade in" role="status">
                        <a class="close" data-dismiss="alert">×</a>
                        <c:forEach items="${messages}" var="message">
                            <p>${message}</p>
                        </c:forEach>
                    </div>
                </form:errors>

                <fieldset>
                    <s:bind path="pedidoColportor.numPedido">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="numPedido">
                                <s:message code="numPedido.label" />
                                <span class="required-indicator">*</span>
                            </label>
                            <form:input path="numPedido" maxlength="15" required="true" />
                            <form:errors path="numPedido" cssClass="alert alert-error" />
                        </div>
                    </s:bind>
                    <s:bind path="pedidoColportor.lugar">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="lugar">
                                <s:message code="lugar.label" />
                                <span class="required-indicator">*</span>
                            </label>
                            <form:input path="lugar" maxlength="120" required="true" />
                            <form:errors path="lugar" cssClass="alert alert-error" />
                        </div>
                    </s:bind>
                    <s:bind path="pedidoColportor.cliente">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="cliente">
                                <s:message code="cliente.label" />
                                <span class="required-indicator">*</span>
                            </label>
                            <form:select id="cliente.id" path="cliente.id" required="true" >
                                <form:options items="${clienteColportores}" itemValue="id" itemLabel="nombreCompleto" />
                            </form:select>
                            <form:errors path="cliente" cssClass="alert alert-error" />
                        </div>
                    </s:bind>
                    <s:bind path="pedidoColportor.fecha">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="fecha">
                                <s:message code="fecha.label" />
                                <span class="required-indicator">*</span>
                            </label>
                            <form:input path="fecha" maxlength="15" required="true" />
                            <form:errors path="fecha" cssClass="alert alert-error" />
                        </div>
                    </s:bind>
                    <s:bind path="pedidoColportor.razonSocial">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="razonSocial">
                                <s:message code="razonSocial.label" />
                                <span class="required-indicator">*</span>
                            </label>
                            <form:input path="razonSocial" maxlength="120" required="true" />
                            <form:errors path="razonSocial" cssClass="alert alert-error" />
                        </div>
                    </s:bind>
                    <s:bind path="pedidoColportor.observaciones">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="observaciones">
                                <s:message code="observaciones.label" />
                                <span class="required-indicator">*</span>
                            </label>
                            <form:input path="observaciones" maxlength="250" required="true" />
                            <form:errors path="observaciones" cssClass="alert alert-error" />
                        </div>
                    </s:bind>
                    
                </fieldset>

                <p class="well" style="margin-top: 10px;">
                    <button type="submit" name="crearBtn" class="btn btn-primary btn-large" id="crear" ><i class="icon-ok icon-white"></i>&nbsp;<s:message code='crear.button'/></button>
                    <a class="btn btn-large" href="<s:url value='/colportaje/ventas/pedidos'/>"><i class="icon-remove"></i> <s:message code='cancelar.button' /></a>
                </p>
            </form:form>
        </div>
    </body>
</html>
