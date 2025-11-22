document.addEventListener('DOMContentLoaded', () => {
  const loader = document.getElementById('hero-loader');
  const illustContainer = document.querySelector('[data-hero-illustrations]');
  
  // Ensure all required elements are present
  if (!loader || !illustContainer) {
    console.error('Required hero elements not found.');
    if(loader) loader.style.display = 'none';
    return;
  }

  const images = [...illustContainer.querySelectorAll('img')];
  const totalImages = images.length;
  let loadedImages = 0;

  const layers = {
    finalGem: document.querySelector('[data-hero-layer="gem"]'),
    content: document.querySelector('[data-hero-layer="content"]'),
    sunburst: document.querySelector('[data-hero-layer="sunburst"]'),
    illustMain: document.querySelector('[data-hero-layer="illust-main"]'),
    illustSub: document.querySelector('[data-hero-layer="illust-sub"]'),
  };

  const loadingGem = document.getElementById('loader-gem-shape');
  const percentageText = document.getElementById('loader-percentage');

  if (!loadingGem || !percentageText || Object.values(layers).some(el => !el)) {
    console.error('One or more hero animation layers are missing.');
    loader.style.display = 'none';
    // Make sure content is visible if animation can't run
    if (layers.content) layers.content.style.opacity = 1;
    if (layers.finalGem) layers.finalGem.style.opacity = 1;
    return;
  }

  const updateProgress = () => {
    loadedImages++;
    const percentage = Math.round((loadedImages / totalImages) * 100);
    const loaderNumber = document.getElementById('loader-number');
    if (loaderNumber) {
        loaderNumber.textContent = `${percentage}`;
    }
    if (loadedImages === totalImages) {
      // Short delay to ensure 100% is read by the user
      setTimeout(startAnimation, 150);
    }
  };

  images.forEach(img => {
    if (img.complete) {
      updateProgress();
    } else {
      img.addEventListener('load', updateProgress);
      img.addEventListener('error', updateProgress); // Treat errors as loaded
    }
  });

  if (totalImages === 0) {
    setTimeout(startAnimation, 150);
  }

  function startAnimation() {
    // Add a delay before starting the main animation sequence
    setTimeout(() => {
      // 1. Get initial position of the loading gem (First)
      const initialRect = loadingGem.getBoundingClientRect();

      // 2. Hide loading percentage and remove pulse animation
      percentageText.style.opacity = '0';
      loadingGem.classList.remove('animate-pulse');

      // 3. Make the final gem ready for animation
      layers.finalGem.style.opacity = '1';

      // 4. Get final position of the gem (Last)
      const finalRect = layers.finalGem.getBoundingClientRect();

      // 5. Calculate the difference (Invert)
      const deltaX = initialRect.left - finalRect.left;
      const deltaY = initialRect.top - finalRect.top;
      const deltaW = initialRect.width / finalRect.width;
      const deltaH = initialRect.height / finalRect.height;

      // 6. Apply the inverse transform
      layers.finalGem.style.transform = `translate(${deltaX}px, ${deltaY}px) scale(${deltaW}, ${deltaH})`;
      layers.finalGem.style.transformOrigin = 'top left';

      // 7. Play the animation
      requestAnimationFrame(() => {
        layers.finalGem.classList.add('transition-transform', 'duration-1000', 'ease-in-out');
        layers.finalGem.style.transform = '';
      });
      
      // 8. Hide the old loader
      loader.classList.add('animate-fade-out');
      setTimeout(() => {
        loader.style.display = 'none';
      }, 300);

      // 9. Animate in the rest of the hero content in sequence
      const gemAnimationDuration = 1000;
      const contentDelay = gemAnimationDuration + 100; // After gem + 100ms pause

      // Content fades and slides in after gem is in place
      setTimeout(() => {
        if (layers.content) {
          layers.content.classList.add('animate-fade-slide-in');
        }
      }, contentDelay);

      // Sunburst radiates out, timed to start with the gem
      setTimeout(() => {
        if (layers.sunburst) {
          layers.sunburst.classList.add('animate-zoom-in');
        }
      }, 100);

      // Main illustrations appear towards the end of the gem animation
      setTimeout(() => {
          if (layers.illustMain) {
              layers.illustMain.classList.add('animate-fade-in');
              const illusts = layers.illustMain.querySelectorAll('img');
              illusts.forEach((illust, i) => {
                  setTimeout(() => {
                      illust.classList.add('animate-pop-in');
                  }, i * 40);
              });
          }
      }, gemAnimationDuration * 0.6);

      // Sub illustrations appear after everything else has started
      setTimeout(() => {
        if (layers.illustSub) {
          layers.illustSub.classList.add('animate-fade-in');
        }
      }, contentDelay + 200);

      // 10. Clean up transition classes after animation
      layers.finalGem.addEventListener('transitionend', () => {
        layers.finalGem.classList.remove('transition-transform', 'duration-1000', 'ease-in-out');
      }, { once: true });

    }, 200); // 200ms delay before starting the whole sequence
  }
});

