using ContactService as service from '../../srv/contact-service';

annotate service.Customers with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'firstName',
            Value : firstName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'lastName',
            Value : lastName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'telephone',
            Value : telephone,
        },
        {
            $Type : 'UI.DataField',
            Label : 'email',
            Value : email,
        },
    ]
);
annotate service.Customers with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'First name',
                Value : firstName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Last name',
                Value : lastName,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>telephone}',
                Value : telephone,
            },
            {
                $Type : 'UI.DataField',
                Label : 'email',
                Value : email,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
annotate service.Customers with {
    firstName @Common.FieldControl : #Mandatory
};
