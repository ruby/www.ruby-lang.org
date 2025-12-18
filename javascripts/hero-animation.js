document.addEventListener('DOMContentLoaded', () => {
  const loader = document.getElementById('hero-loader');
  const illustContainer = document.querySelector('[data-hero-illustrations]');

  // Ensure all required elements are present
  if (!loader || !illustContainer) {
    console.error('Required hero elements not found.');
    if(loader) loader.style.display = 'none';
    return;
  }

  // Collect all hero images including illustrations and background elements
  const illustImages = [...illustContainer.querySelectorAll('img')];
  const bgImages = [
    document.querySelector('[data-hero-layer="gem"]'),
    document.querySelector('[data-hero-layer="sunburst"]'),
    document.querySelector('[data-hero-layer="illust-sub"]')
  ].filter(img => img !== null);
  const images = [...illustImages, ...bgImages];
  const totalImages = images.length;
  let loadedImages = 0;

  // Track loading states for hero images and Try Ruby
  let heroImagesReady = false;
  let tryRubyReady = false;

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

  // Check if both hero images and Try Ruby are ready
  const checkAllReady = () => {
    if (heroImagesReady && tryRubyReady) {
      // Update to 100% and start animation
      if (loaderNumber) {
        loaderNumber.textContent = '100';
      }
      setTimeout(startAnimation, 300);
    }
  };

  const updateProgress = () => {
    loadedImages++;
    // Show progress up to 80% for hero images, reserve 20% for Try Ruby
    const percentage = Math.round((loadedImages / totalImages) * 80);
    if (loaderNumber) {
        loaderNumber.textContent = `${percentage}`;
    }
    if (loadedImages === totalImages) {
      heroImagesReady = true;
      checkAllReady();
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
    heroImagesReady = true;
  }

  // Subscribe to Try Ruby examples loading
  if (typeof TryRubyExamples !== 'undefined') {
    TryRubyExamples.setOnReady(() => {
      tryRubyReady = true;
      // Update progress to show Try Ruby is loaded (80% -> 95%)
      if (loaderNumber && !heroImagesReady) {
        const currentPercent = parseInt(loaderNumber.textContent) || 0;
        loaderNumber.textContent = `${Math.max(currentPercent, 95)}`;
      }
      checkAllReady();
    });
  } else {
    // TryRubyExamples not available, skip waiting for it
    tryRubyReady = true;
  }

  // Initial check in case both are already ready
  checkAllReady();

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
              const trainExtraDelay = 400; // Extra delay for train to appear 1 beat later
              illusts.forEach((illust, i) => {
                  setTimeout(() => {
                      // Train has a special slide-in animation (no bounce)
                      if (illust.hasAttribute('data-hero-train')) {
                          // Train appears later with slide-in animation
                          setTimeout(() => {
                              illust.classList.add('animate-train-slide-in');
                          }, trainExtraDelay);
                      } else {
                          illust.classList.add('animate-pop-in');
                      }
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

      // Try Ruby examples appear after content fades in
      const tryRubyDelay = gemAnimationDuration * 0.9;
      setTimeout(() => {
        if (typeof TryRubyExamples !== 'undefined') {
          TryRubyExamples.showAllExamples();
        }
      }, tryRubyDelay);

      // Clean up transition after animation
      setTimeout(() => {
        layers.finalGem.style.transition = '';
        layers.finalGem.style.transform = '';
      }, gemAnimationDuration + 50);

      // Start heartbeat animation after all animations complete
      const heartbeatStartDelay = gemAnimationDuration + mainIllustTotalDuration + 1000;
      setTimeout(() => {
        // Add heartbeat to gem
        layers.finalGem.classList.add('animate-heartbeat');
        // Sync heartbeat to all main illustrations
        if (layers.illustMain) {
          const illusts = layers.illustMain.querySelectorAll('img');
          illusts.forEach(illust => {
            // Remove initial animation classes first to avoid conflict
            illust.classList.remove('animate-pop-in');
            illust.classList.remove('animate-train-slide-in');
            // Train uses its own heartbeat animation with gatagata movement
            if (illust.hasAttribute('data-hero-train')) {
              illust.classList.add('animate-train-heartbeat');
            } else {
              // Use illust-specific heartbeat that preserves opacity
              illust.classList.add('animate-heartbeat-illust');
            }
          });
        }
      }, heartbeatStartDelay);

    }, 350); // Wait for percentage to fade out
  }
});
