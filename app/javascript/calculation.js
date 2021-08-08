function calculation(){
  const calculationSales = document.getElementById('item-price');
  // const calculationTax = document.getElementById('add-tax-price');
  // const calculationProfit = document.getElementById('profit');
  calculationSales.addEventListener('keyup', () => {
    const tax = calculationSales.value * 0.1;
    const calculationTax = document.getElementById('add-tax-price');
    calculationTax.innerHTML = `${tax.toLocaleString()}`;             //これでいいのか？.toLocaleString()
    const fee = calculationSales.value - tax;
    const calculationProfit = document.getElementById('profit');
    calculationProfit.innerHTML = `${fee.toLocaleString()}`;
    e.preventDefault();
  });
};

window.addEventListener('load', calculation);