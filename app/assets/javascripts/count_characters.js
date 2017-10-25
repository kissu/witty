$(document).ready(function(){
  var output = document.querySelector('#charsCounted')
  var wording = ' caractères restants'
  updateValue()

  function updateValue(){
    var chars = document.querySelector('#areaDescription').value.length
    document.querySelector("input[type='submit']").disabled = false
    if (chars < 125) {
      output.style.color = '#7ac279'
    } else if (chars >= 125 && chars <= 140) {
      output.style.color = '#ff9f1c'
    } else {
      output.style.color = '#fe621d'
      document.querySelector("input[type='submit']").disabled = true
    }
    output.textContent = 140 - chars + wording
  }

  window.addEventListener('keyup', updateValue)
});
