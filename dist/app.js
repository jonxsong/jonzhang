const siteConfig = {
  meetingUrl: "",
  githubUrl: "",
  twitterUrl: ""
};

const toast = document.querySelector("#toast");
let toastTimer;
function showToast(message) {
  toast.textContent = message;
  toast.classList.add("show");
  clearTimeout(toastTimer);
  toastTimer = setTimeout(() => toast.classList.remove("show"), 3200);
}

document.querySelector("#theme-toggle").addEventListener("click", () => {
  document.body.classList.toggle("night");
  const isNight = document.body.classList.contains("night");
  document.querySelector("#theme-toggle").setAttribute("aria-label", isNight ? "Switch to day theme" : "Switch to night theme");
});

document.querySelectorAll(".meeting-button").forEach((button) => {
  button.addEventListener("click", () => {
    if (siteConfig.meetingUrl) window.open(siteConfig.meetingUrl, "_blank", "noopener,noreferrer");
    else showToast("Meeting link is ready to connect — add your calendar URL in app.js.");
  });
});

document.querySelectorAll(".placeholder-link").forEach((button) => {
  button.addEventListener("click", () => {
    const label = button.dataset.label || "This link";
    const key = label.includes("GitHub") ? "githubUrl" : label.includes("Twitter") ? "twitterUrl" : null;
    if (key && siteConfig[key]) window.open(siteConfig[key], "_blank", "noopener,noreferrer");
    else showToast(`${label} is ready to connect.`);
  });
});

const observer = new IntersectionObserver((entries) => {
  entries.forEach((entry) => {
    if (entry.isIntersecting) {
      entry.target.classList.add("visible");
      observer.unobserve(entry.target);
    }
  });
}, { threshold: .12 });
document.querySelectorAll(".reveal").forEach((el, index) => {
  el.style.transitionDelay = `${Math.min(index % 3, 2) * 70}ms`;
  observer.observe(el);
});

const dialog = document.querySelector("#game-dialog");
const field = document.querySelector("#game-field");
const signal = document.querySelector("#signal");
const scoreEl = document.querySelector("#score");
const timerEl = document.querySelector("#timer");
let gameTimer;
let score = 0;
let time = 30;
let active = false;

function moveSignal() {
  signal.style.left = `${10 + Math.random() * 80}%`;
  signal.style.top = `${15 + Math.random() * 70}%`;
}

function endGame() {
  active = false;
  clearInterval(gameTimer);
  showToast(`Signal Chase complete — ${score} signals caught.`);
}

function startGame() {
  clearInterval(gameTimer);
  score = 0;
  time = 30;
  active = true;
  scoreEl.textContent = score;
  timerEl.textContent = time;
  moveSignal();
  gameTimer = setInterval(() => {
    time -= 1;
    timerEl.textContent = time;
    if (time <= 0) endGame();
  }, 1000);
}

signal.addEventListener("click", () => {
  if (!active) return;
  score += 1;
  scoreEl.textContent = score;
  moveSignal();
});
document.querySelector("#game-button").addEventListener("click", () => dialog.showModal());
document.querySelector("#game-close").addEventListener("click", () => { endGame(); dialog.close(); });
document.querySelector("#game-start").addEventListener("click", startGame);
dialog.addEventListener("click", (event) => { if (event.target === dialog) { endGame(); dialog.close(); } });
