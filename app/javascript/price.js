window.addEventListener('load', function(){
  const price = document.getElementById("item-price")
  const fee = document.getElementById("add-tax-price")
  const margin = document.getElementById("profit")

  price.addEventListener('keyup',function(){
    const inputPrice = price.value;
    tax = inputPrice * 0.1
    profit = inputPrice * 0.9
    fee.innerHTML = Math.round(tax)
    margin.innerHTML = Math.round(profit)
  })
});

