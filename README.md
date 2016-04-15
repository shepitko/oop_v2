## Tasks(OOP)  
### Library  
* Book: title, author  
* Order: book, reader, date  
* Reader: name, email, city, street, house  
* Author: name, biography  
* Library: books, orders, readers, authors   
 
### Write program that determines:  
* Who often takes the book  
* What is the most popular book  
* How many people ordered one of the three most popular books  
* Save all Library data to file(s)  
* Get all Library data from file(s)  

## My Library  
// get all existing data libraries  
library = Library.new  
  
// method statistic shows: the best book, the best reader and How many people ordering one of the three most popular books  
library.statistic  
  
// method get_all - shows all libraries  
library.get_all  
  
// method save_library - save all data to json   
library.save_library  
  
// method add_object-  creates any object for instance_class( Book Order Reader Author )  
example library.add_object(Author.new("Djerom Selinger", ""))  



