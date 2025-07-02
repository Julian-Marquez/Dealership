let brandModelMap = {};

async function initializeBrandModelMap() {
  const carDivs = document.querySelectorAll('.vehicle-item');
  brandModelMap = {};

  carDivs.forEach(div => {
    const brand = div.dataset.brand;
    const model = div.dataset.model;

    if (brand && model) {
      if (!brandModelMap[brand]) {
        brandModelMap[brand] = new Set();
      }
      brandModelMap[brand].add(model);
    }
  });

  // Convert sets to arrays
  for (const brand in brandModelMap) {
    brandModelMap[brand] = Array.from(brandModelMap[brand]).sort();
  }
}

window.onload = async function () {
	
  fetchData();
  await initializeBrandModelMap();

  const brandSelect = document.getElementById('brandDrop');

  brandSelect.addEventListener('change', function () {
    const selectedBrand = brandSelect.value;
    populateModels(selectedBrand);
  });
};

function populateModels(selectedBrand) {
  const modelSelect = document.getElementById('modelDrop');
  let options = '<option value="">Any Model</option>';
  if (brandModelMap[selectedBrand]) {
    brandModelMap[selectedBrand].forEach(model => {
      options += `<option value="${model}">${model}</option>`;
    });
  }
  else{
	options += `<option value="${model}">Error loading brands</option>`;
  }
  modelSelect.innerHTML = options;
  modelSelect.value = "";
}

  async function fetchData(){
  // ========== STATE & CITY DROPDOWNS ==========
  const username = 'marquezjulian09'; // GeoNames username
  const countryCode = 'US';

  const usStates = [
    { name: 'Alabama', code: 'AL' },
    { name: 'Alaska', code: 'AK' },
    { name: 'Arizona', code: 'AZ' },
    { name: 'Arkansas', code: 'AR' },
    { name: 'California', code: 'CA' },
    { name: 'Colorado', code: 'CO' },
    { name: 'Connecticut', code: 'CT' },
    { name: 'Delaware', code: 'DE' },
    { name: 'Florida', code: 'FL' },
    { name: 'Georgia', code: 'GA' },
    { name: 'Hawaii', code: 'HI' },
    { name: 'Idaho', code: 'ID' },
    { name: 'Illinois', code: 'IL' },
    { name: 'Indiana', code: 'IN' },
    { name: 'Iowa', code: 'IA' },
    { name: 'Kansas', code: 'KS' },
    { name: 'Kentucky', code: 'KY' },
    { name: 'Louisiana', code: 'LA' },
    { name: 'Maine', code: 'ME' },
    { name: 'Maryland', code: 'MD' },
    { name: 'Massachusetts', code: 'MA' },
    { name: 'Michigan', code: 'MI' },
    { name: 'Minnesota', code: 'MN' },
    { name: 'Mississippi', code: 'MS' },
    { name: 'Missouri', code: 'MO' },
    { name: 'Montana', code: 'MT' },
    { name: 'Nebraska', code: 'NE' },
    { name: 'Nevada', code: 'NV' },
    { name: 'New Hampshire', code: 'NH' },
    { name: 'New Jersey', code: 'NJ' },
    { name: 'New Mexico', code: 'NM' },
    { name: 'New York', code: 'NY' },
    { name: 'North Carolina', code: 'NC' },
    { name: 'North Dakota', code: 'ND' },
    { name: 'Ohio', code: 'OH' },
    { name: 'Oklahoma', code: 'OK' },
    { name: 'Oregon', code: 'OR' },
    { name: 'Pennsylvania', code: 'PA' },
    { name: 'Rhode Island', code: 'RI' },
    { name: 'South Carolina', code: 'SC' },
    { name: 'South Dakota', code: 'SD' },
    { name: 'Tennessee', code: 'TN' },
    { name: 'Texas', code: 'TX' },
    { name: 'Utah', code: 'UT' },
    { name: 'Vermont', code: 'VT' },
    { name: 'Virginia', code: 'VA' },
    { name: 'Washington', code: 'WA' },
    { name: 'West Virginia', code: 'WV' },
    { name: 'Wisconsin', code: 'WI' },
    { name: 'Wyoming', code: 'WY' }
  ];


  const stateDropdown = document.getElementById('states');
  const cityDropdown = document.getElementById('cities');

  usStates.forEach(state => {
    const option = document.createElement('option');
    option.value = state.code;
    option.textContent = state.name;
    stateDropdown.appendChild(option);
  });

  // Listen for state selection
  stateDropdown.addEventListener('change', async function () {
    const stateCode = this.value;
    if (stateCode) {
      const cities = await fetchCities(stateCode);
      populateCitiesDropdown(cities);
    } else {
      cityDropdown.innerHTML = '<option value="">-- Select City --</option>';
      cityDropdown.disabled = true;
    }
  });

  async function fetchCities(adminCode1) {
    const url = `https://secure.geonames.org/searchJSON?country=${countryCode}&adminCode1=${adminCode1}&featureClass=P&maxRows=1000&username=${username}`;

    try {
      const response = await fetch(url);
      const data = await response.json();
      const cityNames = data.geonames.map(city => city.name);
      return [...new Set(cityNames)].sort(); // Remove duplicates and sort
    } catch (error) {
      alert('Error fetching cities: ' + error);
      return [];
    }
  }

  function populateCitiesDropdown(cityNames) {
    let display = '<option value="">-- Select City --</option>';
    if (cityNames.length > 0) {
      cityNames.forEach(city => {
        display += `<option value="${city}">${city}</option>`;
      });
      cityDropdown.disabled = false;
    } else {
      display = '<option value="">No cities found</option>';
      cityDropdown.disabled = true;
    }
    cityDropdown.innerHTML = display;
  }
};


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