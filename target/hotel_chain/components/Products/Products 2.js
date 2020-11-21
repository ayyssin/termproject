class Products {
    constructor() {
        this.classNameActive = 'products-element__btn_active';
        this.labelAdd = 'Book now';
        this.labelRemove = 'Chosen';
    }

    handlerSetLocatStorage(element, id) {
        const {pushProduct, products} = localStorageUtil.putProducts(id);
        let presentBooking = localStorageUtil.isPresent(id);
    
        if (pushProduct && presentBooking) {
            element.classList.add(this.classNameActive);
            element.innerText = this.labelRemove;
        } else {
            element.classList.remove(this.classNameActive);
            element.innerText = this.labelAdd;
        }

        headerPage.render(products.length);
    }

    render() {
        const productsStore = localStorageUtil.getProducts();
        let htmlCatalog = '';

        CATALOG.forEach(({id, name, price, img, description, number}) => {
            let activeClass = '';
            let activeText = '';

            if (productsStore.indexOf(id) === -1) {
                activeText = this.labelAdd;
            } else {
                activeClass = ' ' + this.classNameActive;
                activeText = this.labelRemove;
            }

            htmlCatalog += `
                <li class="products-element">
                    <span class="products-element__name">${name}</span>
                    <img class="products-element__img" src="${img}" />
                    <span class="products-element__dscr">${description}</span>
                    <div class="pricing">
                        <span class="products-element__price">
                            ⚡️ ${price.toLocaleString()} USD
                        </span>
                        <input type="number" class="products-element__number" value="1">
                        <script>
                             let num = document.getElementsByClassName('products-element__number').value;
                             localStorage.setItem('number', 'num');
                        </script>
                    </div>
                    <button class="products-element__btn${activeClass}" onclick="productsPage.handlerSetLocatStorage(this, '${id}');">
                        ${activeText}
                    </button>
                </li>
            `;
        });

        const html = `
            <ul class="products-container">
                ${htmlCatalog}
            </ul>
        `;

        ROOT_PRODUCTS.innerHTML = html;
    }
};

const productsPage = new Products();
