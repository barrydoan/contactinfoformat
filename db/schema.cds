namespace com.sap.contactinfo;

using {managed, cuid } from '@sap/cds/common';

@odata.draft.enabled
entity Customers: managed, cuid {
    firstName: String(20);
    lastName: String(20);
    telephone: String(20);
    email: String(20);
}