let brandModelPriceMap = {};

async function initializeBrandModelPriceMap() {
  const carDivs = document.querySelectorAll('.col-md-4');
  brandModelPriceMap = {};

  carDivs.forEach(div => {
    const brand = div.dataset.brand;
    const model = div.dataset.model;
    const price = parseFloat(div.dataset.price);

    if (brand && model && !isNaN(price)) {
      if (!brandModelPriceMap[brand]) {
        brandModelPriceMap[brand] = {};
      }
      if (!brandModelPriceMap[brand][model]) {
        brandModelPriceMap[brand][model] = new Set();
      }
      brandModelPriceMap[brand][model].add(price);
    }
  });

  // Convert all sets to sorted arrays
  for (const brand in brandModelPriceMap) {
    for (const model in brandModelPriceMap[brand]) {
      brandModelPriceMap[brand][model] = Array.from(brandModelPriceMap[brand][model]).sort((a,b) => a-b);
    }
  }
}

window.onload = async function () {
  await initializeBrandModelPriceMap();

  const brandSelect = document.getElementById('brandDrop');
  const modelSelect = document.getElementById('modelDrop');
  const priceSelect = document.getElementById('priceFilter');
  const searchBtn = document.getElementById('searchBtn');


  // Helper to populate model dropdown based on brand
  function populateModels(selectedBrand) {
    let options = '<option value="">Any Model</option>';
    if (brandModelPriceMap[selectedBrand]) {
      Object.keys(brandModelPriceMap[selectedBrand]).forEach(model => {
        options += `<option value="${model}">${model}</option>`;
      });
    }
    modelSelect.innerHTML = options;
    modelSelect.value = "";
  }

  // Helper to populate price dropdown based on brand and model
  function populatePrices(selectedBrand, selectedModel) {
    priceSelect.innerHTML = '<option value="">No max price</option>';

    let prices = [];

    if (selectedBrand && selectedModel && brandModelPriceMap[selectedBrand] && brandModelPriceMap[selectedBrand][selectedModel]) {
      prices = brandModelPriceMap[selectedBrand][selectedModel];
    } else if (selectedBrand && brandModelPriceMap[selectedBrand]) {
      // Collect all prices from all models of selected brand
      const models = Object.keys(brandModelPriceMap[selectedBrand]);
      models.forEach(model => {
        prices = prices.concat(brandModelPriceMap[selectedBrand][model]);
      });
      prices = Array.from(new Set(prices)).sort((a,b) => a-b); // unique & sorted
    } else {
      // No brand/model selected, collect prices from all cars
      const allPrices = [];
      for (const b in brandModelPriceMap) {
        for (const m in brandModelPriceMap[b]) {
          allPrices.push(...brandModelPriceMap[b][m]);
        }
      }
      prices = Array.from(new Set(allPrices)).sort((a,b) => a-b);
    }

    prices.forEach(price => {
      priceSelect.innerHTML += `<option value="${price}">$${price.toLocaleString()}</option>`;
    });
  }

  // Event: When brand changes
  brandSelect.addEventListener('change', function () {
    const selectedBrand = brandSelect.value;
    populateModels(selectedBrand);
    populatePrices(selectedBrand, ""); // reset price filter accordingly
  });

  // Event: When model changes
  modelSelect.addEventListener('change', function () {
    const selectedBrand = brandSelect.value;
    const selectedModel = modelSelect.value;
    populatePrices(selectedBrand, selectedModel);
  });

  // Filter vehicles on search button click
  searchBtn.addEventListener('click', function () {
    const selectedBrand = brandSelect.value.toLowerCase();
    const selectedModel = modelSelect.value.toLowerCase();
    const selectedPrice = priceSelect.value;

    const vehicleCards = document.querySelectorAll('.gallery_section_2 .col-md-4');

    vehicleCards.forEach(card => {
      const cardBrand = card.dataset.brand.toLowerCase();
      const cardModel = card.dataset.model.toLowerCase();
      const cardPrice = parseFloat(card.dataset.price) || 0;

      let show = true;

      if (selectedBrand && cardBrand !== selectedBrand) {
        show = false;
      }
      if (selectedModel && cardModel !== selectedModel) {
        show = false;
      }
      if (selectedPrice) {
        const maxPrice = parseFloat(selectedPrice);
        if (cardPrice > maxPrice) {
          show = false;
        }
      }

      card.style.display = show ? '' : 'none';
    });
  });

  // Initialize filters on page load (all data)
  populateModels("");
  populatePrices("", "");
};


function validate(event) {
    

    let password = document.getElementById("password").value;
    let confirm = document.getElementById("confirm").value;
    
	if(password){
	
    if (password !== confirm) {
        alert("Passwords do not match.");
		event.preventDefault(); // Prevents form from actually submitting
        return false;
    }

    const specialChars = "@!#$%^&*";
    const Caps = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    let containsSpecial = false;
    let Capitals = false;

    for (let char of Caps) {
        if (password.includes(char)) {
            Capitals = true;
            break;
        }
    }

    for (let char of specialChars) {
        if (password.includes(char)) {
            containsSpecial = true;
            break;
        }
    }

    if (!Capitals) {
        alert("Password must contain at least one Capital. ");
		event.preventDefault(); // Prevents form from actually submitting
        return false;
    }

    if (!containsSpecial) {
        alert("Password must contain at least one special character (@, !, #, $, %, ^, &, *).");
		event.preventDefault(); // Prevents form from actually submitting
        return false;
    }

    if (password.length < 8) {
        alert("Password must be at least 8 characters long.");
		event.preventDefault(); // Prevents form from actually submitting
        return false;
    }

    alert("Password is valid!");
    return true;
}
}

function login(event){
	    

	    let password = document.getElementById("password").value;
	    
	    const specialChars = "@!#$%^&*";
	    const Caps = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	    let containsSpecial = false;
	    let Capitals = false;

	    for (let char of Caps) {
	        if (password.includes(char)) {
	            Capitals = true;
	            break;
	        }
	    }

	    for (let char of specialChars) {
	        if (password.includes(char)) {
	            containsSpecial = true;
	            break;
	        }
	    }

	    if (!Capitals) {
	        alert("Password must contain at least one Capital. ");
			event.preventDefault(); // Prevents form from actually submitting
	        return false;
	    }

	    if (!containsSpecial) {
	        alert("Password must contain at least one special character (@, !, #, $, %, ^, &, *).");
			event.preventDefault(); // Prevents form from actually submitting
	        return false;
	    }


}
