const siteConfig = {
  meetingUrl: "https://calendar.app.google/avn783Ta5CCPeqHj7"
};

const toast = document.querySelector("#toast");
let toastTimer;
function showToast(message) {
  toast.textContent = message;
  toast.classList.add("show");
  clearTimeout(toastTimer);
  toastTimer = setTimeout(() => toast.classList.remove("show"), 3200);
}

const timeControl = document.querySelector("#time-theme-control");
const timeButton = document.querySelector("#time-button");
const timeSlider = document.querySelector("#time-slider");
const timeOutput = document.querySelector("#time-output");

const skyKeyframes = [
  { hour: 0, top: "#050713", mid: "#111827", base: "#080c15", one: "#26335d", two: "#19245c", three: "#33416f" },
  { hour: 5, top: "#20295a", mid: "#8a6b78", base: "#f0a66d", one: "#f2b47f", two: "#75598d", three: "#e99c89" },
  { hour: 7, top: "#f39a7e", mid: "#f8cfa4", base: "#edf6ff", one: "#fff0cf", two: "#e69b9c", three: "#b9ddff" },
  { hour: 12, top: "#73b8ff", mid: "#cfe8ff", base: "#f7f7f2", one: "#ffffff", two: "#4b9dff", three: "#b7ebff" },
  { hour: 17, top: "#81bdf6", mid: "#f6c69c", base: "#fff3d2", one: "#fff5d8", two: "#ed9d7f", three: "#f7d2a2" },
  { hour: 19, top: "#5966ae", mid: "#e78384", base: "#ffd5ad", one: "#f7b5a0", two: "#4d4f9c", three: "#ef8b91" },
  { hour: 22, top: "#111936", mid: "#20244d", base: "#0b1020", one: "#33406a", two: "#172358", three: "#263157" },
  { hour: 24, top: "#050713", mid: "#111827", base: "#080c15", one: "#26335d", two: "#19245c", three: "#33416f" }
];

function hexToRgb(hex) {
  const value = parseInt(hex.slice(1), 16);
  return [(value >> 16) & 255, (value >> 8) & 255, value & 255];
}

function mixColor(a, b, amount) {
  const start = hexToRgb(a);
  const end = hexToRgb(b);
  const values = start.map((value, index) => Math.round(value + (end[index] - value) * amount));
  return `rgb(${values.join(", ")})`;
}

function formatHour(hour) {
  if (hour === 0) return "12 AM";
  if (hour === 12) return "12 PM";
  return `${hour % 12} ${hour < 12 ? "AM" : "PM"}`;
}

function describeHour(hour) {
  if (hour < 5) return "night";
  if (hour < 8) return "sunrise";
  if (hour < 12) return "morning";
  if (hour < 17) return "midday";
  if (hour < 20) return "sunset";
  return "night";
}

function setSkyTime(hour) {
  const current = skyKeyframes.find((frame, index) => hour >= frame.hour && hour <= skyKeyframes[index + 1]?.hour) || skyKeyframes[0];
  const next = skyKeyframes[skyKeyframes.indexOf(current) + 1] || skyKeyframes[0];
  const amount = (hour - current.hour) / (next.hour - current.hour || 1);
  const root = document.documentElement;
  root.style.setProperty("--sky-top", mixColor(current.top, next.top, amount));
  root.style.setProperty("--sky-mid", mixColor(current.mid, next.mid, amount));
  root.style.setProperty("--sky-base", mixColor(current.base, next.base, amount));
  root.style.setProperty("--orb-one", mixColor(current.one, next.one, amount));
  root.style.setProperty("--orb-two", mixColor(current.two, next.two, amount));
  root.style.setProperty("--orb-three", mixColor(current.three, next.three, amount));
  document.body.classList.toggle("night", hour < 6 || hour >= 20);
  const label = formatHour(hour);
  timeOutput.textContent = label;
  timeSlider.setAttribute("aria-valuetext", `${label}, ${describeHour(hour)}`);
  localStorage.setItem("jon-sky-hour", String(hour));
}

const savedHour = Number(localStorage.getItem("jon-sky-hour"));
const pacificHour = Number(new Intl.DateTimeFormat("en-US", { timeZone: "America/Los_Angeles", hour: "numeric", hourCycle: "h23" }).format(new Date()));
const initialHour = Number.isInteger(savedHour) && savedHour >= 0 && savedHour <= 23 ? savedHour : pacificHour;
timeSlider.value = initialHour;
setSkyTime(initialHour);
timeSlider.addEventListener("input", (event) => setSkyTime(Number(event.target.value)));
timeButton.addEventListener("click", () => {
  const isOpen = timeControl.classList.toggle("open");
  if (isOpen) timeSlider.focus();
});
document.addEventListener("click", (event) => {
  if (!timeControl.contains(event.target)) timeControl.classList.remove("open");
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
    showToast(`${label} is ready to connect.`);
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
