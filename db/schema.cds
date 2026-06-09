namespace saffyre.pos;
 
using { managed, cuid } from '@sap/cds/common';
 
// 1. Customer Master Table
entity Customers {
    key id    : String;
    name      : String;
    email     : String;
    phone     : String;
}
 
// 2. Material Master Table
entity Materials {
    key materialId  : String;
    description     : String;
    price           : Decimal(10, 2);
    category        : String;
    stock           : Integer;
}
 
// 3. Invoice Header Table
//@cds.persistence.exists // Ye backend ko batata hai ki table exist karti hai, naya mat banao
//@cds.persistence.name : 'SAFFYRE_POS_INVOICES' // Forcefully mapping
entity Invoices :  managed {
    key invoiceNumber : String; 
    customerName      : String;
    customerEmail     : String;
    grandTotal        : Decimal(10, 2);
    items             : Composition of many InvoiceItems on items.parent = $self;
}
 
// 4. Invoice Line Items (Child Table)
entity InvoiceItems  {
    key ID: UUID;
    parent         : Association to Invoices;
    materialId     : String;
    description    : String;
    qty            : Integer;
    price          : Decimal(10, 2);
}