namespace saffyre.pos;

using {managed} from '@sap/cds/common';

@cds.persistence.name: 'SAFFYRE_POS_CUSTOMERS'

entity Customers {

    key id    : String;

        name  : String;

        email : String;

        phone : String;

}

@cds.persistence.name: 'SAFFYRE_POS_MATERIALS'

entity Materials {

    key materialId  : String;

        description : String;

        price       : Decimal(10, 2);

        category    : String;

        stock       : Integer;

}

@cds.persistence.name: 'SAFFYRE_POS_INVOICES'

entity Invoices : managed {

    key invoiceNumber : String;

        customerName  : String;

        customerEmail : String;

        grandTotal    : Decimal(10, 2);

        items         : Composition of many InvoiceItems
                            on items.parent = $self;

}

@cds.persistence.name: 'SAFFYRE_POS_INVOICEITEMS'

entity InvoiceItems {

    key ID          : UUID;

        parent      : Association to Invoices;

        materialId  : String;

        description : String;

        qty         : Integer;

        price       : Decimal(10, 2);

}
