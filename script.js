const form = document.getElementById('orderForm');
const formMessage = document.getElementById('formMessage');

form.addEventListener('submit', (e) => {
    e.preventDefault();
    const name = document.getElementById('name').value.trim();
    formMessage.textContent = `${name}, заявка отправлена. Мы свяжемся с вами в течение часа.`;
    form.reset();
});

document.getElementById('year').textContent = new Date().getFullYear();
