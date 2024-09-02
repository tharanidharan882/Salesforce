import { LightningElement, track } from 'lwc';

export default class SearchList extends LightningElement {

   result = [];
    data = [
        { name: "surya", age: 40, phone: 75 },
        { name: "Ajith", age: 45, phone: 56 },
        { name: "vijay", age: 46, phone: 12 },
        { name: "rajini", age: 70, phone: 78 },
        { name: "kamal", age: 80, phone: 63 }
    ];
    Entervalue = '';

    columns = [
        { label: 'Name', fieldName: 'name' },
        { label: 'Age', fieldName: 'age' },
        { label: 'Phone', fieldName: 'phone' }
    ];

    handleInputChange(event) {
        this.Entervalue = event.target.value.toLowerCase();

        if (this.Entervalue) {
            this.result = this.data.filter(item => 
                item.name.toLowerCase().includes(this.Entervalue)
            );
        } else {
            this.result = [...this.data];
        }
    }
}