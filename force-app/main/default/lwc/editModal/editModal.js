import { LightningElement, } from 'lwc';
import updateAccount from '@salesforce/apex/AccountDemo.updateAccount';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class EditModal extends LightningElement {
     isOpen = false;
     recordId;
    account = {};

    ratingOptions = [
        { label: 'Hot', value: 'Hot' },
        { label: 'Cold', value: 'Cold' },
        { label: 'Warm', value: 'Warm' }
    ];

    setRecord(record) {
        this.account = { ...record };
    }

    handleNameChange(event) {
        this.account.Name = event.target.value;
    }

    handleRatingChange(event) {
        this.account.Rating = event.target.value;
    }

    handleActiveChange(event) {
        this.account.Active__c = event.target.checked;
    }

    handleSave() {
        updateAccount({ account: this.account })
            .then(() => {
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Success',
                    message: 'Account updated successfully',
                    variant: 'success'
                }));
                this.dispatchEvent(new CustomEvent('close'));
            })
            .catch(error => {
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Error',
                    message: 'Error updating account',
                    variant: 'error'
                }));
                console.error('Error:', error);
            });
    }

    handleClose() {
        this.dispatchEvent(new CustomEvent('close'));
    }
}
