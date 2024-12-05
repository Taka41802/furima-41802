document.addEventListener("turbolinks:load", () => {
  console.log("JavaScript loaded"); // この行を追加

  const priceInput = document.getElementById("item-price");
  const taxDisplay = document.getElementById("add-tax-price");
  const profitDisplay = document.getElementById("profit");

  if (priceInput) {
    console.log("Price input element found"); // この行を追加

    priceInput.addEventListener("input", () => {
      const price = parseInt(priceInput.value, 10);
      console.log(`Input price: ${price}`); // この行を追加

      if (!isNaN(price) && price >= 300 && price <= 9999999) {
        const tax = Math.floor(price * 0.1);
        const profit = price - tax;

        console.log(`Tax: ${tax}, Profit: ${profit}`); // この行を追加

        taxDisplay.textContent = tax;
        profitDisplay.textContent = profit;
      } else {
        taxDisplay.textContent = "";
        profitDisplay.textContent = "";
      }
    });
  } else {
    console.log("Price input element not found"); // この行を追加
  }
});
