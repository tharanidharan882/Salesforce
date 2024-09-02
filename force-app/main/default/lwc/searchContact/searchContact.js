import { LightningElement, wire } from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getContactList';
import getSearchContactList from '@salesforce/apex/ContactController.getSearchContactList';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class SearchContact extends LightningElement {
    allContactList = [];
    allSearchContactList = [];
    contactList = [];
    selectedPageSize = 100;
    pageNumber = 0;
    searchText = '';
    totalRecord = 0;

    get pageSize() {
        return [
            { label: '5', value: 5 },
            { label: '10', value: 10 },
            { label: '15', value: 15 },
            { label: '20', value: 20 },
            { label: '100', value: 100 }]
    }

    @wire(getContactList) getAllContact({ error, data }) {
        if (data) {
            this.allContactList = data;
            this.totalRecord = this.allContactList.length;
        } else {
            console.log("!! ", error);
        }
        
    }
   
    handlePageSize(e){
        this.pageNumber = 0;
        this.selectedPageSize = parseInt(e.detail.value)
        console.log(this.selectedPageSize)
    }

    handleSearch() {
        this.pageNumber = 0;
        this.searchText = '';
        this.searchText = this.template.querySelector(".searchText").value;
        console.log(this.searchText);
        getSearchContactList({ search : this.searchText }).then(data => {
            this.allSearchContactList = data;
            this.totalRecord = this.allSearchContactList.length;
            if (this.allSearchContactList.length == 0) {
                const events = new ShowToastEvent({
                    title: 'Error Message',
                    message: 'Search Not Found',
                    variant: 'error',
                });
                this.dispatchEvent(events);
                this.contactList = [];
                this.totalRecord = this.allSearchContactList.length;
            }
            
        }).catch(err => {
            console.log(err);
        })
    }

    get displayContactList() {
        //console.log(this.searchText);
        var firstRecord = this.pageNumber;
        var lastRecord = this.pageNumber + this.selectedPageSize;
        if (this.searchText == '') {
            this.contactList = this.allContactList.slice(firstRecord, lastRecord);
            //this.totalRecord = this.allContactList.length;
        } else {
            this.contactList = this.allSearchContactList.slice(firstRecord, lastRecord)
            //this.totalRecord = this.allSearchContactList.length;
        }
        return this.contactList;
    }

    first() {
        this.pageNumber = 0;
        
    }

    previous() {
        this.pageNumber = this.pageNumber - this.selectedPageSize;
        
    }

    next() {
        this.pageNumber = this.pageNumber + this.selectedPageSize;
        //console.log(this.pageNumber, this.selectedPageSize);
    }

    last() {
        this.pageNumber = this.totalRecord - this.selectedPageSize;
        //console.log(this.pageNumber); 
    }

    get disableNext() {
        return this.pageNumber + this.selectedPageSize >= this.totalRecord || this.totalRecord == 0;
    }

    get disableFirst() {
        return this.pageNumber < this.selectedPageSize;
    }
}