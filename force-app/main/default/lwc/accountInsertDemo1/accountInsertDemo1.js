import { LightningElement,wire } from 'lwc';
import  {refreshApex}  from '@salesforce/apex';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import AccountInsert from '@salesforce/apex/AccountDemo.AccountInsert';
import getAccount from '@salesforce/apex/AccountDemo.getAccount';
import { NavigationMixin } from 'lightning/navigation';
import deleteAllAccount from '@salesforce/apex/AccountDemo.deleteAllAccount';
import deleteAccount from '@salesforce/apex/AccountDemo.deleteAccount';
export default class AccountInsertDemo1 extends NavigationMixin(LightningElement) {
    
    actions = [
        { label: 'View', name: 'View' },
        { label: 'Edit', name: 'Edit' },
        { label: 'Delete', name: 'Delete' }
    ];
    column = [  { label: 'Name', fieldName: 'Name' },
        { label: 'Rating', fieldName: 'Rating' },
        {
            type: 'action',
            typeAttributes: { rowActions: this.actions },
        },
    ]
    RatingOption = [  { label: 'Hot', value: 'Hot' },
        { label: 'Cold', value: 'Cold' },
        { label: 'Warm', value: 'Warm' },]

    selectedrating = '';   
     name = '';
     active = '';
    Accounts = [];
    isModalOpen = false;
    currentRecordId;

//wire as Property
@wire(getAccount)
getAccounts(result) {
    const { data, error }  = result;
    this.wiredData = result;
    if (data) {
        this.Accounts = data;
        console.log('data', data);
    }
    else
        console.log('error', error);
}
   
    handleName(event) {
        this.name = event.target.value;
    }

    handleRating(event) {
        this.selectedrating = event.target.value;
    }

    handleActive_c(event) {
        this.active = event.target.checked;
    }

    handleSubmit() {
        // Call the Apex method with correct parameters
        let temp = {'Name': this.name, 'Rating' : this.rating, 'Active__c': 'Yes' };
        AccountInsert({ Account :temp})
            .then(result => {
                console.log('Account created:', result);
                this.navigateToRecordPage(result.Id);
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }
    navigateToRecordPage(recordId) {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: recordId,
                objectApiName: 'Account',
                actionName: 'view'
            }
        });
    }
    handleRowAction( event ) {
 
        const actionName = event.detail.action.name;
        console.log(actionName)
        const row = event.detail.row;
        switch ( actionName ) {
            case 'Delete':
                this.deleteRow(row.Id);
                break;
            case 'View':
                this[NavigationMixin.Navigate]({
                    type: 'standard__recordPage',
                    attributes: {
                        recordId: row.Id,
                        actionName: 'view'
                    }
                });
                break;
            case 'Edit':
                this.currentRecordId = row.Id;
                this.isModalOpen = true;
                this.template.querySelector('c-edit-modal').setRecord(row);
                break;
            default:
        }
    }
    deleteRow(id) {
        deleteAccount({ accountId: id })
            .then(() => { 
                refreshApex(this.wiredData)
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Success',
                    message: 'Record deleted',
                    variant: 'success'
                }));
            })
            .catch(error => {
                this.dispatchEvent(new ShowToastEvent({
                    title: 'Error',
                    message: 'Error deleting record',
                    variant: 'error'
                }));
                console.error('Error deleting record', error);
            });
    }
    getSelectedRec() {
        const selectedRecords = this.template.querySelector("lightning-datatable").getSelectedRows();
        console.log('Test1:' , JSON.stringify(selectedRecords))
        //  ids = selectedRecords.id;
        console.log('Test',JSON.stringify(selectedRecords))
        deleteAllAccount({ idList: selectedRecords })
        .then((result) => { 
            refreshApex(this.wiredData)
            console.log(result)
            this.dispatchEvent(new ShowToastEvent({
                title: 'Success',
                message: 'Record deleted',
                variant: 'success'
            }));
        })
        .catch(error => {
            this.dispatchEvent(new ShowToastEvent({
                title: 'Error',
                message: 'Error deleting records',
                variant: 'error'
            }));
            console.error('Error deleting records', error);
        });
}
    handleCloseModal() {
        this.isModalOpen = false;
        return refreshApex(this.accounts); // Refresh the datatable data after update
    }
}
