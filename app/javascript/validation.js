window.addEventListener('DOMContentLoaded', function(){
  const textbox = document.getElementById("item-price");

  textbox.addEventListener("input",function(){
    const price = textbox.value;
    document.getElementById("add-tax-price").innerHTML = (Math.floor(price * 0.1));
    document.getElementById("profit").innerHTML = 
    (Math.floor(price-(price * 0.1)));
  });
});
