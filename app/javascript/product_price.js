window.addEventListener('load', () => {
const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
   //入力した金額の値を取得
    const inputValue = priceInput.value;
    
    //販売手数料計算
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

    //販売利益
    const proFitDom = document.getElementById("profit");
    proFitDom.innerHTML = inputValue - addTaxDom.innerHTML;
  })
});