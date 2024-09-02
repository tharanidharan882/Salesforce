import { LightningElement, wire } from 'lwc';
import  {refreshApex}  from '@salesforce/apex';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import getContact from '@salesforce/apex/LightningApexSectionController.getContact';
import insertContact from '@salesforce/apex/LightningApexSectionController.insertContact';
import inserContactList from '@salesforce/apex/LightningApexSectionController.inserContactList';
export default class LightningApexSection extends LightningElement {
    searchText = '';
    draftvalues=[];
    contacts;
    column = [
    { label: 'First Name', fieldName: 'FirstName' ,editable:true},
    { label: 'Last Name', fieldName: 'LastName',editable:true },
    { label: 'Email', fieldName: 'Email',editable:true },
    { label: 'Account Name', fieldName: 'AccountName' }
];
    //wire as Property
    @wire(getContact, { nameValue: "$searchText" })
    getContacts(result) {
        const { data, error }  = result;
        this.wiredData = result;
        if (data) {
            this.contacts = data;
            console.log('data', data);
        }
        else
            console.log('error', error);
    }
    handlesave(event){
        console.log(this.draftvalues);
           console.log(event.detail.draftValues);
        inserContactList({contactList : event.detail.draftValues}).then((result) => {
            console.log('success',result);
        }).catch((err) => {
            console.log(err)
        });

    }

    handleChange(event) {
        this.searchText = event.target.value;
    }

    handleFirstName(event) {
        this.firstName = event.target.value;
    }

    hanldeLastName(event) {
        this.lastName = event.target.value;
    }

    hanldeEmail(event) {
        this.email = event.target.value;
    }

    handleSubmit() {
        //wire as function

        let temp = {'FirstName' :  this.firstName, 'LastName' :this.lastName, 'Email' : this.email};

        insertContact({contact : temp}).then((result) => {
            this.dispatchEvent(new ShowToastEvent({
                title: 'Contact Created staus',
                message: 'Contact Created',
                variant: 'success'
            }));
            this.contacts = result;
            console.log(JSON.stringify(result))
            refreshApex(this.wiredData);
        }).catch((err) => {
            this.dispatchEvent(new ShowToastEvent({
                title: 'Contact Created staus',
                message: 'Contact Not Created',
                variant: 'Failed'
            }))
            this.contacts = err;
            console.log(JSON.stringify('err',err));
        });
    }



}