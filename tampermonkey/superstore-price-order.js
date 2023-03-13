const orderComparePrices = () => [
  ...document.querySelector('.product-tile-group__list')
  .querySelectorAll('.comparison-price-list .price__value')
]
  .sort((a,b) => a.innerText > b.innerText)
  .map((el, i) => el.innerText += ` (#${i+1})`) 

document.addEventListener('keypress', (ev) => {
  if (ev.code === 'Equal') {
    orderComparePrices();
  }
})
