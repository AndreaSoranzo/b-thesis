function animateCounter(obj, start, end, duration, delayMs) {
    let startTime = null;

    // Easing function (ease-in-out)
    function easeInOutQuad(t) {
        t /= duration / 2;
        if (t < 1) return (end / 2) * t * t;
        t--;
        return (-end / 2) * (t * (t - 2) - 1);
    }

    // Animation step
    function animation(currentTime) {
        if (!startTime) startTime = currentTime;
        const progress = Math.min((currentTime - startTime) / duration, 1);
        const easedProgress = easeInOutQuad(progress * duration) / end;
        obj.innerHTML = Math.floor(start + easedProgress * (end - start));

        if (progress < 1) {
            requestAnimationFrame(animation);
        } else {
            obj.innerHTML = end;
        }
    }
    setTimeout(() => {
        requestAnimationFrame(animation);
    }, delayMs);
}

window.onload = function () {
    const counterElement = document.getElementById("grade");
    const end = counterElement.getAttribute("data-grade")
    animateCounter(counterElement, 0, end, 4000, 1000);
};