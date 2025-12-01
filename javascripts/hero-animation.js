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
  const loaderNumber = document.getElementById('loader-number');

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
    if (loaderNumber) {
        loaderNumber.textContent = `${percentage}`;
    }
    if (loadedImages === totalImages) {
      // Short delay to ensure 100% is read by the user
      setTimeout(startAnimation, 300);
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
    // Phase 1: Fade out percentage text smoothly
    percentageText.style.transition = 'opacity 300ms ease-out';
    percentageText.style.opacity = '0';

    // Remove pulse animation for smooth transition
    loadingGem.classList.remove('animate-pulse');

    // Phase 2: After percentage fades, start the gem transformation
    setTimeout(() => {
      // Get initial position of the loading gem (First)
      const initialRect = loadingGem.getBoundingClientRect();

      // Get the gem image inside the loader
      const loaderGemImg = loadingGem.querySelector('img');

      // Prepare the final gem - position it exactly where the loader gem is
      layers.finalGem.style.opacity = '1';

      // Get final position of the gem (Last)
      const finalRect = layers.finalGem.getBoundingClientRect();

      // Calculate the difference (Invert)
      const deltaX = initialRect.left - finalRect.left;
      const deltaY = initialRect.top - finalRect.top;
      const scaleX = initialRect.width / finalRect.width;
      const scaleY = initialRect.height / finalRect.height;

      // Apply the inverse transform to final gem (start from loader position)
      layers.finalGem.style.transform = `translate(${deltaX}px, ${deltaY}px) scale(${scaleX}, ${scaleY})`;
      layers.finalGem.style.transformOrigin = 'top left';

      // Hide the loader gem immediately (final gem is now in its place)
      loaderGemImg.style.opacity = '0';

      // Fade out loader background
      loader.style.transition = 'opacity 400ms ease-out';
      loader.style.opacity = '0';

      // Start the gem expansion animation
      requestAnimationFrame(() => {
        requestAnimationFrame(() => {
          // Animate final gem to its destination with smooth easing
          layers.finalGem.style.transition = 'transform 900ms cubic-bezier(0.22, 1, 0.36, 1)';
          layers.finalGem.style.transform = 'translate(0, 0) scale(1)';
        });
      });

      // Hide loader element after fade
      setTimeout(() => {
        loader.style.display = 'none';
      }, 400);

      // Phase 3: Animate other elements in sequence
      const gemAnimationDuration = 900;

      // Sunburst starts expanding with the gem
      setTimeout(() => {
        if (layers.sunburst) {
          layers.sunburst.classList.add('animate-zoom-in');
        }
      }, 100);

      // Content fades in as gem reaches its destination
      setTimeout(() => {
        if (layers.content) {
          layers.content.classList.add('animate-fade-slide-in');
        }
      }, gemAnimationDuration * 0.7);

      // Main illustrations appear towards the end of gem animation
      const mainIllustStartDelay = gemAnimationDuration * 0.5;
      const mainIllustStaggerDelay = 35;

      const mainIllustCount = layers.illustMain ? layers.illustMain.querySelectorAll('img').length : 0;
      const mainIllustTotalDuration = mainIllustCount * mainIllustStaggerDelay;
      const subIllustDelay = mainIllustStartDelay + mainIllustTotalDuration + 100;

      setTimeout(() => {
          if (layers.illustMain) {
              layers.illustMain.classList.add('animate-fade-in');
              const illusts = layers.illustMain.querySelectorAll('img');
              illusts.forEach((illust, i) => {
                  setTimeout(() => {
                      illust.classList.add('animate-pop-in');
                  }, i * mainIllustStaggerDelay);
              });
          }
      }, mainIllustStartDelay);

      // Sub illustrations appear after main illustrations
      setTimeout(() => {
        if (layers.illustSub) {
          layers.illustSub.classList.add('animate-fade-in');
        }
      }, subIllustDelay);

      // Clean up transition after animation and start heartbeat
      layers.finalGem.addEventListener('transitionend', () => {
        layers.finalGem.style.transition = '';
        layers.finalGem.style.transform = '';
        // Start heartbeat animation after gem settles
        setTimeout(() => {
          layers.finalGem.classList.add('animate-heartbeat');
        }, 500);
      }, { once: true });

    }, 350); // Wait for percentage to fade out
  }
});
