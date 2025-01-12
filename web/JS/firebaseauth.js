import { initializeApp } from "https://www.gstatic.com/firebasejs/11.1.0/firebase-app.js";
import { getAuth } from "https://www.gstatic.com/firebasejs/11.1.0/firebase-auth.js";
import { getFirestore, addDoc, collection } from "https://www.gstatic.com/firebasejs/11.1.0/firebase-firestore.js";

const firebaseConfig = {
    apiKey: "AIzaSyDQaecIrOy6e4yc8vKkDaTmTB0hx2myhqA",
    authDomain: "innolympics-c68ba.firebaseapp.com",
    projectId: "innolympics-c68ba",
    storageBucket: "innolympics-c68ba.appspot.com",
    messagingSenderId: "850771391386",
    appId: "1:850771391386:web:f14e9223ad30a529294023",
};

const app = initializeApp(firebaseConfig);
const db = getFirestore();
const auth = getAuth();

document.addEventListener('DOMContentLoaded', () => {
    const regionDropdown = document.getElementById('region');
    const cityDropdown = document.getElementById('city');
    const form = document.getElementById('admin-registration-form');
    const messageContainer = document.getElementById('message-container');

    const philippines = {
        'NCR': ['Caloocan', 'Las Piñas', 'Makati', 'Malabon', 'Mandaluyong', 'Manila', 'Marikina', 'Muntinlupa', 'Navotas', 'Parañaque', 'Pasay', 'Pasig', 'Quezon City', 'San Juan', 'Taguig', 'Valenzuela'],
        // Other regions...
    };

    // Populate the regions dropdown
    Object.keys(philippines).forEach(region => {
        const option = document.createElement('option');
        option.value = region;
        option.textContent = region;
        regionDropdown.appendChild(option);
    });

    // Update the cities dropdown when a region is selected
    regionDropdown.addEventListener('change', () => {
        const selectedRegion = regionDropdown.value;

        // Clear the city dropdown
        cityDropdown.innerHTML = '<option value="">Select City</option>';

        if (selectedRegion && philippines[selectedRegion]) {
            philippines[selectedRegion].forEach(city => {
                const option = document.createElement('option');
                option.value = city;
                option.textContent = city;
                cityDropdown.appendChild(option);
            });
        }
    });

    form.addEventListener('submit', async (event) => {
        event.preventDefault();

        const birthdate = new Date(form.birthdate.value);
        const today = new Date();
        const age = today.getFullYear() - birthdate.getFullYear();
        const isValidAge = birthdate && age >= 18;

        if (!isValidAge) {
            showMessage('You must be at least 18 years old.', 'error');
            return;
        }

        const formData = {
            firstName: form.firstName.value.trim(),
            lastName: form.lastName.value.trim(),
            middleName: form.middleName.value.trim() || null,
            sex: form.sex.value,
            birthdate: form.birthdate.value,
            email: form.email.value.trim(),
            region: form.region.value,
            city: form.city.value,
        };

        try {
            const docRef = await addDoc(collection(db, 'admins'), formData);
            showMessage(`Registration successful! ID: ${docRef.id}`, 'success');
            form.reset();
            cityDropdown.innerHTML = '<option value="">Select City</option>'; // Reset city dropdown
        } catch (error) {
            console.error('Error adding document:', error);
            showMessage('An error occurred. Please try again.', 'error');
        }
    });

    function showMessage(message, type) {
        messageContainer.textContent = message;
        messageContainer.className = type; // Add class for styling based on type
    }
});
