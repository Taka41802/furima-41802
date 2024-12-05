const calculateProfit = () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = parseFloat(priceInput.value);

      if (!isNaN(inputValue) && inputValue > 0) {
        const tax = Math.floor(inputValue * 0.1);
        const profit = inputValue - tax;

        addTaxDom.innerHTML = tax.toString();
        profitDom.innerHTML = profit.toString();
      } else {
        addTaxDom.innerHTML = "";
        profitDom.innerHTML = "";
      }
    });
  }
};

window.addEventListener("load", calculateProfit);


