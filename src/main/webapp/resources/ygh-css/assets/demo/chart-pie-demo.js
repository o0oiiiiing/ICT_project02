// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';



// 사용자 총 수를 가져오는 함수
function userTotal() {
    $.ajax({
        url: "userTotal.do",
        method: "post",
        dataType: "json",
        success: function(response) {
            // 응답 데이터를 기반으로 차트를 업데이트
            updateChart2(response);
        },
        error: function() {
            alert("읽기 실패");
        }
    });
}

function updateChart2(response) {
    let inactiveUsers = parseInt(response[0].inactiveUsers);
    let activeUsers = parseInt(response[0].activeUsers);

        if (response.active == 0) {
            inactiveUsers = response.inactiveUsers;
        } else if (response.active == 1) {
            activeUsers = response.activeUsers;
        }
    

    // 차트 업데이트
    updatePieChart(inactiveUsers, activeUsers);
}

function updatePieChart(inactiveUsers, activeUsers) {
    let ctx = document.getElementById("myPieChart");
    let myPieChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: ["활성 회원", "탈퇴 회원"],
            datasets: [{
                data: [inactiveUsers, activeUsers],
                backgroundColor: ['#FFBB36', 'lightgray'],
            }],
        },
    });
}

// 페이지 로드 시 회원 정보를 가져오도록 호출
$(document).ready(function() {
    // 사용자 총 수 가져오기
    userTotal();
});
