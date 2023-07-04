// Toggle open search box
const searchIcon = document.getElementById('search-icon');
const searchBox = document.getElementById('search-box');
searchIcon.onclick = () => {
    const isOpened = searchBox.style.display === 'flex';
    if (isOpened) {
        searchIcon.className = searchIcon.className
                .split(' ')
                .map((clas) => (clas === 'fa-xmark' ? 'fa-magnifying-glass' : clas))
                .join(' ');
        searchBox.style.display = 'none';
    } else {
        searchIcon.className = searchIcon.className
                .split(' ')
                .map((clas) => (clas === 'fa-magnifying-glass' ? 'fa-xmark' : clas))
                .join(' ');
        searchBox.style.display = 'flex';
    }
};

// Toggle theme
if (
        localStorage.theme === 'dark' ||
        (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)
        ) {
    document.documentElement.classList.add('dark');
    localStorage.theme = 'dark';
} else {
    document.documentElement.classList.remove('dark');
    localStorage.theme = 'light';
}
const theme = document.getElementById('theme');
theme.onclick = () => {
    const isDarkTheme = localStorage.theme === 'dark';
    if (isDarkTheme) {
        document.documentElement.classList.remove('dark');
        localStorage.theme = 'light';
        theme.className = theme.className
                .split(' ')
                .map((clas) => (clas === 'fa-sun' ? 'fa-moon' : clas))
                .join(' ');
    } else {
        document.documentElement.classList.add('dark');
        localStorage.theme = 'dark';
        theme.className = theme.className
                .split(' ')
                .map((clas) => (clas === 'fa-moon' ? 'fa-sun' : clas))
                .join(' ');
    }
};