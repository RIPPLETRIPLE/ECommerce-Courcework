<%@include file="/WEB-INF/jsp/includes/standartVariables.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <style>
        <%@include file="/WEB-INF/css/table.css" %>
    </style>
    <title><fmt:message key="main_page" bundle="${bundle}"/></title>
</head>
<body>
<header>
    <%@include file="/WEB-INF/jsp/includes/navbar.jsp" %>
</header>
<main>
    <div class="container my-3">
        <div class="d-flex py-3"><h3 id="totalPrice"><fmt:message key="total_price" bundle="${bundle}"/>:
            <fmt:message key="currency" bundle="${bundle}"/></h3></div>
        <table class="table table-light table-sortable">
            <thead>
            <tr>
                <th class="columnToSort th-sort-asc" scope="col"><fmt:message key="name" bundle="${bundle}"/></th>
                <th class="columnToSort th-sort-asc" scope="col"><fmt:message key="category" bundle="${bundle}"/></th>
                <th class="columnToSort th-sort-asc" scope="col"><fmt:message key="price" bundle="${bundle}"/></th>
                <th scope="col"></th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cart}" var="order">
                <c:choose>
                    <c:when test="${role == 'guest'}">
                        <c:set var="id" value="${order.product.id}"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="id" value="${order.id}"/>
                    </c:otherwise>
                </c:choose>
                <tr>
                    <td>
                            ${order.product.name}
                    </td>
                    <td>
                            ${order.product.category.name}
                    </td>
                    <td class="price">
                            ${pageContext.request.getSession(false).getAttribute("lang") == 'ukr' ? 40 * order.product.price * order.quantity : order.product.price * order.quantity}
                        <fmt:message key="currency" bundle="${bundle}"/>
                    </td>
                    <td>
                        <input type="hidden" name="id" value="${order.product.id}" class="form-input">
                        <div class="form-group d-flex justify-content-between">
                            <form method="post"
                                  action="${pageContext.request.contextPath}/app/${role}/changeProductQuantity?action=increment">
                                <input type="text" name="id" value="${id}" hidden>
                                <button type="submit"
                                        class="quantity-left-minus btn btn-success btn-number">+
                                </button>
                            </form>
                            <input type="text" name="quantity" class="form-control" value="${order.quantity}"
                                   readonly>
                            <form method="post"
                                  action="${pageContext.request.contextPath}/app/${role}/changeProductQuantity?action=decrement">
                                <input type="text" name="id" value="${id}" hidden>
                                <button type="submit"
                                        class="quantity-left-minus btn btn-danger btn-number">-
                                </button>
                            </form>
                        </div>
                    </td>
                    <td>
                        <form method="post"
                              action="${pageContext.request.contextPath}/app/${role}/changeProductQuantity?action=remove">
                            <input type="text" name="id" value="${id}" hidden>
                            <button type="submit"
                                    class="btn btn-sm btn-danger"><fmt:message key="delete"
                                                                               bundle="${bundle}"/></button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <c:if test="${not empty cart}">
            <form class="d-flex justify-content-end" method="post" action="${pageContext.request.contextPath}/app/${role}/buyFromCart">
                <button type="submit"
                        class="btn btn-primary"><fmt:message key="buy"
                                                             bundle="${bundle}"/></button>
            </form>
        </c:if>
    </div>
</main>
</body>
<script>
    <%@include file="/WEB-INF/js/TableScripts.js" %>
</script>
</html>