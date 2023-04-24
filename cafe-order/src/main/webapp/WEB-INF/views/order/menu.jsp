<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${root}/resources/css/menu/menu.css">
</head>
<body id="body">
    <div id="container">
        <c:forEach var="kind" items="${kinds}">
	        <h1>${kind.kindName}</h1>
	        <c:forEach var="menu" items="${menuList}">
	        <c:if test="${menu.kindId eq kind.kindId}">
	        <div class="item">
	            <div class="item-img">
	                <img src="${menu.imgPath}" alt="${menu.menuName}">
	            </div>
	            <div class="item-content">
	                	${menu.menuName}
	                <div class="item-temperature-price">
	                	<c:if test="${menu.hotPrice ne 0}">
		                    <div class="hot">${menu.hotPrice}원</div>
	                	</c:if>
	                	<c:if test="${menu.icedPrice ne 0}">
	    	                <div class="iced">${menu.icedPrice}원</div>
	                	</c:if>
	                </div>
	            </div>
	        </div>
	        </c:if>
	        </c:forEach>
	        <hr>
        </c:forEach>
    </div>

    <div id="option-box">
        <button id="close" onclick="toggleModal()">X</button>
        <div id="option-container">
        </div>
    </div>

    <script>
        let itemEl = document.getElementsByClassName('item');
        console.dir(itemEl);
        
        for(let i=0; i<itemEl.length; i++) {
            itemEl[i].addEventListener('click', function(){
                option(this)
            });
        }

        function option(target) {
            //console.dir(target)
            let optionBox = document.getElementById('option-box');
            optionBox.setAttribute('class', 'show');
            
            let optionContain = document.getElementById('option-container')
        
            optionContain.innerHTML = target.innerHTML;
            optionContain.innerHTML += `
                <form id="order-menu" action="order" method="post">
                    <div class="order-menu-opt">
                        <input type="radio" id="hot" name="temperature" value="1"/>
                        <label for="hot" class="hot">HOT</label>
                        &nbsp;&nbsp;&nbsp;
                        <input type="radio" id="ice" name="temperature" value="0" checked/>
                        <label for="ice" class="iced">ICED</label>
                    </div>
                    <div class="order-menu-opt">
                        <input type="checkbox" id="shot" name="shot" value="1" />
                        <label for="shot">샷 추가: 500원</label>
                    </div>
                    <div class="order-menu-opt">
                        <input type="checkbox" id="heizlenut" name="heizlenut" value="1"/>
                        <label for="heizlenut">헤이즐넛 시럽 추가: 500원</label>
                    </div>
                    <div class="order-menu-opt">
                        <input type="checkbox" id="vanilla" name="vanilla" value="1"/>
                        <label for="vanilla">바닐라 시럽 추가: 500원</label>
                    </div>
                    <div>
                        <button>주문하기</button>
                    </div>
                </form>
            `;

            let container = document.getElementById('container');
            container.addEventListener('dblclick', toggleModal);
        }

        function toggleModal() {
            let optionBox = document.getElementById('option-box');
            //console.dir(optionBox.getAttribute('class'));
            //console.log(typeof optionBox.getAttribute('class'));
            if(optionBox.getAttribute('class') == 'show') {
                optionBox.setAttribute('class', '');
            } else {
                optionBox.setAttribute('class', 'show');
            }
        }

    </script>
</body>
</html>