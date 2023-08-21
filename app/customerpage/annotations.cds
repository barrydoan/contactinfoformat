using from '../../srv/contact-service';
using from '../../db/schema';

annotate ContactService.Customers with @(UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Value: firstName,
        Label: '{i18n>firstname}',
    },
    {
        $Type: 'UI.DataField',
        Value: lastName,
        Label: '{i18n>lastname}',
    },
    {
        $Type: 'UI.DataField',
        Value: manager,
        Label: '{i18n>Manager}',
    },
    {
        $Type     : 'UI.DataField',
        Value     : telephone,
        Label     : '{i18n>telephone}',
        @UI.Hidden: {$edmJson: {$Eq: [
            {$Path: 'visibleContactDetail'},
            false
        ]}}
    },
    {
        $Type     : 'UI.DataField',
        Value     : email,
        Label     : '{i18n>email}',
        @UI.Hidden: {$edmJson: {$Eq: [
            {$Path: 'visibleContactDetail'},
            false
        ]}}
    },
    {
        $Type: 'UI.DataField',
        Value: visibleContactDetail,
        Label: '{i18n>visiblecontactdetail}',
    },
]);

annotate ContactService.Customers with @(
    UI.Facets                  : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>CustomerInfo}',
            ID    : 'CustomerInfo',
            Target: '@UI.FieldGroup#CustomerInfo',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>ContactInfo}',
            ID    : 'ContactInfo',
            Target: '@UI.FieldGroup#ContactInfo',
        },
    ],
    UI.FieldGroup #CustomerInfo: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: firstName,
                Label: '{i18n>firstname}',
            },
            {
                $Type: 'UI.DataField',
                Value: lastName,
                Label: '{i18n>lastname}',
            },
            {
                $Type: 'UI.DataField',
                Value: manager,
                Label: '{i18n>Manager}',
            },
        ],
    }
);

annotate ContactService.Customers with @(UI.HeaderInfo: {
    TypeName      : 'Customer',
    TypeNamePlural: 'Customers',
});

annotate ContactService.Customers with {
    manager @(
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Users',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: manager,
                    ValueListProperty: 'username',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'email',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'phone',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'website',
                },
            ],
        },
        Common.ValueListWithFixedValues: true
    )
};

annotate ContactService.Customers with @(UI.FieldGroup #ContactInfo: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Value: visibleContactDetail,
            Label: 'visibleContactDetail',
        },
        {
            $Type: 'UI.DataField',
            Value: telephone,
            Label: 'telephone',
        },
        {
            $Type: 'UI.DataField',
            Value: email,
            Label: 'email',
        },
    ],
});
