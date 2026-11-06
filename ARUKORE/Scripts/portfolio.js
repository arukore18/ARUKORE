
document.addEventListener("DOMContentLoaded", function () {
    const carousel = document.querySelector(".profile-carousel");
    const track = document.getElementById("profileTrack");
    const slides = Array.from(document.querySelectorAll(".profile-slide"));

    const prevButton = document.getElementById("profilePrev");
    const nextButton = document.getElementById("profileNext");

    const currentLabel = document.getElementById("carouselCurrent");
    const progressBar = document.getElementById("carouselProgress");

    if (!carousel || !track || slides.length === 0) return;

    let currentIndex = 0;
    let visibleCount = 3;
    let slideWidth = 0;
    let autoRotate;

    function getVisibleCount() {
        if (window.innerWidth <= 600) {
            return 1;
        }

        if (window.innerWidth <= 950) {
            return 2;
        }

        return 3;
    }

    function updateCarousel() {
        visibleCount = getVisibleCount();

        const containerWidth = carousel.clientWidth;
        slideWidth = containerWidth / visibleCount;

        slides.forEach(function (slide) {
            slide.style.flex = `0 0 ${slideWidth}px`;
        });

        track.style.width = `${slideWidth * slides.length}px`;

        const maxIndex = Math.max(0, slides.length - visibleCount);
        currentIndex = Math.min(currentIndex, maxIndex);

        showSlide();
    }

    function showSlide() {
        const maxIndex = Math.max(0, slides.length - visibleCount);

        track.style.transform =
            `translate3d(${-currentIndex * slideWidth}px, 0, 0)`;

        slides.forEach(function (slide, index) {
            slide.classList.toggle(
                "active",
                index === currentIndex + Math.floor(visibleCount / 2)
            );
        });

        if (currentLabel) {
            currentLabel.textContent =
                String(currentIndex + 1).padStart(2, "0");
        }

        if (progressBar) {
            const progress = ((currentIndex + 1) / (maxIndex + 1)) * 100;
            progressBar.style.width = `${progress}%`;
        }
    }

    function nextSlide() {
        const maxIndex = Math.max(0, slides.length - visibleCount);

        currentIndex = currentIndex >= maxIndex ? 0 : currentIndex + 1;
        showSlide();
    }

    function previousSlide() {
        const maxIndex = Math.max(0, slides.length - visibleCount);

        currentIndex = currentIndex <= 0 ? maxIndex : currentIndex - 1;
        showSlide();
    }

    function startAutoRotate() {
        stopAutoRotate();

        autoRotate = setInterval(function () {
            nextSlide();
        }, 3500);
    }

    function stopAutoRotate() {
        if (autoRotate) {
            clearInterval(autoRotate);
            autoRotate = null;
        }
    }

    if (nextButton) {
        nextButton.addEventListener("click", function () {
            nextSlide();
            startAutoRotate();
        });
    }

    if (prevButton) {
        prevButton.addEventListener("click", function () {
            previousSlide();
            startAutoRotate();
        });
    }

    carousel.addEventListener("mouseenter", stopAutoRotate);
    carousel.addEventListener("mouseleave", startAutoRotate);

    carousel.addEventListener("focusin", stopAutoRotate);
    carousel.addEventListener("focusout", startAutoRotate);

    window.addEventListener("resize", updateCarousel);

    document.addEventListener("visibilitychange", function () {
        if (document.hidden) {
            stopAutoRotate();
        } else {
            startAutoRotate();
        }
    });

    updateCarousel();
    startAutoRotate();
});
