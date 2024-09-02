import { LightningElement } from 'lwc';

export default class valueAdd extends LightningElement {
    vehicleOptions = [
        { label: 'Car', value: 'car' },
        { label: 'Truck', value: 'truck' },
        { label: 'Motorcycle', value: 'motorcycle' },
    ];

    selectedVehicle = '';
    numberOfVehicles = 0;
    vehicles = false;
    vehicleList = [];

    handleVehicleChange(event) {
        this.selectedVehicle = event.detail.value;
    }

    handleNumberChange(event) {
        this.numberOfVehicles = event.detail.value;
    }

    add() {
        let temp1 =this.vehicleList;
        this.vehicleList = [];
        let temp = { vehicle: this.selectedVehicle, number: this.numberOfVehicles };
        temp1.push(temp);
        this.vehicleList = temp1;
    }

    handleAddClick() {
        this.vehicles = true;
        this.add();
    }
handleDel(event) {
        const vehicleToDelete = event.target.dataset.id;
        this.vehicleList = this.vehicleList.filter(vehicle => vehicle.vehicle !== vehicleToDelete);
        console.log(JSON.stringify(this.vehicleList));
    }
}