<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
   <head>
        <title><s:message code="empleadoPerded.nuevo.label" /></title>
    </head>
    <body>
        <jsp:include page="../menu.jsp" >
            <jsp:param name="menu" value="empleado" />
        </jsp:include>

        <div id="nuevo-empleadoPerded" class="content scaffold-list" role="main">
            <h1><s:message code="empleadoPerded.nuevo.label" /></h1>
            <p class="well">
                <a class="btn btn-primary" href="<s:url value='/rh/empleado/empleadoPerded/'/>"><i class="icon-list icon-white"></i> <s:message code='empleadoPerded.lista.label' /></a>
            </p>
            <form:form commandName="empleadoPerded" action="graba" method="post">
                <form:errors path="*">
                    <div class="alert alert-block alert-error fade in" role="status">
                        <a class="close" data-dismiss="alert">×</a>
                        <c:forEach items="${messages}" var="message">
                            <p>${message}</p>
                        </c:forEach>
                    </div>
                </form:errors>

                <fieldset>
                    <s:bind path="empleadoPerded.empleado.clave">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="empleado.clave">
                                <s:message code="empleadoPerded.nombre.label" />
                                <span class="required-indicator">*</span>
                            </label>
                            <form:input path="empleado.clave" maxlength="128" required="true" cssClass="span3" />
                            <form:errors path="empleado.clave" cssClass="alert alert-error" />
                        </div>
                    </s:bind>
                    <s:bind path="empleadoPerded.perDed.clave">
                        <div class="control-group <c:if test='${not empty status.errorMessages}'>error</c:if>">
                            <label for="perDed.clave">
                                <s:message code="empleadoPerded.clave.label" />
                                <span class="required-indicator">*</span>
                            </label>
                            <form:input path="perDed.clave" maxlength="6" required="true" cssClass="span3" />
                            <form:errors path="perDed.clave" cssClass="alert alert-error" />
                        </div>
                    </s:bind>
                    
                </fieldset>
                <p class="well" style="margin-top: 10px;">
                    <button type="submit" name="crearBtn" class="btn btn-primary btn-large" id="crear" ><i class="icon-ok icon-white"></i>&nbsp;<s:message code='crear.button'/></button>
                    <a class="btn btn-large" href="<s:url value='/rh/empleado/empleadoPerded'/>"><i class="icon-remove"></i> <s:message code='cancelar.button' /></a>
                </p>
            </form:form>
        </div>
        <content>
            <script>
                $(document).ready(function() {
                    $('input#nombre').focus();
                });
            </script>                    
        </content>
    </body>
</html>
