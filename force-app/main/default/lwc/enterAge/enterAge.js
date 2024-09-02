import { LightningElement } from 'lwc';
export default class FirstComponent extends LightningElement {
    ageData;
    showAge = false;
    handleChange(event){    
        console.log('first console-->', event.target.value);
        this.ageData = event.target.value;
    }
    handleShow() {
        this.showAge = true;
    }

}