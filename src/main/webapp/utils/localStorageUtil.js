class LocalStorageUtil {
    constructor() {
        this.keyName = 'products';
    }
    getProducts() {
        const productsLocalStorage = localStorage.getItem(this.keyName);
        if (productsLocalStorage !== null) {
            return JSON.parse(productsLocalStorage);
        }
        return [];
    }
    putProducts(id) {
        let products = this.getProducts();
        let pushProduct = false;
        const index = products.indexOf(id);

        if (index === -1) {
            products.push(id);
            pushProduct = true;
        } else {
            products.splice(index, 1);
        }

        localStorage.setItem(this.keyName, JSON.stringify(products));

        return { pushProduct, products };
    }
    removeProduct(id){
        let products = this.getProducts();
        let pushProduct = false;
        const index = products.indexOf(id);

        if(index != -1){
            products.splice(index, 1);
            pushProduct = true;
        }

        localStorage.setItem(this.keyName, JSON.stringify(products));
    }
    isPresent(id){
        let products = this.getProducts();
        const index = products.indexOf(id);

        if(index != -1){
           return true;
        }
        
        return false;
    }

};

const localStorageUtil = new LocalStorageUtil();
