window.addEventListener("load", (_) => {
    const muteBtn = document.getElementById("theme-changer-input");
    const audio = document.getElementById("bgmusic");
    const isCurrentlyMuted = localStorage.getItem("no-music");
    if (isCurrentlyMuted && isCurrentlyMuted==="1") {
        audio.muted = true; 
        muteBtn.checked=true;
    }
    muteBtn.addEventListener("change",() => ToggleMusic(muteBtn, audio))
});

function ToggleMusic(buttonElement, audioElement) {
    if (buttonElement.checked) {
        audioElement.muted = true; 
        localStorage.setItem("no-music","1");
    } else {
        audioElement.muted = false; 
        localStorage.setItem("no-music","0");
    }
}