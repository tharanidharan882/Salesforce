import { LightningElement } from 'lwc';

export default class MytoDoList extends LightningElement {

    newTask = '';
    tasks = [];

    handleInputChange(event) {
        this.newTask = event.target.value;
    }

    addTask() {
        if (this.newTask.trim()) {
            const newTaskItem = {
                id: this.tasks.length,
                name: this.newTask
            };
            console.log(JSON.stringify(newTaskItem));
            this.tasks = [...this.tasks, newTaskItem];
            
            this.newTask = ''; 
        }
    }

    deleteTask(event) {
        const taskId = event.target.dataset.id;
        this.tasks = this.tasks.filter(task => task.id != taskId);
    }
}