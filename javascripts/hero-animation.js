document.addEventListener('DOMContentLoaded', () => {
  const loader = document.getElementById('hero-loader');
  const percentageDisplay = document.getElementById('loader-percentage'); // This now refers to the container div
  const illustContainer = document.querySelector('[data-hero-illustrations]');
  
  if (!loader || !illustContainer) {
    return;
  }

  const images = [...illustContainer.querySelectorAll('img')];
  const totalImages = images.length;
  let loadedImages = 0;

  const layers = {
    gem: document.querySelector('[data-hero-layer="gem"]'),
    content: document.querySelector('[data-hero-layer="content"]'),
    sunburst: document.querySelector('[data-hero-layer="sunburst"]'),
    illustMain: document.querySelector('[data-hero-layer="illust-main"]'),
    illustSub: document.querySelector('[data-hero-layer="illust-sub"]'),
  };

  const updateProgress = () => {
    loadedImages++;
    const percentage = Math.round((loadedImages / totalImages) * 100);
    const loaderNumber = document.getElementById('loader-number'); // Get the specific span for the number
    if(loaderNumber) {
        loaderNumber.textContent = `${percentage}`;
    }
    if (loadedImages === totalImages) {
      // Small delay to ensure 100% is visible before starting the animation
      setTimeout(startAnimation, 150);
    }
  };

  images.forEach(img => {
    // Handle cached images
    if (img.complete) {
      updateProgress();
    } else {
      img.addEventListener('load', updateProgress);
      img.addEventListener('error', updateProgress); // Count errors as loaded to not block the animation
    }
  });

  // Failsafe in case no images are found
  if (totalImages === 0) {
    startAnimation();
  }

  function startAnimation() {
    // 1. Fade out the entire loader
    if(loader) {
        // Remove pulse animation and fade out the whole loader
        loader.classList.remove('animate-pulse');
        loader.classList.add('animate-fade-out');
        setTimeout(() => {
            loader.style.display = 'none';
        }, 300); // Matches fade-out duration
    }

    // 2. Animate in the final hero content in sequence
    // Start slightly after the loader begins to fade
    setTimeout(() => {
        // Gem zooms in at its final position
        if (layers.gem) {
          layers.gem.classList.add('animate-gem-zoom-in');
        }

        // Content fades in after gem animation starts
        setTimeout(() => {
          if (layers.content) {
            layers.content.classList.add('animate-fade-in');
          }
        }, 300);

        // Sunburst radiates out, timed with the gem
        setTimeout(() => {
          if (layers.sunburst) {
            layers.sunburst.classList.add('animate-zoom-in');
          }
        }, 200);

        // Main illustrations appear after gem and sunburst
        setTimeout(() => {
            if (layers.illustMain) {
                layers.illustMain.classList.add('animate-fade-in');
                const illusts = layers.illustMain.querySelectorAll('img');
                illusts.forEach((illust, i) => {
                    setTimeout(() => {
                        illust.classList.add('animate-pop-in');
                    }, i * 40); // Staggered animation
                });
            }
        }, 600);

        // Sub illustrations appear last
        setTimeout(() => {
          if (layers.illustSub) {
            layers.illustSub.classList.add('animate-fade-in');
          }
        }, 900);

    }, 150); // Delay to start after loader fadeout begins
  }
});

