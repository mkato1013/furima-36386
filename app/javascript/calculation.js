function calculation(){
  const calculationSales = document.getElementById('item-price');
  calculationSales.addEventListener('keyup', () => {
    const tax = calculationSales.value * 0.1;
    const calculationTax = document.getElementById('add-tax-price');
    calculationTax.innerHTML = `${tax.toLocaleString()}`;
    const fee = calculationSales.value - tax;
    const calculationProfit = document.getElementById('profit');
    calculationProfit.innerHTML = `${fee.toLocaleString()}`;
  });
};

window.addEventListener('load', calculation);