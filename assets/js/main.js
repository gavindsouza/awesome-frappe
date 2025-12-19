// Theme toggle functionality
function initThemeToggle() {
  const toggle = document.getElementById('theme-toggle');
  const html = document.documentElement;

  // Apply theme
  function setTheme(isDark) {
    if (isDark) {
      html.setAttribute('data-theme', 'dark');
    } else {
      html.removeAttribute('data-theme');
    }
  }

  // Initialize from system preference
  setTheme(window.matchMedia('(prefers-color-scheme: dark)').matches);

  // Toggle on click
  if (toggle) {
    toggle.addEventListener('click', function() {
      setTheme(!html.hasAttribute('data-theme'));
    });
  }
}

// Run theme toggle immediately to prevent flash
initThemeToggle();

// Toggle visibility of hidden cards
function initShowMoreButtons() {
  const toggleButtons = document.querySelectorAll('.show-more-btn');

  toggleButtons.forEach((button) => {
    button.addEventListener('click', function(e) {
      e.preventDefault();

      const expandableSection = this.closest('.expandable-section');
      if (!expandableSection) return;

      const allCards = expandableSection.querySelectorAll('.card-container');
      const isExpanded = this.dataset.expanded === 'true';

      if (isExpanded) {
        // Collapse - hide cards after the 9th one
        allCards.forEach((card, index) => {
          if (index >= 9) {
            card.classList.add('hidden-card');
          }
        });
        this.innerHTML = this.dataset.textShow + ' <span class="arrow">↓</span>';
        this.dataset.expanded = 'false';
      } else {
        // Expand - show all cards
        allCards.forEach(card => {
          card.classList.remove('hidden-card');
        });
        this.innerHTML = this.dataset.textHide + ' <span class="arrow">↑</span>';
        this.dataset.expanded = 'true';
      }
    });
  });
}

// Live search functionality
function initSearch() {
  const searchInput = document.getElementById('search-input');
  const clearButton = document.getElementById('clear-search');
  const resultsCount = document.getElementById('search-results-count');
  const scrollHint = document.getElementById('scroll-hint');
  let hasAutoScrolled = false;

  if (!searchInput) return;

  function performSearch() {
    const query = searchInput.value.toLowerCase().trim();
    const allCards = document.querySelectorAll('.card-container');
    const allCategories = document.querySelectorAll('.category');
    const allSubcategories = document.querySelectorAll('.category h3');
    const allShowMoreButtons = document.querySelectorAll('.show-more-btn');
    let visibleCount = 0;

    if (query === '') {
      // Reset to default state - restore hidden cards
      allCards.forEach((card, index) => {
        card.style.display = '';
        // Re-add hidden-card class based on original index within section
        const cardGrid = card.closest('.card-grid');
        if (cardGrid) {
          const cardsInGrid = Array.from(cardGrid.querySelectorAll('.card-container'));
          const indexInGrid = cardsInGrid.indexOf(card);
          if (indexInGrid >= 9) {
            card.classList.add('hidden-card');
          }
        }
      });
      allCategories.forEach(category => {
        category.style.display = '';
      });
      allSubcategories.forEach(subcategory => {
        subcategory.style.display = '';
      });
      allShowMoreButtons.forEach(button => {
        button.style.display = '';
        // Reset button to collapsed state
        const expandableSection = button.closest('.show-more-container').previousElementSibling;
        if (expandableSection && button.dataset.expanded === 'true') {
          button.dataset.expanded = 'false';
          button.innerHTML = button.dataset.textShow + ' <span class="arrow">↓</span>';
        }
      });
      // Remove highlighting from all TOC links
      document.querySelectorAll('.hero-toc-list a').forEach(link => {
        link.classList.remove('has-results');
      });
      if (resultsCount) resultsCount.textContent = '';
      if (clearButton) clearButton.style.display = 'none';
      if (scrollHint) scrollHint.style.display = 'none';
      hasAutoScrolled = false;
      return;
    }

    // Show clear button
    if (clearButton) clearButton.style.display = 'flex';

    // Search through cards
    allCards.forEach(card => {
      const title = card.querySelector('.card-front h4')?.textContent.toLowerCase() || '';
      const description = card.querySelector('.card-front p')?.textContent.toLowerCase() || '';

      if (title.includes(query) || description.includes(query)) {
        card.style.display = '';
        card.classList.remove('hidden-card');
        visibleCount++;
      } else {
        card.style.display = 'none';
      }
    });

    // Hide categories with no visible cards and highlight TOC links for those with results
    allCategories.forEach(category => {
      const visibleCardsInCategory = Array.from(category.querySelectorAll('.card-container')).filter(
        card => card.style.display !== 'none'
      );

      const categoryId = category.id;
      const tocLink = document.querySelector(`.hero-toc-list a[href="#${categoryId}"]`);

      if (visibleCardsInCategory.length === 0) {
        category.style.display = 'none';
        if (tocLink) tocLink.classList.remove('has-results');
      } else {
        category.style.display = '';
        if (tocLink) tocLink.classList.add('has-results');
      }
    });

    // Hide subcategories (h3) with no visible cards
    allSubcategories.forEach(subcategory => {
      // Get the next sibling until we hit another h3 or h2
      let nextElement = subcategory.nextElementSibling;
      let hasVisibleCards = false;

      while (nextElement && !nextElement.matches('h2, h3')) {
        if (nextElement.classList.contains('expandable-section')) {
          const visibleCardsInSection = Array.from(nextElement.querySelectorAll('.card-container')).filter(
            card => card.style.display !== 'none'
          );
          if (visibleCardsInSection.length > 0) {
            hasVisibleCards = true;
            break;
          }
        }
        nextElement = nextElement.nextElementSibling;
      }

      subcategory.style.display = hasVisibleCards ? '' : 'none';
    });

    // Hide "Show more" buttons during search
    allShowMoreButtons.forEach(button => {
      button.style.display = 'none';
    });

    // Update results count with subtle scroll hint
    if (resultsCount) {
      const countText = `${visibleCount} result${visibleCount !== 1 ? 's' : ''} found`;

      // Check if first result is below viewport
      const firstVisibleCard = Array.from(allCards).find(card => card.style.display !== 'none');
      const showHint = firstVisibleCard && firstVisibleCard.getBoundingClientRect().top > window.innerHeight;

      if (scrollHint) {
        scrollHint.style.display = showHint ? 'inline' : 'none';
      }

      // Set just the count text, scroll hint is separate element now
      const countSpan = resultsCount.childNodes[0];
      if (countSpan && countSpan.nodeType === Node.TEXT_NODE) {
        countSpan.textContent = countText + ' ';
      } else {
        resultsCount.insertBefore(document.createTextNode(countText + ' '), resultsCount.firstChild);
      }
    }

    // Auto-scroll to first result if user is already scrolled down
    if (visibleCount > 0 && window.pageYOffset > 500) {
      const firstVisibleCard = Array.from(allCards).find(card => card.style.display !== 'none');
      if (firstVisibleCard) {
        setTimeout(() => {
          const yOffset = -200; // navbar (60px) + sticky search bar (~100px) + padding
          const y = firstVisibleCard.getBoundingClientRect().top + window.pageYOffset + yOffset;
          window.scrollTo({ top: y, behavior: 'smooth' });
        }, 100);
      }
    }
  }

  // Add event listeners
  searchInput.addEventListener('input', performSearch);

  if (clearButton) {
    clearButton.addEventListener('click', function() {
      searchInput.value = '';
      performSearch();
      searchInput.focus();
    });
  }

  // Scroll hint click handler
  if (scrollHint) {
    scrollHint.addEventListener('click', function(e) {
      e.preventDefault();
      const allCards = document.querySelectorAll('.card-container');
      const firstVisibleCard = Array.from(allCards).find(card => card.style.display !== 'none');
      if (firstVisibleCard) {
        const yOffset = -280; // navbar (60px) + sticky search bar (~100px) + padding
        const y = firstVisibleCard.getBoundingClientRect().top + window.pageYOffset + yOffset;
        window.scrollTo({ top: y, behavior: 'smooth' });
      }
    });
  }
}

// Sticky search functionality
function initStickySearch() {
  const searchWrapper = document.getElementById('search-container-wrapper');
  const heroSection = document.querySelector('.hero-compact');
  const scrollHint = document.getElementById('scroll-hint');

  if (!searchWrapper || !heroSection) return;

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (!entry.isIntersecting) {
        searchWrapper.classList.add('sticky');
        // Hide scroll hint when sticky (user has already scrolled)
        if (scrollHint) {
          scrollHint.style.display = 'none';
        }
      } else {
        searchWrapper.classList.remove('sticky');
      }
    });
  }, {
    threshold: 0,
    rootMargin: '-60px 0px 0px 0px' // Account for navbar height
  });

  observer.observe(heroSection);
}

// Install card flip functionality
function initInstallDropdowns() {
  document.addEventListener('click', function(e) {
    // Handle install button click - flip card
    const installBtn = e.target.closest('.install-btn');
    if (installBtn) {
      e.preventDefault();
      e.stopPropagation();

      const card = installBtn.closest('.card');

      // Unflip any other flipped cards
      document.querySelectorAll('.card.flipped').forEach(c => {
        if (c !== card) c.classList.remove('flipped');
      });

      // Flip this card
      card.classList.add('flipped');
      return;
    }

    // Handle click on install option row (copy command and flip back)
    const option = e.target.closest('.install-option');
    if (option) {
      e.preventDefault();
      e.stopPropagation();

      const command = option.dataset.command;
      const card = option.closest('.card');
      const panel = option.closest('.install-panel');

      // Store original content if not already stored
      if (!panel.dataset.originalContent) {
        panel.dataset.originalContent = panel.innerHTML;
      }

      navigator.clipboard.writeText(command).then(() => {
        // Show copied message
        panel.innerHTML = '<div class="copied-message">Copied to clipboard!</div>';

        // Flip back after delay and restore content
        setTimeout(() => {
          card.classList.remove('flipped');
          // Restore original content after flip animation
          setTimeout(() => {
            if (panel.dataset.originalContent) {
              panel.innerHTML = panel.dataset.originalContent;
            }
          }, 400);
        }, 800);
      }).catch(err => {
        console.error('Failed to copy:', err);
      });
      return;
    }

    // Click outside flipped card - unflip it
    if (!e.target.closest('.card-container')) {
      document.querySelectorAll('.card.flipped').forEach(card => {
        card.classList.remove('flipped');
      });
    }
  });

  // Escape key unflips cards
  document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
      document.querySelectorAll('.card.flipped').forEach(card => {
        card.classList.remove('flipped');
      });
    }
  });

  // Hovering another card unflips the current one
  document.querySelectorAll('.card-container').forEach(container => {
    container.addEventListener('mouseenter', function() {
      document.querySelectorAll('.card.flipped').forEach(card => {
        if (!this.contains(card)) {
          card.classList.remove('flipped');
        }
      });
    });
  });
}

// Scroll to top button
function initScrollToTop() {
  const scrollToTopBtn = document.getElementById('scroll-to-top');

  if (!scrollToTopBtn) return;

  // Show/hide button based on scroll position
  window.addEventListener('scroll', function() {
    if (window.pageYOffset > 300) {
      scrollToTopBtn.style.display = 'block';
    } else {
      scrollToTopBtn.style.display = 'none';
    }
  });

  // Scroll to top on click
  scrollToTopBtn.addEventListener('click', function() {
    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    });
  });
}

// Run immediately if DOM is already loaded, otherwise wait for it
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', function() {
    initShowMoreButtons();
    initSearch();
    initStickySearch();
    initScrollToTop();
    initInstallDropdowns();
  });
} else {
  initShowMoreButtons();
  initSearch();
  initStickySearch();
  initScrollToTop();
  initInstallDropdowns();
}
