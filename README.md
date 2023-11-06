# Neobis_iOS_ToDo

## Table of contents
* [Description](#description)
* [Getting started](#getting-started)
* [Usage](#usage)
* [Running the Tests](#running-the-tests)
* [Workflow](#workflow)
* [Design](#design)
  
## Description 

This is the third project in Neobis Club. Application has two views connected by segues and closures. App also has table customized table view with several delegates and data sources. Design of project created by storyboard. 

## Getting started 

- Make sure you have the XCode version 14.0 or above installed on your computer
- Download the project files from the repository
- Open the project files in Xcode
- Run the active scheme by using any emulator (No install requirements for this project)

## Usage

This time we have more actions on application. On first view when you launch the app, user will see two buttons (add task / switch to editing mode). When user clicks "+" button, the second view will appears with 2 text fields: tasks' name and description. 
After clicking "save"/"cancel" buttons, user go back to the first view with new cells in table view, if user clicks "save". By clicking "pencil" button, table view will change mode to "Editing", in which user can delete and move cells by each other.
The main function of ToDo is save and manipulate with users' data on table view.

## Running the Tests

First of all, I tested auto-layout functionality by running different versions of apps. And each of them we have all components from design and they placed on right place.
Also tested all actions of cells in table view. Fixed bug with adding/editing empty named tasks.

## Workflow

- Reporting Bugs:
    If you come across any bugs while using this project, please report us by creating an issue on the Github repository
- Submitting pull requests:
    If you have a bug fix or a new feature for project, feel free to submit a pull request. Make sure that your changes are well-tested.
- Improving documentation:
    If you notice any errors or mistakes in the documentation, you can submit pull request with your changes
- Providing feedback:
    If you have any feedback, you can send an email to project maintainer

## Design

Below is a screenshot of how application looks like on iphone 14:

1) Main view (0 and several tasks):
   
   <img width="399" alt="Снимок экрана 2023-11-06 в 01 45 33" src="https://github.com/KryaKa57/Neobis_iOS_ToDoApp/assets/132449744/a205eca1-c62a-4865-9042-7e0631a0c23b">
   <img width="399" alt="Снимок экрана 2023-11-06 в 01 41 21" src="https://github.com/KryaKa57/Neobis_iOS_ToDoApp/assets/132449744/7d97095d-0bc8-4934-9f29-655b9054c620">

2) Editing mode of table view cells:
   
   <img width="399" alt="Снимок экрана 2023-11-06 в 01 41 49" src="https://github.com/KryaKa57/Neobis_iOS_ToDoApp/assets/132449744/7308ffa9-7e71-4db7-b8be-f710efe45db4">
   <img width="399" alt="Снимок экрана 2023-11-06 в 01 53 22" src="https://github.com/KryaKa57/Neobis_iOS_ToDoApp/assets/132449744/ed2b0cc7-0a92-472d-9a2e-3ae516b2ac80">

3) Adding/Editing tasks view: 

   <img width="399" alt="Снимок экрана 2023-11-06 в 02 10 13" src="https://github.com/KryaKa57/Neobis_iOS_ToDoApp/assets/132449744/53b867a9-750b-4350-94e2-814b33c8770b">
   <img width="399" alt="Снимок экрана 2023-11-06 в 01 42 47" src="https://github.com/KryaKa57/Neobis_iOS_ToDoApp/assets/132449744/0c413472-c185-41a5-9b08-5365e29ea68d">
   
