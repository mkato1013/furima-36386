function calculation(){
  const calculationSales = document.getElementById('item-price');
  calculationSales.addEventListener('keyup', () => {
    const tax = calculationSales.value * 0.1;
    const tax2 = Math.floor(tax)
    const calculationTax = document.getElementById('add-tax-price');
    calculationTax.innerHTML = `${tax2.toLocaleString()}`;
    const fee = calculationSales.value - tax2;
    const calculationProfit = document.getElementById('profit');
    calculationProfit.innerHTML = `${fee.toLocaleString()}`;
  });
};

window.addEventListener('load', calculation);