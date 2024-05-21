// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

// 일일 가입자 수
// 오늘 날짜로부터 일주일 전까지의 날짜 배열을 생성하는 함수
function getLast7Days() {
    const dates = [];
    const today = new Date();
    for (let i = 6; i >= 0; i--) {
        const date = new Date(today);
        date.setDate(today.getDate() - i);
        const formattedDate = `${date.getMonth() + 1}/${date.getDate()}`;  // 월/일 형식으로 포맷
        dates.push(formattedDate);
    }
    return dates;
}

// 일일 가입자 수를 가져오는 함수
function joinUser() {
    $.ajax({
        url: "joinUser.do",
        method: "post",
        dataType: "json",
        success: function(response) {
            // 응답 데이터를 날짜별로 가입자 수 배열로 변환
            const userCounts = getLast7Days().map(date => {
                const entry = response.find(item => {
                    const joinDate = new Date(item.join_date);
                    const formattedJoinDate = `${joinDate.getMonth() + 1}/${joinDate.getDate()}`;
                    return formattedJoinDate === date;
                });
                return entry ? parseInt(entry.user_count) : 0;
            });
            updateChartData(userCounts);
        },
        error: function() {
            alert("읽기 실패");
        }
    });
}

function updateChartData(userCounts) {
    const dailyVisits = {
        labels: getLast7Days(),  // 동적으로 생성된 라벨 배열
        data: userCounts
    };

    let ctx = document.getElementById("dailyVisitsChart");
    let dailyVisitsChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: dailyVisits.labels,
            datasets: [{
                label: "일일 가입자 수",
                lineTension: 0.3,
                backgroundColor: "#FFF5B2",
                borderColor: "#FFBB36",
                pointRadius: 5,
                pointBackgroundColor: "#FFBB36",
                pointBorderColor: "rgba(255,255,255,0.8)",
                pointHoverRadius: 5,
                pointHoverBackgroundColor: "#FFBB36",
                pointHitRadius: 50,
                pointBorderWidth: 2,
                data: dailyVisits.data,
            }],
        },
        options: {
            scales: {
                xAxes: [{
                    time: {
                        unit: 'date'
                    },
                    gridLines: {
                        display: false
                    },
                    ticks: {
                        maxTicksLimit: 7
                    }
                }],
                yAxes: [{
                    ticks: {
                        min: 0,
                        max: Math.max(...dailyVisits.data) + 5,
                        maxTicksLimit: 5
                    },
                    gridLines: {
                        color: "rgba(0, 0, 0, .125)",
                    }
                }],
            },
            legend: {
                display: false
            },
            tooltips: {
		        backgroundColor: 'gray'
		    }
        }
    });
}

document.addEventListener("DOMContentLoaded", function() {
    // 사용자 총 수 가져오기
    joinUser();
});
