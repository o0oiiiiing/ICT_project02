<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>날씨</title>
<link rel="stylesheet" href="resources/ygh-css/weather.css" />
<script type="text/javascript">
$("#weather_image").on("click", function() {
	$("#weather").empty();
    $.ajax({
        url: "weather.do",           // 서버주소
        method: "post",             // 전달방식
        dataType: "xml",            // 가져오는 결과 타입
        success: function(data) {
            let table = "<table>";
			table += "<tbody>";
			
            $(data).find("local").each(function() {
                let local = $(this).text();
                let stn_id = $(this).attr("stn_id");
				let ta = $(this).attr("ta");
				let desc = $(this).attr("desc");
                let icon = $(this).attr("icon");

                // stn_id가 184인 경우에만 icon을 가져와서 표시 189
                if (stn_id === "184" || stn_id === "189") {
                    table += "<tr>";
                	table += "<td>" + local + "</td>";
					table += "<td>" + ta + "도</td>";
					table += "<td>" + desc + "</td>";
                    table += "<td><img src='http://www.kma.go.kr/images/icon/NW/NB" + icon + ".png' class='img'></td>";
                    table += "</tr>";
                }
            });
            table += "</tbody>";
            table += "</table>"
            $("#weather").append(table);
        },
        error: function() {
            alert("읽기 실패");
        }
    });
});

</script>
</head>
<body>
	<div id="weather">
		
	</div>
</body>
</html>