function showPage(pageId) {
    const pages = document.querySelectorAll('.page');
    pages.forEach(page => page.classList.add('hidden'));
  
    const selectedPage = document.getElementById(pageId);
    if (selectedPage) {
      selectedPage.classList.remove('hidden');
    }
  }
  