function formatTime(seconds) {
    var hours = Math.floor(seconds / 3600).toString().padStart(2, '0');
    var minutes = Math.floor((seconds % 3600) / 60).toString().padStart(2, '0');
    var secs = (seconds % 60).toString().padStart(2, '0');
    return hours + ":" + minutes + ":" + secs;
}
