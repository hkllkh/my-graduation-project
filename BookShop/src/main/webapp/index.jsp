
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>商品列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="layer/layer.js"></script>
    <script type="text/javascript" src="js/cart.js"></script>
  <script >
  window.onload = function(){
		
		var oMessageBox = document.getElementById("messageBox");
		var oInput = document.getElementById("myInput");
		var oPostBtn = document.getElementById("doPost");
		
		oPostBtn.onclick = function(){
			if(oInput.value){
				//写入发表留言的时间
				var oTime = document.createElement("div");
				oTime.className = "time";
				var myDate = new  Date();
				oTime.innerHTML = myDate.toLocaleString();
				oMessageBox.appendChild(oTime);
				
				//写入留言内容
				var oMessageContent = document.createElement("div");
				var hr = document.createElement("HR");
				oMessageContent.className = "message_content";
				oMessageContent.innerHTML = oInput.value;
				oInput.value = "";
				oMessageBox.appendChild(oMessageContent);
				oMessageBox.appendChild(hr);
			}
			
		}
		
	}

     </script>     
    
</head>
<body>
<!--header-->
<jsp:include page="/header.jsp">
    <jsp:param name="flag" value="1"></jsp:param>
</jsp:include>

<!--banner-->

<div class="banner">
    <div class="container">
        <h2 class="hdng"><a href="book_detail.action?bid=${scrollBook.bid}">${scrollBook.bname}</a><span></span></h2>
        <p>今日精选推荐</p>
        <a class="banner_a" href="javascript:;" onclick="shou(${scrollBook.bid})">立刻收藏</a>
        <div class="banner-text">
            <a href="book_detail.action?bid=${scrollBook.bid}">
                <img src="${scrollBook.bcover}" alt="${scrollBook.bname}" width="350" height="350">
            </a>
        </div>
    </div>
</div>

<!--//banner-->

<!--gallery-->
<div class="gallery">
    <div class="container">
           <div class="alert alert-info">热销推荐</div>
        <div class="gallery-grids">
            <c:forEach items="${hotList}" var="book">
                <div class="col-md-4 gallery-grid glry-two">
                    <a href="book_detail.action?bid=${book.bid}">
                        <img src="${book.bcover}" class="img-responsive" alt="${book.bname}" width="350" height="350"/>
                    </a>
                    <div class="gallery-info galrr-info-two">
                        <p>
                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                            <a href="book_detail.action?bid=${book.bid}">查看详情</a>
                        </p>
                        <a class="shop" href="javascript:;" onclick="shou(${book.bid})">立刻收藏</a>
                        <a class="shop" href="javascript:;" onclick="buy(${book.bid})">立刻购买</a>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="galy-info">
                        <p> ${book.bname}</p>
                        <div class="galry">
                            <div class="prices">
                                <h5 class="item_price">¥ ${book.bprice}</h5>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        <div class="clearfix"></div>
        <div class="alert alert-info">新品推荐</div>
        <div class="gallery-grids">
            <c:forEach items="${newList}" var="book">
                <div class="col-md-3 gallery-grid ">
                    <a href="book_detail.action?bid=${book.bid}">
                        <img src="${book.bcover}" class="img-responsive" alt="${book.bname}"/>
                    </a>
                    <div class="gallery-info">
                        <p>
                            <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
                            <a href="book_detail.action?bid=${book.bid}">查看详情</a>
                        </p>
                        <a class="shop" href="javascript:;" onclick="shou(${book.bid})">立刻收藏</a>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="galy-info">
                        <p> ${book.bname}</p>
                        <div class="galry">
                            <div class="prices">
                                <h5 class="item_price">¥ ${book.bprice}</h5>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        
    <div class="clearfix"></div>
    <div class="alert alert-info">匿名留言</div>
	<div class="content">
        <div class="message_box" id="messageBox"></div>
        <div class="time">2020/12/29 下午9:25:20</div><div class="message_content">网站书太少了</div>
       	<HR>
        <div class="time">2020/12/30 下午11:17:11</div><div class="message_content">没啥评价</div>
        <HR>
        <div><input id="myInput" type="text" placeholder="请输入留言类容"><button id="doPost">提交</button></div>
    </div>

        
    </div>
</div>
<!--//gallery-->
<!--subscribe-->
<div class="subscribe"></div>
<!--//subscribe-->

<!--footer-->
<jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>
