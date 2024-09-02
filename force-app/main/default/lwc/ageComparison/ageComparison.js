import { LightningElement } from 'lwc';

export default class AgeComparison extends LightningElement {
    ageData;
    agelimit;
    value;
    showAge = false;
    handleChange(event) {
        console.log(event.target.value);
        this.ageData = event.target.value;
    }
    checkAgeLimit(event) {
        console.log(event.target.value)
        this.agelimit = event.target.value;
    }
    handleShow() {
        this.output();
        this.showAge = true;
    }
    output() {
        if (this.agelimit > this.ageData) {
            this.value = 'Age limit exceeded';
            console.log('Age limit exceeded');
        }
        else {
            this.value = 'Age limit not exceeded';
            console.log('Age limit not exceeded');
        }
    }
}