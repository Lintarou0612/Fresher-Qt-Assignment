function getCurrentDateTime() {
    var now = new Date();
    // Lấy thời gian
    var hours = now.getHours().toString().padStart(2, '0');
    var minutes = now.getMinutes().toString().padStart(2, '0');
    var seconds = now.getSeconds().toString().padStart(2, '0');
    var timeString = "\t\t" + hours + ":" + minutes + ":" + seconds;

    // Lấy ngày tháng
    var daysOfWeek = ["Chủ nhật", "Thứ 2", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6", "Thứ 7"];
    var monthsOfYear = ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"];

    var dayOfWeek = daysOfWeek[now.getDay()];
    var month = monthsOfYear[now.getMonth()];
    var day = now.getDate();
    var year = now.getFullYear();

    var dateString = dayOfWeek + ", " + "Ngày " + day + " " + month + ", Năm " + year;

    return timeString + "\n" + dateString;
}
