drop database if exists finalExamMod3;
create database finalExamMod3;
use finalExamMod3;

create table products
(
    productId   int primary key not null,
    productName nvarchar(255),
    price       float,
    quantity    int,
    color       nvarchar(255),
    categoryId  int
);

create table categories
(
    categoryId  int primary key,
    categoryName nvarchar(255)
);

alter table products
    add foreign key (categoryId) references categories (categoryId);

insert into categories
values (1,'Phone'),
(2,'Television');

insert into products
values (1, 'iPhone 11', 799.0, 12, 'Purple, Yellow, Green', 1),
       (2, 'iPhone 11 Pro', 1100.0, 12, 'Green, Black, White', 1),
       (3, 'iPhone X', 749.0, 13, 'Coral, Black, Blue', 1),
       (4, 'Smart TX màn hình cong 4K UHD 49 inch RU7300', 10000000, 5, 'Black', 2),
       (5, 'SAMSUNG GALAXY S10E', 420.0, 10, 'Priam White, Prism Blue, Ceramic Black', 1);