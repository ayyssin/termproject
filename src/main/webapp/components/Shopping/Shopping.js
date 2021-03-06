class Shopping {
    constructor() {
        this.labelAdd = 'Confirm';
        this.classNameActive = 'products-element__btn_active';
        this.labelRemove = 'Confirmed';
    }

    handlerClear() {
        ROOT_SHOPPING.innerHTML = '';
    }

    render() {
        const productsStore = localStorageUtil.getProducts();
        let htmlCatalog = '';
        let sumCatalog = 0;
        CATALOG.forEach(({id, name, price, number}) => {
            if (productsStore.indexOf(id) !== -1) {
                htmlCatalog += `
                    <tr>
                        <td class="shopping-element__name">⚡️ ${name}</td>
                        <td class="shopping-element__price">${price.toLocaleString()} USD</td>
                        <td class="shopping-element__number">x ${number.toLocaleString()}</td>
                    </tr>
                `;
                sumCatalog += price * number;
            }
        });

        let activeClass = '';
        let activeText = '';

        if (productsStore.indexOf(id) === -1) {
            activeText = this.labelAdd;
        } else {
            activeClass = ' ' + this.classNameActive;
            activeText = this.labelRemove;
        }

        const html = `
            <div class="shopping-container">
                <div class="shopping__close" onclick="shoppingPage.handlerClear();"></div>
                <table>
                    ${htmlCatalog}
                    <tr>
                        <td class="shopping-element__name">💥 Total:</td>
                        <td class="shopping-element__price">${sumCatalog.toLocaleString()} USD</td>
                    </tr>
                </table>
                <button class="shopping-element__btn${activeClass}" onclick="">
                        ${activeText}
                    </button>
            </div>
        `;

        ROOT_SHOPPING.innerHTML = html;
    }
};

const shoppingPage = new Shopping();
