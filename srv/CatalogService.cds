using { saffyre.pos as my } from '../db/schema';

service CatalogService {
    entity Customers as projection on my.Customers;
    entity Materials as projection on my.Materials;
    entity Invoices  as projection on my.Invoices;
    entity InvoiceItems as projection on my.InvoiceItems;
        
}