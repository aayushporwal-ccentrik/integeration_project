namespace saffyre.pos;

using { managed } from '@sap/cds/common';

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
entity Invoices : managed {
    key id          : UUID;
    invoiceNumber   : String;
    customerName    : String;
    customerEmail   : String;
    grandTotal      : Decimal(10, 2);
    items           : Composition of many InvoiceItems on items.parent = $self;
}

// 4. Invoice Line Items (Child Table)
entity InvoiceItems {
    key id          : UUID;
    parent          : Association to Invoices;
    materialId      : String;
    description     : String;
    qty             : Integer;
    price           : Decimal(10, 2);
}