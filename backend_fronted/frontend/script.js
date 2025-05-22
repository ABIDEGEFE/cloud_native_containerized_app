document.addEventListener('DOMContentLoaded', () => {
    const uploadForm = document.getElementById('uploadForm');
    const gallery = document.getElementById('gallery');

    // Load items on page load
    fetchItems();

    // Handle form submission
    uploadForm.addEventListener('submit', async (e) => {
        e.preventDefault();
        
        const formData = new FormData();
        formData.append('name', document.getElementById('name').value);
        formData.append('price', document.getElementById('price').value);
        formData.append('image', document.getElementById('image').files[0]);

        try {
            const response = await fetch('/api/items/', {
                method: 'POST',
                body: formData
            });

            if (!response.ok) {
                const error = await response.json();
                throw new Error(error.detail || 'Upload failed');
            }

            uploadForm.reset();
            fetchItems();
        } catch (error) {
            console.error('Error:', error);
            alert(error.message || 'Failed to upload item');
        }
    });

    // Fetch and display items
    async function fetchItems() {
        try {
            const response = await fetch('/api/items/');
            if (!response.ok) {
                throw new Error('Failed to fetch items');
            }
            const items = await response.json();
            
            gallery.innerHTML = '';
            
            items.forEach(item => {
                const itemElement = document.createElement('div');
                itemElement.className = 'gallery-item';
                
                itemElement.innerHTML = `
                    <img src="${item.image_url}" alt="${item.name}">
                    <div class="item-info">
                        <h3>${item.name}</h3>
                        <p>$${item.price.toFixed(2)}</p>
                    </div>
                `;
                
                gallery.appendChild(itemElement);
            });
        } catch (error) {
            console.error('Error fetching items:', error);
            gallery.innerHTML = '<p>Error loading items. Please try again.</p>';
        }
    }
});