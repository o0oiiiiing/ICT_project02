class SideBar {
    constructor(target, direction) {
        if(typeof target === 'string'){
            this.target = document.querySelector(target);
        }else{
            this.target = target;
        }

        this.direction = direction;
        this.opend = false;
        this.width = this.target.offsetWidth;
        this.init();
    }

    init() {
        this.target.style[this.direction] = `-${this.width}px`;
    }

    open() {
        if(this.opend){
            this.close();
            return;
        }
        this.opend = true;
        this.target.style[this.direction] = `0`;
    }

    close() {
        this.target.style[this.direction] = `-${this.width}px`;
        this.opend = false;
    }
}
