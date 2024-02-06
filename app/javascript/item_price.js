const cal = () => {
    const priceInput = document.getElementById("item-price");
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    // 価格が変更されたときに販売手数料と利益を計算して表示する関数
    function calculateSalesTaxAndProfit() {
      const price = parseFloat(priceInput.value);

      // 販売手数料の計算（例として10%とします）
      const salesTax = Math.floor(price * 0.1);

      // 利益の計算
      const profit = Math.floor(price - salesTax);

      // 計算結果を表示
      addTaxDom.innerHTML = salesTax;
      profitDom.innerHTML = profit;
    }

    // 価格が変更されたときに計算関数を実行
    priceInput.addEventListener("input", calculateSalesTaxAndProfit);

}
window.addEventListener("turbo:load", cal);
window.addEventListener("turbo:render", cal);