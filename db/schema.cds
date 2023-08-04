namespace com.sap.contactinfo;

using {
    managed,
    cuid
} from '@sap/cds/common';

@odata.draft.enabled
entity Customers : managed {
    key ID                   : UUID       @(Core.Computed: true);
        firstName            : String(20) @mandatory;
        lastName             : String(20);
        visibleContactDetail : Boolean;
        telephone            : String(20);
        email                : String(20);
        comment              : String;
        manager              : String;
}

@cds.persistence.skip
entity Users {
    username : String;
    name     : String;
    email    : String;
    phone    : String;
    website  : String;
}
