function showPage(event, pageId) {
    event.preventDefault(); // impede o recarregamento da página
  
    const pages = document.querySelectorAll('.page');
    pages.forEach(page => page.classList.add('hidden'));
  
    const selectedPage = document.getElementById(pageId);
    if (selectedPage) {
      selectedPage.classList.remove('hidden');
    }
  }
  